using System.Data;
using fitnessCentar.Model;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    [Authorize(Roles = "Admin")]
    public class UlogaController : BaseController<Uloga, UlogaSearchObject>
    {
        public UlogaController(ILogger<BaseController<Uloga, UlogaSearchObject>> logger, IUlogaService service) : base(logger, service)
        {
        }
    }
}
