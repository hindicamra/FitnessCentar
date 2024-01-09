using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class Trening
{
    public int TreningId { get; set; }

    public string Naziv { get; set; } = string.Empty;

    public string Opis { get; set; } = null!;

    public virtual ICollection<Recenzija> Recenzijas { get; set; } = new List<Recenzija>();

    public virtual ICollection<Rezervacija> Rezervacijas { get; set; } = new List<Rezervacija>();




}
