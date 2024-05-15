using System;
using AutoMapper;
using fitnessCentar.Model;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Model.Status;
using fitnessCentar.Services.Database;
using fitnessCentar.Services.Exceptions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace fitnessCentar.Services
{
    public class RezervacijaService : BaseCRUDService<Model.Rezervacija, Database.Rezervacija, RezervacijaSearchObject, RezervacijaInsertRequest, RezervacijaUpdateRequest>, IRezervacijaService
    {
        private readonly IKorisnikService _korisnikService;
        private readonly ITreningService _treningService;
        private readonly IClanarinaService _clanarinaService;
        private readonly IEmailService _emailService;
        private readonly IServiceProvider _serviceProvider;


        public RezervacijaService(FitnessCentarContext context, IMapper mapper,
            IKorisnikService korisnikService, IClanarinaService clanarinaService, IEmailService emailService, ITreningService treningService, IServiceProvider serviceProvider)
            : base(context, mapper)
        {
            _korisnikService = korisnikService;
            _clanarinaService = clanarinaService;
            _emailService = emailService;
            _treningService = treningService;
            _serviceProvider = serviceProvider;
        }

        public override IQueryable<Database.Rezervacija> AddInclude(IQueryable<Database.Rezervacija> query, RezervacijaSearchObject? search = null)
        {
            query = query.Include("Korisnik");
            return base.AddInclude(query, search);
        }
        public override IQueryable<Database.Rezervacija> AddFilter(IQueryable<Database.Rezervacija> query, RezervacijaSearchObject? search = null)
        {
            if (search != null)
            {
                if (search.KorisnikId.HasValue)
                {
                    query = query.Where(r => r.KorisnikId == search.KorisnikId.Value);
                }
                if (search.Datum.HasValue)
                {
                    query = query.Where(r => r.Datum.Date == search.Datum.Value.Date);
                }

                if (search.ImePrezime!=null)
                {
                    query=query.Where(r=>r.Korisnik!.Ime.Contains(search.ImePrezime) || r.Korisnik.Prezime.Contains(search.ImePrezime));
                }
                if (search.Status.HasValue)
                {
                    query=query.Where(r=>r.Status==search.Status.ToString());
                }

                
                
            }

            return base.AddFilter(query, search);
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

            if (clanarina.Count == 0)
            {
                throw new UserException("Korisnik nije clan");
            }

            if (clanarina.Result?.FirstOrDefault()?.VaziDo < DateTime.Now)
            {
                throw new UserException("Clanarina nije validna");
            }
            if (insert.Datum<DateTime.Now)
            {
                throw new UserException("Rezervacija nije moguća za trenutnti datum ili datume iz prošlosti");
            }


            
            var rezervacijaService = _serviceProvider.GetService(typeof(IRezervacijaService)) as IRezervacijaService;

            var existingReservation = await rezervacijaService.Get(new RezervacijaSearchObject()
            {
                KorisnikId = korisnik.KorisnikId,
                Datum = insert.Datum
            });

            if (existingReservation.Count > 0)
            {
                throw new UserException("Već ste rezervisali za ovaj datum");
            }

            entity.Status = Enum.GetName(typeof(StatusRezervacije), StatusRezervacije.NaCekanju);

            ReservationNotifier reservation = new ReservationNotifier
            {
                Trening = trening.Naziv,
                Email = korisnik.Email,
                Datum = insert.Datum,
                
            };

            _emailService.SendingObject(reservation);
        }

        public override async Task<Model.Rezervacija> Update(int id, RezervacijaUpdateRequest update)
        {
            var rezervacija= await _context.Rezervacijas.FindAsync(id);
            if (rezervacija==null)
            {
                throw new UserException("Rezervacija ne postoji");
            }

            if (rezervacija!=null)
            {
                if (rezervacija.Datum<=DateTime.Now)
                {
                    throw new UserException("Rezervacija je završena");
                }
            }


                return await base.Update(id, update);
        }


    }
}

