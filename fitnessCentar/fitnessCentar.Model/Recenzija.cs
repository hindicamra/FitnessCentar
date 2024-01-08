using System;
namespace fitnessCentar.Model
{
	public partial class Recenzija
	{
        public int RecenzijaId { get; set; }

        public string Korisnik { get; set; } = null!;

        public int? TreningId { get; set; }

        public string? Tekst { get; set; } = null!;

        public int Ocjena { get; set; }
    }
}

