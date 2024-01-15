using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
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
        public PlanIshraneKorisnikService(FitnessCentarContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public override IQueryable<Database.PlanIshraneKorisnik> AddInclude(IQueryable<Database.PlanIshraneKorisnik> query, PlanIshraneKorisnikSearchObject? search = null)
        {
            query = query.Include("Korisnik")
                         .Include("PlanIshrane");
            return base.AddInclude(query, search);
        }
    }
}
