using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class Clanarina
{
    public int ClanarinaId { get; set; }

    public int KorisnikId { get; set; }

    public int TipClanarineId { get; set; }

    public string Naziv { get; set; } = null!;

    public string? Opis { get; set; }

    public DateTime VaziDo { get; set; }

    public virtual Korisnik? Korisnik { get; set; }

    public virtual ICollection<Placanja> Placanjas { get; set; } = new List<Placanja>();

    public virtual TipClanarine? TipClanarine { get; set; }
}
