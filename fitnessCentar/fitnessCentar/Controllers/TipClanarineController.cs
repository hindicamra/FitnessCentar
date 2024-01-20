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
    [Authorize(Roles = "Admin")]
    public class TipClanarineController : BaseCRUDController<Model.TipClanarina, Model.SearchObjects.TipClanarineSearchObject, TipClanarinaInsertRequest, TipClanarinaUpdateRequest>
    {
        public TipClanarineController(ILogger<BaseController<Model.TipClanarina, Model.SearchObjects.TipClanarineSearchObject>> logger, ITipClanarineService service)
                : base(logger, service)
        {
        }
    }
}
