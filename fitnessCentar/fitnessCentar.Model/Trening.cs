using System;
namespace fitnessCentar.Model
{
	public partial class Trening
	{
        public int TreningId { get; set; }

        public string Naziv { get; set; } = string.Empty;

        public string Opis { get; set; } = null!;
    }
}

