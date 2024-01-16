using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using fitnessCentar.Services.Exceptions;
using Microsoft.EntityFrameworkCore;

namespace fitnessCentar.Services
{
    public class ClanarinaService : BaseCRUDService<Model.Clanarina, Database.Clanarina, ClanarinaSearchObject, ClanarinaInsertRequest, ClanarinaUpdateRequest>, IClanarinaService
    {
        private readonly ITipClanarineService _tipClanarineService;

        public ClanarinaService(FitnessCentarContext context, IMapper mapper, ITipClanarineService tipClanarineService) : base(context, mapper)
        {
            _tipClanarineService = tipClanarineService;
        }

        public override IQueryable<Database.Clanarina> AddInclude(IQueryable<Database.Clanarina> query, ClanarinaSearchObject? search = null)
        {
            query = query.Include("Korisnik")
                         .Include("TipClanarine");
            return base.AddInclude(query, search);
        }

        public override async Task BeforeInsert(Database.Clanarina entity, ClanarinaInsertRequest insert)
        {
            var tipClanarine = await _tipClanarineService.GetById(insert.TipClanarineId);

            if (tipClanarine is null)
            {
                throw new UserException("Tip clanarine ne postiji");
            }

            entity.VaziDo = DateTime.Now.AddDays(tipClanarine.Trajanje);
        }
    }
}
