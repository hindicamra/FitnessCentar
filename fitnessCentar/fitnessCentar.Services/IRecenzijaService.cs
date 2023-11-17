using System;
using fitnessCentar.Model.Requests;

namespace fitnessCentar.Services
{
	public interface IRecenzijaService : ICRUDService<Model.Recenzija, Model.SearchObjects.RecenzijaSearchObject, RecenzijaInsertRequest, RecenzijaUpdateRequest>
	{
	}
}

