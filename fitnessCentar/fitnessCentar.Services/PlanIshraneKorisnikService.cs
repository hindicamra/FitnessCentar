using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using fitnessCentar.Services.Exceptions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public class PlanIshraneKorisnikService : BaseCRUDService<Model.PlanIshraneKorisnik, Database.PlanIshraneKorisnik, PlanIshraneKorisnikSearchObject, PlanIshraneKorisnikInsertRequest, PlanIshraneKorisnikUpdateRequest>, IPlanIshraneKorisnikService
    {
        private readonly IKorisnikService _korisnikService;
        private readonly IPlanIshraneService _planIshraneService;

        public PlanIshraneKorisnikService(FitnessCentarContext context, IMapper mapper,
            IKorisnikService korisnikService, IPlanIshraneService planIshraneService)
            : base(context, mapper)
        {
            _korisnikService = korisnikService;
            _planIshraneService = planIshraneService;
        }

        public override IQueryable<Database.PlanIshraneKorisnik> AddInclude(IQueryable<Database.PlanIshraneKorisnik> query, PlanIshraneKorisnikSearchObject? search = null)
        {
            query = query.Include("Korisnik")
                         .Include("PlanIshrane");
            return base.AddInclude(query, search);
        }

        public override async Task BeforeInsert(Database.PlanIshraneKorisnik entity, PlanIshraneKorisnikInsertRequest insert)
        {
            var korisnik = await _korisnikService.GetById(insert.KorisnikId);

            var planIshrane = await _planIshraneService.GetById(insert.PlanIshraneId);

            if (korisnik is null || planIshrane is null)
            {
                throw new UserException("Nevalidni podaci");
            }
        }
    }
}
