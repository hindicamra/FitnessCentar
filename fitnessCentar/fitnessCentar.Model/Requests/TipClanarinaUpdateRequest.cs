using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
    public class TipClanarinaUpdateRequest
    {

        public string? Naziv { get; set; }

        [Range(0.01, double.MaxValue, ErrorMessage = "Cijena mora biti veća od 0.")]
        public float? Cijena { get; set; }

        [Range(1, 365, ErrorMessage = "Trajanje mora biti veće od 1")]
        public int? Trajanje { get; set; }
    }
}
