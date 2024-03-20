using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class ClanarinaUpdateRequest
    {
        public int? KorisnikId { get; set; }
        public int? TipClanarineId { get; set; }
  

        [Required(ErrorMessage = "VaziDo je obavezno polje.")]
        [FutureDate(ErrorMessage = "The date must be in the future.")]
        public DateTime VaziDo { get; set; }
    }

    [AttributeUsage(AttributeTargets.Property | AttributeTargets.Field, AllowMultiple = false)]
    public class FutureDateAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value is DateTime date)
            {
                return date > DateTime.Now;
            }

            return false;
        }
    }
}