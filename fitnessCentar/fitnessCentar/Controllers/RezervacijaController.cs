using System;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
	[ApiController]
	public class RezervacijaController : BaseCRUDController<Model.Rezervacija, Model.SearchObjects.RezervacijaSearchObject, RezervacijaInsertRequest, RezervacijaUpdateRequest>
	{
		public RezervacijaController(ILogger<BaseController<Model.Rezervacija, Model.SearchObjects.RezervacijaSearchObject>> logger, IRezervacijaService service)
			: base(logger, service)
		{
		}
	}
}

