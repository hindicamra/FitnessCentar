using System;
using AutoMapper;
using fitnessCentar.Model;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Model.Status;
using fitnessCentar.Services.Database;
using fitnessCentar.Services.Exceptions;
using Microsoft.EntityFrameworkCore;

namespace fitnessCentar.Services
{
    public class RezervacijaService : BaseCRUDService<Model.Rezervacija, Database.Rezervacija, RezervacijaSearchObject, RezervacijaInsertRequest, RezervacijaUpdateRequest>, IRezervacijaService
    {
        private readonly IKorisnikService _korisnikService;
        private readonly ITreningService _treningService;
        private readonly IClanarinaService _clanarinaService;
        private readonly IEmailService _emailService;

        public RezervacijaService(FitnessCentarContext context, IMapper mapper,
            IKorisnikService korisnikService, IClanarinaService clanarinaService, IEmailService emailService, ITreningService treningService)
            : base(context, mapper)
        {
            _korisnikService = korisnikService;
            _clanarinaService = clanarinaService;
            _emailService = emailService;
            _treningService = treningService;
        }

        public override IQueryable<Database.Rezervacija> AddInclude(IQueryable<Database.Rezervacija> query, RezervacijaSearchObject? search = null)
        {
            query = query.Include("Korisnik");
            return base.AddInclude(query, search);
        }

        public override async Task BeforeInsert(Database.Rezervacija entity, RezervacijaInsertRequest insert)
        {
            var korisnik = await _korisnikService.GetById(insert.KorisnikId);
            var trening = await _treningService.GetById(insert.TreningId);

            if (korisnik is null)
            {
                throw new UserException("Korisnik ne postoji");
            }


            if (trening is null)
            {
                throw new UserException("Trening ne postoji");
            }

            var clanarina = await _clanarinaService.Get(new ClanarinaSearchObject() { KorisnikId = korisnik.KorisnikId });

            if (clanarina.Result?.FirstOrDefault()?.VaziDo < DateTime.Now)
            {
                throw new UserException("Clanarina nije validna");
            }

            entity.Status = Enum.GetName(typeof(StatusRezervacije), StatusRezervacije.NaCekanju);

            ReservationNotifier reservation = new ReservationNotifier
            {
                Id = 1,
                Trening = trening.Naziv,
                Email = korisnik.Email,
                Datum = insert.Datum,
                Vrijeme = insert.Datum
            };


            _emailService.SendingObject(reservation);
        }


    }
}

