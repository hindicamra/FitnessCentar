using fitnessCentar.Model;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    public class UlogaController : BaseController<Uloga, UlogaSearchObject>
    {
        public UlogaController(ILogger<BaseController<Uloga, UlogaSearchObject>> logger, IService<Uloga, UlogaSearchObject> service) : base(logger, service)
        {
        }
    }
}
