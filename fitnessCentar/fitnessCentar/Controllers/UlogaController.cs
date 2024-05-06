using System.Data;
using fitnessCentar.Model;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{

    
    public class UlogaController : BaseController<Uloga, UlogaSearchObject>
    {
        public UlogaController(ILogger<BaseController<Uloga, UlogaSearchObject>> logger, IUlogaService service) : base(logger, service)
        {
        }

        //[Authorize(Roles = "Korisnik")]
        public override Task<PagedResult<Uloga>> Get([FromQuery] UlogaSearchObject search)
        {
            return base.Get(search);
        }


    }
}
 