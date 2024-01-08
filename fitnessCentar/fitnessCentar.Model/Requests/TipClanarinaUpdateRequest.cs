using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class TipClanarinaUpdateRequest
    {

        public string? Naziv { get; set; }


        [Range(0.01, double.MaxValue, ErrorMessage = "Cijena mora biti veća od 0.")]
        public float? Cijena { get; set; }
    }
}
