using System.Data;
using fitnessCentar.Model;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [ApiController]
    [Authorize(Roles = "Admin,Korisnik")]
    [ApiExplorerSettings(IgnoreApi = true)]
    public class ClanarinaController : BaseCRUDController<Model.Clanarina, Model.SearchObjects.ClanarinaSearchObject, ClanarinaInsertRequest, ClanarinaUpdateRequest>
    {

        public ClanarinaController(ILogger<BaseController<Model.Clanarina, Model.SearchObjects.ClanarinaSearchObject>> logger, IClanarinaService service)
                : base(logger, service)
        {
        }
    }
}
