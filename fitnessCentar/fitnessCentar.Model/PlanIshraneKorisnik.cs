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
        public string PlanIshrane { get; set; } = null!;
        public string Korisnik { get; set; } = null!;

    }
}
