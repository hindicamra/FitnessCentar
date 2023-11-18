using fitnessCentar.Model.Requests;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    public class PlanIshraneController: BaseCRUDController<Model.PlanIshrane, Model.SearchObjects.PlanIshraneSearchObject, PlanIshraneInsertRequest, PlanIshraneUpdateRequest>
    {
        public PlanIshraneController(ILogger<BaseController<Model.PlanIshrane, Model.SearchObjects.PlanIshraneSearchObject>> logger, IPlanIshraneService service)
            : base(logger, service)
        {
        }
    }
}
