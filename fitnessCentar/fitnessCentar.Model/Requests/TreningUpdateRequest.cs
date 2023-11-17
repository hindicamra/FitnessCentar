using System;
namespace fitnessCentar.Model.Requests
{
	public class TreningUpdateRequest
	{
        public int? VrstaTreningaId { get; set; }

        public string? Opis { get; set; } = null!;
    }
}

