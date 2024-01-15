using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using Microsoft.EntityFrameworkCore;

namespace fitnessCentar.Services
{
    public class ClanarinaService : BaseCRUDService<Model.Clanarina, Database.Clanarina, ClanarinaSearchObject, ClanarinaInsertRequest, ClanarinaUpdateRequest>, IClanarinaService
    {
        public ClanarinaService(FitnessCentarContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public override IQueryable<Database.Clanarina> AddInclude(IQueryable<Database.Clanarina> query, ClanarinaSearchObject? search = null)
        {
            query = query.Include("Korisnik")
                         .Include("TipClanarine");
            return base.AddInclude(query, search);
        }
    }
}
