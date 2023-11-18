using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class PlacanjaUpdateRequest
    {
        [Required(ErrorMessage = "Iznos je obavezno polje.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Iznos mora biti veći od 0.")]
        public decimal Iznos { get; set; }
        public int? ClanarinaId { get; set; }
    }
}
