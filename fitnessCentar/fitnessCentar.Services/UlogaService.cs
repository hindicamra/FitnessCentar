using AutoMapper;
using fitnessCentar.Model;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public class UlogaService: BaseService<Model.Uloga, Database.Uloga, UlogaSearchObject>, IUlogaService
    {
        public UlogaService(FitnessCentarContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}
