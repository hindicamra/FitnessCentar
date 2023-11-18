using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model
{
    public partial class PlanIshraneKorisnik
    {
        public int PlanIshraneKorisnikId { get; set; }
        public int? PlanIshraneId { get; set; }
        public int? KorisnikId { get; set; }
        public string Opis { get; set; }
    }
}
