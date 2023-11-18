using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class ClanarinaUpdateRequest
    {
        public int? KorisnikId { get; set; }
        public int? TipClanarineId { get; set; }
        public int? PlacanjeId { get; set; }
        public string? Naziv { get; set; }
        public string? Opis { get; set; }
        public int Trajanje { get; set; }
    }
}
