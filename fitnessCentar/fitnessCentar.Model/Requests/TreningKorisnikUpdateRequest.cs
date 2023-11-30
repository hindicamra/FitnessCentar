using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class TreningKorisnikUpdateRequest
    {
        public int? TreningId { get; set; }
        public int? KorisnikId { get; set; }

        [StringLength(500, ErrorMessage = "Opis ne smije biti duži od 500 karaktera.")]
        public string? Opis { get; set; }

        public DateTime? DatumVreme { get; set; }
    }
}
