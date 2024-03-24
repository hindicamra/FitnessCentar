using fitnessCentar.Model.Status;
using System;
namespace fitnessCentar.Model.SearchObjects
{
	public class RezervacijaSearchObject : BaseSearchObject
	{
        public int? KorisnikId { get; set; }
        public  DateTime? Datum { get; set; }
        public StatusRezervacije? Status { get; set; }
    }
}

