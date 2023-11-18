using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class PlanIshraneInsertRequest
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "Naziv je obavezno polje.")]
        public string Naziv { get; set; }
    }
}
