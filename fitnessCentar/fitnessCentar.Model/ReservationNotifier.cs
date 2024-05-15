using System;
using System.Collections.Generic;
using System.Text;

namespace fitnessCentar.Model
{
    public class ReservationNotifier
    {
        public ReservationNotifier()
        {
        }
      
        public string Trening { get; set; } = null!;
        public string Email { get; set; } = null!;
        public DateTime Datum { get; set; }
      
    }
}
