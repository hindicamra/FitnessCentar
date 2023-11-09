using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class PlanIshrane
{
    public int PlanIshraneId { get; set; }

    public string Naziv { get; set; } = null!;

    public virtual ICollection<PlanIshraneKorisnik> PlanIshraneKorisniks { get; set; } = new List<PlanIshraneKorisnik>();
}
