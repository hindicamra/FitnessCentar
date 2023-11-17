using System;
namespace fitnessCentar.Model
{
	public partial class Rezervacija
	{
        public int RezervacijaId { get; set; }

        public int? TreningId { get; set; }

        public int? KorisnikId { get; set; }

        public DateTime? Datum { get; set; }

        public string? Status { get; set; }
    }
}

