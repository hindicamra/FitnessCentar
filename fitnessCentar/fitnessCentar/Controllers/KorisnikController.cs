using fitnessCentar.Model;
using fitnessCentar.Model.Requests;
using fitnessCentar.Services;

using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    public class KorisnikController : BaseCRUDController<Model.Korisnik, Model.SearchObjects.KorisnikSearchObject, KorisnikInsertRequest, KorisnikUpdateRequest>
    {
        private  readonly IKorisnikService _service;

        public KorisnikController(ILogger<BaseController<Model.Korisnik, Model.SearchObjects.KorisnikSearchObject>> logger, IKorisnikService service)
            : base(logger, service)
        {
            _service=service;
        }


        
        [HttpPost("login")]
        public virtual  async Task<Model.Korisnik> Login(string username, string password)
        {
            return  await _service.Login(username,password);
        }
        
    }
}
