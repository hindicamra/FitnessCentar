using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class KorisnikInsertRequest
    {
        public string Ime { get; set; } = null!;

        public string Prezime { get; set; } = null!;

        public string KorisnickoIme { get; set; } = null!;

        public string Password { get; set; } = null!;

        public string PasswordPotvrda { get; set; } = null!;

        public string? Email { get; set; }

        public string? Telefon { get; set; }

        public string? Addresa { get; set; }

        //public byte[]? Slika { get; set; } = null;
       
        public bool? Status { get; set; }
    }
}
