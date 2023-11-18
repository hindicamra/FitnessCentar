using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model
{
    public partial class Clanarina
    {
        public int ClanarinaId { get; set; }

        public int? KorisnikId { get; set; }

        public int? TipClanarineId { get; set; }

        public int? PlacanjeId { get; set; }

        public string Naziv { get; set; } = null!;

        public string? Opis { get; set; }

        public int Trajanje { get; set; }
    }
}
