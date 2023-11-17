using System;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;

namespace fitnessCentar.Services
{
	public interface ITreningService : ICRUDService<Model.Trening, TreningSearchObject, TreningInsertRequest, TreningUpdateRequest>
    {
	}
}

