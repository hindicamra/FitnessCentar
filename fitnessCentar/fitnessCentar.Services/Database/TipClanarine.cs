using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class TipClanarine
{
    public int TipClanarineId { get; set; }

    public string Naziv { get; set; } = null!;

    public float Cijena { get; set; }

    public int Trajanje { get; set; }

    public virtual ICollection<Clanarina> Clanarinas { get; set; } = new List<Clanarina>();
}
