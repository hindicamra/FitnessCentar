using fitnessCentar.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Identity.Client;

namespace fitnessCentar.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PreporukaController: Controller
    {
        protected readonly IPreporukaService _service;
        public PreporukaController(IPreporukaService service)
        {
            _service = service;
        }

        [Authorize(Roles = "Korisnik")]
        [HttpGet("{id}")]
        public async Task<IActionResult> GetPreporuke(int id)
        {
            try
            {
                var preporuke = await _service.Get(id);
                return Ok(preporuke);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }

    }
}
