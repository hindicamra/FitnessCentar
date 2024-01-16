using System;
using System.ComponentModel.DataAnnotations;
using fitnessCentar.Model.Status;

namespace fitnessCentar.Model.Requests
{
	public class RezervacijaUpdateRequest
	{
        [Required(ErrorMessage = "Datum je obavezno polje.")]

        public DateTime Datum { get; set; }

        public StatusRezervacije Status { get; set; }
    }
}

