using fitnessCentar.Model;
using Microsoft.ML;
using Microsoft.ML.Data;
using Microsoft.ML.Trainers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public class PreporukaService : IPreporukaService
    {
        private readonly IRezervacijaService _rezervacijaService;
            private readonly ITreningService _treningService;
        private readonly object _lockObject = new object();
        private static MLContext _mlContext;
        private static ITransformer _model;

        public PreporukaService(IRezervacijaService rezervacijaService, ITreningService treningService)
        {
            _rezervacijaService = rezervacijaService;
            _treningService=treningService;
        }

        public async Task<List<Preporuka>> Get(int accountId)
        {
            List<Rezervacija> allReservations;

            var result = await _rezervacijaService.Get();

            allReservations = result.Result;

            lock (_lockObject)
            {
                if (_mlContext == null)
                {
                    _mlContext = new MLContext();

                    if (allReservations.Any())
                    {
                        var data = allReservations.Select(r => new RecommendationEntry
                        {
                            RecommendationID = (uint)accountId,
                            CoPurchaseRecommendationID = (uint)r.RezervacijaId,
                            Label = 1 // or any appropriate value
                        }).ToList();

                        var traindata = _mlContext.Data.LoadFromEnumerable(data);
                        var options = new MatrixFactorizationTrainer.Options()
                        {
                            MatrixColumnIndexColumnName = nameof(RecommendationEntry.RecommendationID),
                            MatrixRowIndexColumnName = nameof(RecommendationEntry.CoPurchaseRecommendationID),
                            LabelColumnName = "Label",
                            LossFunction = MatrixFactorizationTrainer.LossFunctionType.SquareLossOneClass,
                            Alpha = 0.01,
                            Lambda = 0.025,
                            NumberOfIterations = 100,
                            C = 0.00001
                        };

                        var trainer = _mlContext.Recommendation().Trainers.MatrixFactorization(options);
                        _model = trainer.Fit(traindata);
                    }
                    else
                    {
                        throw new InvalidOperationException("No reservations data available for training the model.");
                    }
                }
            }

            var predictionResult = new List<Tuple<Rezervacija, float>>();

            foreach (var reservation in allReservations)
            {
                var predictionEngine = _mlContext.Model.CreatePredictionEngine<RecommendationEntry, CoPurchase_prediction>(_model);
                var prediction = predictionEngine.Predict(new RecommendationEntry()
                {
                    RecommendationID = (uint)accountId,
                    CoPurchaseRecommendationID = (uint)reservation.RezervacijaId
                });

                predictionResult.Add(new Tuple<Rezervacija, float>(reservation, prediction.Score));
            }

            

            var finalResult = predictionResult
    .OrderByDescending(x => x.Item2)
    .Select(x => x.Item1)
    .GroupBy(x => x.TreningId)  
    .Select(group => group.First())  
    .Take(3)
    .ToList();
            var recommendations = finalResult.Select(reservation => new Preporuka
            {
                Korisnik = reservation.Korisnik,
                Trening = _treningService.GetById((int)reservation.TreningId).Result
            }).ToList();

            return recommendations;
        }

        public class RecommendationEntry
        {
            [KeyType(count: 5000)]
            public uint RecommendationID { get; set; }

            [KeyType(count: 5000)]
            public uint CoPurchaseRecommendationID { get; set; }
            public float Label { get; set; }
        }

        public class CoPurchase_prediction
        {
            public float Score { get; set; }
        }
    }
}
