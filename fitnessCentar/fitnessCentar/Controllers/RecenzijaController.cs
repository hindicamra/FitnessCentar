using System;
using fitnessCentar.Model.Requests;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
	[ApiController]
	public class RecenzijaController : BaseCRUDController<Model.Recenzija, Model.SearchObjects.RecenzijaSearchObject, RecenzijaInsertRequest, RecenzijaUpdateRequest>
	{
		public RecenzijaController(ILogger<BaseController<Model.Recenzija, Model.SearchObjects.RecenzijaSearchObject>> logger, IRecenzijaService service)
			: base(logger, service)
		{
		}
	}
}

