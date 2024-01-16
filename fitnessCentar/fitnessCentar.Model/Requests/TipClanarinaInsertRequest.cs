using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Model.Requests
{
    public class TipClanarinaInsertRequest
    {
        [Required(ErrorMessage = "Naziv je obavezno polje.")]
        public string Naziv { get; set; }

        [Required(ErrorMessage = "Cijena je obavezno polje.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Cijena mora biti veća od 0.")]
        public float Cijena { get; set; }

        [Required(ErrorMessage = "Trajanje je obavezno polje.")]
        [Range(1, 365, ErrorMessage = "Trajanje mora biti veće od 1")]
        public int Trajanje { get; set; }
    }
}
