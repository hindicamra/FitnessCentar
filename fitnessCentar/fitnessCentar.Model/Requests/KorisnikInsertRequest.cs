using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class KorisnikInsertRequest
    {
        [Required(AllowEmptyStrings = false)]
        public string Ime { get; set; } = null!;

        [Required(AllowEmptyStrings = false)]
        public string Prezime { get; set; } = null!;

        [Required(AllowEmptyStrings = false)]
        public string KorisnickoIme { get; set; } = null!;

        [Required(AllowEmptyStrings = false)]
        [MinLength(3)]
        [MaxLength(20)]
        public string Password { get; set; } = null!;

        [Required(AllowEmptyStrings = false)]
        [MinLength(3)]
        [MaxLength(20)]
        [Compare("Password", ErrorMessage = "Sifre moraju biti iste")]
        public string PasswordPotvrda { get; set; } = null!;

        public string? Email { get; set; }

        public string? Telefon { get; set; }

        public string? Addresa { get; set; }

        //public byte[]? Slika { get; set; } = null;
       
        public bool? Status { get; set; }
    }
}
