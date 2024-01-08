using System;
using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
	public class RezervacijaInsertRequest
	{
        [Required(ErrorMessage = "TreningId je obavezno polje.")]
        public int TreningId { get; set; }

        [Required(ErrorMessage = "KorisnikId je obavezno polje.")]
        public int KorisnikId { get; set; }

        [Required(ErrorMessage = "Datum je obavezno polje.")]
        public DateTime Datum { get; set; } = DateTime.Now;
    }
}

