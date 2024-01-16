using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class PlanIshraneKorisnikInsertRequest
    {
        [Required(ErrorMessage = "PlanIshraneId je obavezno polje.")]
        public int PlanIshraneId { get; set; }

        [Required(ErrorMessage = "KorisnikId je obavezno polje.")]

        public int KorisnikId { get; set; }
    }
}
