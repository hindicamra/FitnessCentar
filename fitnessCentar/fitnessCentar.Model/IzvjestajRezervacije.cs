using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model
{
    public class IzvjestajRezervacije
    {
        public int NaCekanju { get; set; }
        public int Odobreno { get; set; }
        public int Odbijeno { get; set; }
        public int Ukupno { get; set; }
    }
}
