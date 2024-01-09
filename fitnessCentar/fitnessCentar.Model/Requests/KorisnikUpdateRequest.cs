using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class KorisnikUpdateRequest
    {
        //[Required(AllowEmptyStrings = false, ErrorMessage = "Ime je obavezno polje.")]
        public string? Ime { get; set; } = null!;

        //[Required(AllowEmptyStrings = false, ErrorMessage = "Prezime je obavezno polje.")]
        public string? Prezime { get; set; } = null!;

        [EmailAddress(ErrorMessage = "Email adresa nije validna.")]
        public string? Email { get; set; }

        [Phone(ErrorMessage = "Telefon nije validan.")]
        public string? Telefon { get; set; }
      
        public string? Addresa { get; set; }

        public byte[]? Slika { get; set; }

        public bool? Status { get; set; }
    }
}
