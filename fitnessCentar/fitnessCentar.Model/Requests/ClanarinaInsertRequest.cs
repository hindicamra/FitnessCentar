using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class ClanarinaInsertRequest
    {
       
        public int? KorisnikId { get; set; }
        public int? TipClanarineId { get; set; }
        public int? PlacanjeId { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Naziv je obavezno polje.")]
        public string Naziv { get; set; }
        public string? Opis { get; set; }

        [Required(ErrorMessage = "Trajanje je obavezno polje.")]
        [Range(1, int.MaxValue, ErrorMessage = "Trajanje mora biti veće od 0.")]
        public int Trajanje { get; set; }
    }
}
