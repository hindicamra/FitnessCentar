using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class VrstaTreninga
{
    public int VrstaTreningaId { get; set; }

    public string Naziv { get; set; } = null!;

    public string? Opis { get; set; }

    public virtual ICollection<Trening> Trenings { get; set; } = new List<Trening>();
}
