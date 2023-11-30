using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class TipClanarinaInsertRequest
    {
        [Required(ErrorMessage = "Naziv je obavezno polje.")]
        public string Naziv { get; set; }

        [Required(ErrorMessage = "Cijena je obavezno polje.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Cijena mora biti veća od 0.")]
        public decimal Cijena { get; set; }
    }
}
