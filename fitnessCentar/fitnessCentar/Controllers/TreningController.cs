using System;
using fitnessCentar.Model.Requests;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
	[ApiController]
	public class TreningController : BaseCRUDController<Model.Trening, Model.SearchObjects.TreningSearchObject, TreningInsertRequest, TreningUpdateRequest>
	{
		public TreningController(ILogger<BaseController<Model.Trening, Model.SearchObjects.TreningSearchObject>> logger, ITreningService service)
			: base(logger, service)
		{
		}
	}
}

