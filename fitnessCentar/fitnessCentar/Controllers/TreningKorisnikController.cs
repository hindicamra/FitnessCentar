using fitnessCentar.Model.Requests;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    public class TreningKorisnikController: BaseCRUDController<Model.TreningKorisnik, Model.SearchObjects.TreningKorisnikSearchObject, TreningKorisnikInsertRequest, TreningKorisnikUpdateRequest>
    {
        public TreningKorisnikController(ILogger<BaseController<Model.TreningKorisnik, Model.SearchObjects.TreningKorisnikSearchObject>> logger, ITreningKorisnikService service)
           : base(logger, service)
        {
        }
    }
}
