using fitnessCentar.Model.Requests;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    [Authorize(Roles = "Korisnik")]
    public class PlacanjaController: BaseCRUDController<Model.Placanja, Model.SearchObjects.PlacanjaSearchObject, PlacanjaInsertRequest, PlacanjaUpdateRequest>
    {
        public PlacanjaController(ILogger<BaseController<Model.Placanja, Model.SearchObjects.PlacanjaSearchObject>> logger, IPlacanjaService service)
          : base(logger, service)
        {
        }
    }
}
