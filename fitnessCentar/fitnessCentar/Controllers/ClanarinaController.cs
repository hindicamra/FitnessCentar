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
    [Authorize(Roles = "Korisnik, Admin,Uposlenik")]

    public class ClanarinaController : BaseCRUDController<Model.Clanarina, Model.SearchObjects.ClanarinaSearchObject, ClanarinaInsertRequest, ClanarinaUpdateRequest>
    {

        public ClanarinaController(ILogger<BaseController<Model.Clanarina, Model.SearchObjects.ClanarinaSearchObject>> logger, IClanarinaService service)
                : base(logger, service)
        {
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        public override Task<Clanarina> Insert([FromBody] ClanarinaInsertRequest insert)
        {
            return base.Insert(insert);
        }
        [ApiExplorerSettings(IgnoreApi = true)]
        public override Task<Clanarina> Update(int id, [FromBody] ClanarinaUpdateRequest update)
        {
            return base.Update(id, update);
        }
        [ApiExplorerSettings(IgnoreApi = true)]
        public override Task Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
