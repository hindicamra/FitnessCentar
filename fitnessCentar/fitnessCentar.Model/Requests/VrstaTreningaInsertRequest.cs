using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class VrstaTreningaInsertRequest
    {
        [Required(ErrorMessage = "Naziv je obavezno polje.")]
        public string Naziv { get; set; } = null!;

        [StringLength(500, ErrorMessage = "Opis ne smije biti duži od 500 karaktera.")]
        public string? Opis { get; set; }
    }
}
