using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class PlacanjaUpdateRequest
    {
        public decimal Iznos { get; set; }
        public int? ClanarinaId { get; set; }
    }
}
