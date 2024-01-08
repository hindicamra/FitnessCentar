using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model
{
    public partial class TipClanarina
    {
        public int TipClanarineId { get; set; }
        public string Naziv { get; set; } = null!;
        public float Cijena { get; set; }
    }
}
