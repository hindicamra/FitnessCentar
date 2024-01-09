using System;
using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
	public class TreningUpdateRequest
    {


        [StringLength(500, ErrorMessage = "Opis ne smije biti duži od 500 karaktera.")]
        public string? Opis { get; set; } = null!;

        public string Naziv { get; set; } = string.Empty;
    }
}

