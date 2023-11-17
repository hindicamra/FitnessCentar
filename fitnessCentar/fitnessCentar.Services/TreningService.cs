using System;
using AutoMapper;
using fitnessCentar.Model;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;

namespace fitnessCentar.Services
{
	public class TreningService : BaseCRUDService<Model.Trening, Database.Trening, TreningSearchObject, TreningInsertRequest, TreningUpdateRequest>, ITreningService
    {
		public TreningService(FitnessCentarContext context, IMapper mapper)
			: base(context, mapper)
		{
		}
    }
}

