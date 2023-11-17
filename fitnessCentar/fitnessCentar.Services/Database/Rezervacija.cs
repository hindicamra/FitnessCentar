using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class Rezervacija
{
    public int RezervacijaId { get; set; }

    public int? TreningId { get; set; }

    public int? KorisnikId { get; set; }

    public DateTime? Datum { get; set; }

    public string? Status { get; set; }

    public virtual Korisnik? Korisnik { get; set; }

    public virtual Trening? Trening { get; set; }
}
