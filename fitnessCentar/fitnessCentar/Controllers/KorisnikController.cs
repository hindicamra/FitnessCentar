using fitnessCentar.Model;
using fitnessCentar.Model.Requests;
using fitnessCentar.Services;

using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class KorisnikController : BaseCRUDController<Model.Korisnik, Model.SearchObjects.KorisnikSearchObject, KorisnikInsertRequest, KorisnikUpdateRequest>
    {
        public KorisnikController(ILogger<BaseController<Model.Korisnik, Model.SearchObjects.KorisnikSearchObject>> logger, IKorisnikService service) : base(logger, service)
        {
        }

    }
}
