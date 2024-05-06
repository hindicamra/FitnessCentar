using fitnessCentar.Model;
using fitnessCentar.Model.Requests;
using fitnessCentar.Services;
using fitnessCentar.Services.Exceptions;
using Microsoft.AspNetCore.Authorization;
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
            _service = service;
        }

        [HttpPost("uposlenik")]
        //[Authorize(Roles = "Admin")]
        public virtual async Task<Model.Korisnik> InsertUposlenik([FromBody] KorisnikInsertRequest request)
        {
            request.UlogaId = (int)Model.Status.Uloga.Uposlenik;
            return await _service.Insert(request);
        }

        [HttpPost("korisnik"), AllowAnonymous]
        public override async Task<Model.Korisnik> Insert([FromBody] KorisnikInsertRequest request)
        {
            request.UlogaId = (int)Model.Status.Uloga.Korisnik;

            return await _service.Insert(request);
        }

        [HttpPut("uposlenik")]
       // [Authorize(Roles = "Admin")]
        public virtual async Task<Model.Korisnik> UpdateUposlenik(int id, [FromBody] KorisnikUpdateRequest request)
        {
            request.UlogaId = (int)Model.Status.Uloga.Uposlenik;
            return await _service.Update(id, request);
        }

        [HttpPut("korisnik")]
        public override async Task<Model.Korisnik> Update(int id, [FromBody] KorisnikUpdateRequest request)
        {
            request.UlogaId = (int)Model.Status.Uloga.Korisnik;
            return await _service.Update(id, request);
        }

        [HttpPost("login")]
        [AllowAnonymous]
        public virtual  async Task<Model.Korisnik> Login(string username, string password)
        {
            return  await _service.Login(username,password);
        }
    }
}
