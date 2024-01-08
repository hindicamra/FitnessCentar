using System;
using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
	public class TreningInsertRequest
	{
      

        [Required(ErrorMessage = "Naziv je obavezno polje.")]
        [StringLength(500, ErrorMessage = "Naziv ne smije biti duži od 500 karaktera.")]
        public string Naziv { get; set; } = null!;
        [Required(ErrorMessage = "Opis je obavezno polje.")]
        [StringLength(500, ErrorMessage = "Opis ne smije biti duži od 500 karaktera.")]
        public string Opis { get; set; } = null!;
    }
}

