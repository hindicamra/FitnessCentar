using System;
using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using Microsoft.EntityFrameworkCore;

namespace fitnessCentar.Services
{
	public class RezervacijaService : BaseCRUDService<Model.Rezervacija, Database.Rezervacija, RezervacijaSearchObject, RezervacijaInsertRequest, RezervacijaUpdateRequest>, IRezervacijaService
    {
		public RezervacijaService(FitnessCentarContext context, IMapper mapper)
			: base(context, mapper)
		{
		}

        public override IQueryable<Database.Rezervacija> AddInclude(IQueryable<Database.Rezervacija> query, RezervacijaSearchObject? search = null)
        {
            query = query.Include("Korisnik");
            return base.AddInclude(query, search);
        }
    }
}

