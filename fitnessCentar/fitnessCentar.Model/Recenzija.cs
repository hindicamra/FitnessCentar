using System;
namespace fitnessCentar.Model
{
	public partial class Recenzija
	{
        public int RecenzijaId { get; set; }

        public int? KorisnikId { get; set; }

        public int? TreningId { get; set; }

        public string? Tekst { get; set; } = null!;

        public int Ocjena { get; set; }
    }
}

