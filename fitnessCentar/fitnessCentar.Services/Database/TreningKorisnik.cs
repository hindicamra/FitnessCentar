using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class TreningKorisnik
{
    public int TreningKorisnikId { get; set; }

    public int? TreningId { get; set; }

    public int? KorisnikId { get; set; }

    public string? Opis { get; set; }

    public DateTime? DatumVreme { get; set; }

    public virtual Korisnik? Korisnik { get; set; }

    public virtual Trening? Trening { get; set; }
}
