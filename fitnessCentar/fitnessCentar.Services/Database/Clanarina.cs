using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class Clanarina
{
    public int ClanarinaId { get; set; }

    public int KorisnikId { get; set; }

    public int TipClanarineId { get; set; }

    public DateTime VaziDo { get; set; }

    public virtual Korisnik? Korisnik { get; set; }



    public virtual TipClanarine? TipClanarine { get; set; }
}
