using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class TipClanarine
{
    public int TipClanarineId { get; set; }

    public string Naziv { get; set; } = null!;

    public decimal Cena { get; set; }

    public virtual ICollection<Clanarina> Clanarinas { get; set; } = new List<Clanarina>();
}
