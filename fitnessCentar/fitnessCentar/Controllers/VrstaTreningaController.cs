using fitnessCentar.Model.Requests;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    public class VrstaTreningaController: BaseCRUDController<Model.VrstaTreninga, Model.SearchObjects.VrstaTreningaSearchObject, VrstaTreningaInsertRequest, VrstaTreningaUpdateRequest>
    {
        public VrstaTreningaController(ILogger<BaseController<Model.VrstaTreninga, Model.SearchObjects.VrstaTreningaSearchObject>> logger, IVrstaTreningaService service)
            : base(logger, service)
        {
        }
    
    }
}
