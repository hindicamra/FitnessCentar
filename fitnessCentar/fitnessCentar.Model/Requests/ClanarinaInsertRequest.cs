using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class ClanarinaInsertRequest
    {
        [Required(ErrorMessage = "KorisnikId je obavezno polje.")]
        public int KorisnikId { get; set; }

        [Required(ErrorMessage = "TipClanarine je obavezno polje.")]
        public int TipClanarineId { get; set; }

       
    }
}
