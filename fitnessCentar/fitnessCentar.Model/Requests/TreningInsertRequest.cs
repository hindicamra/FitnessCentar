using System;
using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
	public class TreningInsertRequest
	{
        [Required]
        public int VrstaTreningaId { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string Opis { get; set; } = null!;
    }
}

