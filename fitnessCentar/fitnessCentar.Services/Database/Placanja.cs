using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace fitnessCentar.Services.Database;

public partial class Placanja
{
    [Key]
    public int PlacanjeId { get; set; }

    public float Iznos { get; set; }
    public DateTime Datum { get; set; }

    public int? TipClanarineId { get; set; }

    public virtual TipClanarine? TipClanarine { get; set; }
}
