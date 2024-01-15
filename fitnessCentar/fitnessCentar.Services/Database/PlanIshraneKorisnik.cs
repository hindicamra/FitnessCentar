using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class PlanIshraneKorisnik
{
    public int PlanIshraneKorisnikId { get; set; }

    public int? PlanIshraneId { get; set; }

    public int? KorisnikId { get; set; }

    public virtual Korisnik? Korisnik { get; set; }

    public virtual PlanIshrane? PlanIshrane { get; set; }
}
