using System;
using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;

namespace fitnessCentar.Services
{
	public class RezervacijaService : BaseCRUDService<Model.Rezervacija, Database.Rezervacija, RezervacijaSearchObject, RezervacijaInsertRequest, RezervacijaUpdateRequest>, IRezervacijaService
    {
		public RezervacijaService(FitnessCentarContext context, IMapper mapper)
			: base(context, mapper)
		{
		}
	}
}

