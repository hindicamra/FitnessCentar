using System;
namespace fitnessCentar.Model
{
	public partial class Trening
	{
        public int TreningId { get; set; }

        public int? VrstaTreningaId { get; set; }

        public string Opis { get; set; } = null!;
    }
}

