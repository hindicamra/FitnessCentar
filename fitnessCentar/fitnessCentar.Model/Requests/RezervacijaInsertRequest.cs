using System;
using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
	public class RezervacijaInsertRequest
	{
        [Required]
        public int? TreningId { get; set; }

        [Required]
        public int? KorisnikId { get; set; }

        public DateTime? Datum { get; set; } = DateTime.Now;
    }
}

