using System;
using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;

namespace fitnessCentar.Services
{
	public class RecenzijaService : BaseCRUDService<Model.Recenzija, Database.Recenzija, RecenzijaSearchObject, RecenzijaInsertRequest, RecenzijaUpdateRequest>, IRecenzijaService
	{
		public RecenzijaService(FitnessCentarContext context, IMapper mapper)
			: base(context, mapper)
		{
		}
	}
}

