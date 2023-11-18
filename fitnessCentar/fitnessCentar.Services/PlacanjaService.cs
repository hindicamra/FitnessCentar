using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public class PlacanjaService : BaseCRUDService<Model.Placanja, Database.Placanja, PlacanjaSearchObject, PlacanjaInsertRequest, PlacanjaUpdateRequest>, IPlacanjaService
    {
        public PlacanjaService(FitnessCentarContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}
