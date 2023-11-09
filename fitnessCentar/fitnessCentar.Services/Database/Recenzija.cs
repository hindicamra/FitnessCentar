using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class Recenzija
{
    public int RecenzijaId { get; set; }

    public int? KorisnikId { get; set; }

    public int? TreningId { get; set; }

    public string? Tekst { get; set; }

    public int Ocjena { get; set; }

    public virtual Korisnik? Korisnik { get; set; }

    public virtual Trening? Trening { get; set; }
}
