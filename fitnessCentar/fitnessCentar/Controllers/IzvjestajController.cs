using fitnessCentar.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{

    [ApiController]
    [Route("[controller]")]
    [Authorize(Roles = "Admin")]
    public class IzvjestajController : Controller
    {

        protected readonly IIzvjestajService _service;
        public IzvjestajController(IIzvjestajService service)
        {
            _service = service;
        }

        [HttpGet("zaposlenici")]
        public async Task<Model.Izvjestaj> GetZaposlenici()
        {
            return await _service.GetZaposleniciIzvjestaj();
        }
        [HttpGet("korisnici")]
        public async Task<Model.Izvjestaj> GetKorisniciIzvjestaj()
        {
            return await _service.GetKorisniciIzvjestaj();
        }
        [HttpGet("rezervacije")]
        public async Task<Model.IzvjestajRezervacije> GetRezervacijeIzvjestaj()
        {
            return await _service.GetRezervacijeIzvjestaj();
        }
    }
}
