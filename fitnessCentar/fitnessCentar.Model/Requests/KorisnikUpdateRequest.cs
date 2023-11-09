using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class KorisnikUpdateRequest
    {
        public string Ime { get; set; } = null!;

        public string Prezime { get; set; } = null!;
       
        public string? Email { get; set; }

        public string? Telefon { get; set; }
      
        public string? Addresa { get; set; }

        public byte[]? Slika { get; set; }

        public bool? Status { get; set; }
    }
}
