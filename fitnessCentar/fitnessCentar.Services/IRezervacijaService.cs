using System;
using fitnessCentar.Model.Requests;

namespace fitnessCentar.Services
{
	public interface IRezervacijaService : ICRUDService<Model.Rezervacija, Model.SearchObjects.RezervacijaSearchObject, RezervacijaInsertRequest, RezervacijaUpdateRequest>
    {
	}
}
