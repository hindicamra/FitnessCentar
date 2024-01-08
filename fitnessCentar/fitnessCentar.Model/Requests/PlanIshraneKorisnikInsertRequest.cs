using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class PlanIshraneKorisnikInsertRequest
    {
        public int PlanIshraneId { get; set; }
        public int KorisnikId { get; set; }

        
       
    }
}
