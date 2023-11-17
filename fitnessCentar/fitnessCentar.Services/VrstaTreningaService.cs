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
    public class VrstaTreningaService : BaseCRUDService<Model.VrstaTreninga, VrstaTreninga, VrstaTreningaSearchObject, VrstaTreningaInsertRequest, VrstaTreningaUpdateRequest>, IVrstaTreningaService
    {
        public VrstaTreningaService(FitnessCentarContext context, IMapper mapper)
            : base(context, mapper)
        {
        }
    }
}
