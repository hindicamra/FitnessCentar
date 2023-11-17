using System;
namespace fitnessCentar.Model.Requests
{
	public class RecenzijaUpdateRequest
	{
        public int? TreningId { get; set; }

        public string? Tekst { get; set; } = null!;

        public int? Ocjena { get; set; }
    }
}