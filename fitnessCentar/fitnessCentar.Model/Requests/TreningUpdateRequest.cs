using System;
using System.ComponentModel.DataAnnotations;
using Xunit.Abstractions;

namespace fitnessCentar.Model.Requests
{
	public class TreningUpdateRequest
    {
        public int? VrstaTreningaId { get; set; }

        [StringLength(500, ErrorMessage = "Opis ne smije biti duži od 500 karaktera.")]
        public string? Opis { get; set; } = null!;
    }
}

