using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class Trening
{
    public int TreningId { get; set; }

    public int? VrstaTreningaId { get; set; }

    public string Opis { get; set; } = null!;

    public virtual ICollection<Recenzija> Recenzijas { get; set; } = new List<Recenzija>();

    public virtual ICollection<Rezervacija> Rezervacijas { get; set; } = new List<Rezervacija>();

    public virtual ICollection<TreningKorisnik> TreningKorisniks { get; set; } = new List<TreningKorisnik>();

    public virtual VrstaTreninga? VrstaTreninga { get; set; }
}
