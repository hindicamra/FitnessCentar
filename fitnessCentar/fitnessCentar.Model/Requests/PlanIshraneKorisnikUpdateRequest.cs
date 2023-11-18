using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class PlanIshraneKorisnikUpdateRequest
    {
        public int? PlanIshraneId { get; set; }
        public int? KorisnikId { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Opis je obavezno polje.")]
        public string Opis { get; set; }
    }
}
