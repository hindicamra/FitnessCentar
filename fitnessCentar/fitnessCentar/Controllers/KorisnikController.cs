using fitnessCentar.Model.Requests;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class KorisnikController
    {
        private readonly IKorisnikService _service;
        private readonly ILogger<WeatherForecast> _logger;
        public KorisnikController(ILogger<WeatherForecast> logger, IKorisnikService service)
        {
            _logger = logger;
            _service = service;
        }

     
        [HttpPost]
        public Model.Korisnik Insert(KorisnikInsertRequest request)
        {
            return _service.Insert(request);
        }

        [HttpPut("{id}")]
        public Model.Korisnik Update(int id, KorisnikUpdateRequest request)
        {
            return _service.Update(id, request);
        }
    }
}
