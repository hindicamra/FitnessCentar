using System;
using System.Collections.Generic;

namespace fitnessCentar.Services.Database;

public partial class Korisnik
{
    public int KorisnikId { get; set; }

    public string Ime { get; set; } = null!;

    public string Prezime { get; set; } = null!;

    public string KorisnickoIme { get; set; } = null!;

    public string PasswordHash { get; set; } = null!;

    public string PasswordSalt { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Telefon { get; set; } = null!;

    public string? Addresa { get; set; }

    public int? UlogaId { get; set; }

    public byte[]? Slika { get; set; }

    public string? Status { get; set; }

    public virtual ICollection<Clanarina> Clanarinas { get; set; } = new List<Clanarina>();

    public virtual ICollection<PlanIshraneKorisnik> PlanIshraneKorisniks { get; set; } = new List<PlanIshraneKorisnik>();

    public virtual ICollection<Recenzija> Recenzijas { get; set; } = new List<Recenzija>();

    public virtual ICollection<Rezervacija> Rezervacijas { get; set; } = new List<Rezervacija>();

    public virtual ICollection<TreningKorisnik> TreningKorisniks { get; set; } = new List<TreningKorisnik>();

    public virtual Uloga? Uloga { get; set; }
}
