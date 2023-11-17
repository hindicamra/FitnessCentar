using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model
{
    public partial class VrstaTreninga
    {
        public int VrstaTreningaId { get; set; }

        public string Naziv { get; set; } = null!;

        public string? Opis { get; set; }

    }
}
