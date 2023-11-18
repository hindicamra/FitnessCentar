using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model
{
    public partial class Placanja
    {
        public int PlacanjeId { get; set; }
        public decimal Iznos { get; set; }
        public int? ClanarinaId { get; set; }
    }
}
