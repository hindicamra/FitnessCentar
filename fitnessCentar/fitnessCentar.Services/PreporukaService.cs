using fitnessCentar.Model;
using Microsoft.ML;
using Microsoft.ML.Data;
using Microsoft.ML.Trainers;

namespace fitnessCentar.Services
{
    public class PreporukaService
	{
        private readonly IRezervacijaService _rezervacijaService;

		public PreporukaService(IRezervacijaService rezervacijaService)
		{
            _rezervacijaService = rezervacijaService;
		}

        private const double V = 0.00001;
        static object isLocked = new object();
        static MLContext mlContext = null;
        static ITransformer model = null;

        public async Task<List<Preporuka>> Get(int accountId)
        {
            List<Rezervacija> allReservations;

            var result = await _rezervacijaService.Get();

            allReservations = result.Result;
            lock (isLocked)
            {
                if (mlContext == null)
                {
                    mlContext = new MLContext();
                    var data = new List<RecommendationEntry>();
                    var traindata = mlContext.Data.LoadFromEnumerable(data);
                    var options = new MatrixFactorizationTrainer.Options()
                    {
                        MatrixColumnIndexColumnName = nameof(RecommendationEntry.RecommendationID),
                        MatrixRowIndexColumnName = nameof(RecommendationEntry.CoPurchaseRecommendationID),
                        LabelColumnName = "Label",
                        LossFunction = MatrixFactorizationTrainer.LossFunctionType.SquareLossOneClass,
                        Alpha = 0.01,
                        Lambda = 0.025,
                        NumberOfIterations = 100,
                        C = V
                    };

                    var trainer = mlContext.Recommendation().Trainers.MatrixFactorization(options);
                    model = trainer.Fit(traindata);
                }
            }

            var predictionResult = new List<Tuple<Rezervacija, float>>();

            foreach (var reservation in allReservations)
            {
                var predictionEngine = mlContext.Model.CreatePredictionEngine<RecommendationEntry, CoPurchase_prediction>(model);
                var prediction = predictionEngine.Predict(new RecommendationEntry()
                {
                    RecommendationID = (uint)accountId,
                    CoPurchaseRecommendationID = (uint)reservation.RezervacijaId
                });

                predictionResult.Add(new Tuple<Rezervacija, float>(reservation, prediction.Score));
            }

            var finalResult = predictionResult.OrderByDescending(x => x.Item2).Select(x => x.Item1).Take(3).ToList();

            var recommendations = finalResult.Select(reservation => new Preporuka
            {
                Korisnik = reservation.Korisnik,
                TreningId = (int)reservation.TreningId
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

