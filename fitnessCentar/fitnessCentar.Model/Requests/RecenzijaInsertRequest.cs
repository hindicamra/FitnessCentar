using System;
using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
	public class RecenzijaInsertRequest
	{
        [Required]
        public int KorisnikId { get; set; }

        [Required]
        public int TreningId { get; set; }

        public string? Tekst { get; set; } = null!;

        [Required]
        public int Ocjena { get; set; }
    }
}

