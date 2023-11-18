using System;
using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
	public class TreningInsertRequest
	{
        [Required(ErrorMessage = "VrstaTreningaId je obavezno polje.")]
        public int VrstaTreningaId { get; set; }

        [Required(ErrorMessage = "Opis je obavezno polje.")]
        [StringLength(500, ErrorMessage = "Opis ne smije biti duži od 500 karaktera.")]
        public string Opis { get; set; } = null!;
    }
}

