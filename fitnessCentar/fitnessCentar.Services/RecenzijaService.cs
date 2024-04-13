using System;
using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using fitnessCentar.Services.Exceptions;
using Microsoft.EntityFrameworkCore;

namespace fitnessCentar.Services
{
	public class RecenzijaService : BaseCRUDService<Model.Recenzija, Database.Recenzija, RecenzijaSearchObject, RecenzijaInsertRequest, RecenzijaUpdateRequest>, IRecenzijaService
	{
		public RecenzijaService(FitnessCentarContext context, IMapper mapper)
			: base(context, mapper)
		{
		}

        public override IQueryable<Database.Recenzija> AddInclude(IQueryable<Database.Recenzija> query, RecenzijaSearchObject? search = null)
        {
            query = query.Include("Korisnik");
            return base.AddInclude(query, search);
        }

        public override IQueryable<Recenzija> AddFilter(IQueryable<Recenzija> query, RecenzijaSearchObject? search = null)
        {
            query = query.Include(x => x.Korisnik);

            if (search?.ImePrezime != null)
            {
                string searchTerm = search.ImePrezime;
                query = query.Where(x => x.Korisnik.Ime.Contains(searchTerm) || x.Korisnik.Prezime.Contains(searchTerm));
            }
            return base.AddFilter(query, search);
        }

        public override Task BeforeInsert(Recenzija entity, RecenzijaInsertRequest insert)
        {

            var existingRecenzija =  _context.Recenzijas.FirstOrDefaultAsync(r => r.KorisnikId == insert.KorisnikId && r.TreningId == insert.TreningId);

            if (existingRecenzija.Result != null)
            {
                throw new UserException("Ne mozete ocijeniti isti trening vise puta");
            }

            return base.BeforeInsert(entity, insert);
        }
    }
}

