using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class Placanja
{
    public int PlacanjeId { get; set; }

    public decimal Iznos { get; set; }

    public int? ClanarinaId { get; set; }

    public virtual Clanarina? Clanarina { get; set; }
}
