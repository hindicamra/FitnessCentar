using System.Data;
using fitnessCentar.Model.Requests;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    [Authorize(Roles = "Korisnik, Admin,Zaposlenik")]
    public class PlanIshraneKorisnikController: BaseCRUDController<Model.PlanIshraneKorisnik, Model.SearchObjects.PlanIshraneKorisnikSearchObject, PlanIshraneKorisnikInsertRequest, PlanIshraneKorisnikUpdateRequest>
    {
        
        public PlanIshraneKorisnikController(ILogger<BaseController<Model.PlanIshraneKorisnik, Model.SearchObjects.PlanIshraneKorisnikSearchObject>> logger, IPlanIshraneKorisnikService service)
         : base(logger, service)
        {
        }
    }
}
