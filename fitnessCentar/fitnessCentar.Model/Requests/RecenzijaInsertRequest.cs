using System;
using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
	public class RecenzijaInsertRequest
	{
        [Required(ErrorMessage = "KorisnikId je obavezno polje.")]
        public int KorisnikId { get; set; }

        [Required(ErrorMessage = "TreningId je obavezno polje.")]
        public int TreningId { get; set; }

        [StringLength(500, ErrorMessage = "Tekst recenzije ne smije biti duži od 500 karaktera.")]
        public string? Tekst { get; set; } = null!;

        [Required(ErrorMessage = "Ocjena je obavezno polje.")]
        [Range(1, 5, ErrorMessage = "Ocjena mora biti između 1 i 5.")]
        public int Ocjena { get; set; }
    }
}

