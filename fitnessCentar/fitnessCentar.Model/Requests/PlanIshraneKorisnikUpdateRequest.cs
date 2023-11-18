using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class PlanIshraneKorisnikUpdateRequest
    {
        public int? PlanIshraneId { get; set; }
        public int? KorisnikId { get; set; }
        public string Opis { get; set; }
    }
}
