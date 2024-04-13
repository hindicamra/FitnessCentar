using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace fitnessCentar.Services.Database;

public partial class FitnessCentarContext : DbContext
{
    public FitnessCentarContext()
    {
    }

    public FitnessCentarContext(DbContextOptions<FitnessCentarContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Clanarina> Clanarinas { get; set; }
    public virtual DbSet<Korisnik> Korisniks { get; set; }
    public virtual DbSet<Placanja> Placanjas { get; set; }
    public virtual DbSet<PlanIshrane> PlanIshranes { get; set; }
    public virtual DbSet<PlanIshraneKorisnik> PlanIshraneKorisniks { get; set; }
    public virtual DbSet<Recenzija> Recenzijas { get; set; }
    public virtual DbSet<Rezervacija> Rezervacijas { get; set; }
    public virtual DbSet<TipClanarine> TipClanarines { get; set; }
    public virtual DbSet<Trening> Trenings { get; set; }
    public virtual DbSet<Uloga> Ulogas { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {

        modelBuilder.Entity<Uloga>().HasData(
            new Uloga { UlogaId = 1, Naziv = "Admin" },
            new Uloga { UlogaId = 2, Naziv = "Uposlenik" },
            new Uloga { UlogaId = 3, Naziv = "Korisnik" }

        );
        modelBuilder.Entity<Korisnik>().HasData(
            new Korisnik { KorisnikId = 1, Ime = "Admin", Prezime = "Admin", KorisnickoIme = "admin", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Adresa", Email = "admin@gmail.com", Status = true, UlogaId = 1, Telefon = "060000000" },
            new Korisnik { KorisnikId = 2, Ime = "Uposlenik", Prezime = "Uposlenik", KorisnickoIme = "uposlenik", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Adresa", Email = "uposlenik@gmail.com", Status = true, UlogaId = 2, Telefon = "060000001" },
            new Korisnik { KorisnikId = 3, Ime = "Korisnik", Prezime = "Korisnik", KorisnickoIme = "korisnik", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Adresa", Email = "korisnik@gmail.com", Status = true, UlogaId = 3, Telefon = "060000002" }
            );


        modelBuilder.Entity<Trening>().HasData(
           new Trening { TreningId = 1, Naziv = "Trening ruku", Opis = "Opis treninga ruku" },
           new Trening { TreningId = 2, Naziv = "Trening nogu", Opis = "Opis treninga nogu" },
           new Trening { TreningId = 3, Naziv = "Trening ledja", Opis = "Opis treninga ledja" }
       );

        modelBuilder.Entity<TipClanarine>().HasData(
          new TipClanarine { TipClanarineId = 1, Naziv = "7-dnevna", Cijena = 7, Trajanje = 7 },
          new TipClanarine { TipClanarineId = 2, Naziv = "30-dnevna", Cijena = 30, Trajanje = 30 },
          new TipClanarine { TipClanarineId = 3, Naziv = "60-dnevna", Cijena = 60, Trajanje = 60 }
        );

        modelBuilder.Entity<Placanja>().HasData(
         new Placanja { PlacanjeId = 1, Iznos = 60, TipClanarineId = 3, Datum = DateTime.Now }

        );

        modelBuilder.Entity<Clanarina>().HasData(
         new Clanarina { ClanarinaId = 1, KorisnikId = 3, TipClanarineId=3, VaziDo=DateTime.Now.AddDays(60) }
        
        );

        modelBuilder.Entity<PlanIshrane>().HasData(
         new PlanIshrane { PlanIshraneId = 1, Naziv = "Ananas dijeta", Opis="Konzumacija svega osim ananasa" },
         new PlanIshrane { PlanIshraneId = 2, Naziv = "Avokado dijeta", Opis = "Konzumacija svega osim avokada" }

        );
        modelBuilder.Entity<PlanIshraneKorisnik>().HasData(
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 1, PlanIshraneId = 1, KorisnikId=3 },
        new PlanIshraneKorisnik { PlanIshraneKorisnikId = 2, PlanIshraneId = 2, KorisnikId = 3 }

        );

        modelBuilder.Entity<Rezervacija>().HasData(
        new Rezervacija { RezervacijaId = 1, TreningId = 1, KorisnikId = 3,Datum=DateTime.Now,Status= "Odobrena" },
        new Rezervacija { RezervacijaId = 2, TreningId = 1, KorisnikId = 3, Datum = DateTime.Now.AddDays(2), Status = "NaCekanju" },
         new Rezervacija { RezervacijaId = 3, TreningId = 1, KorisnikId = 3, Datum = DateTime.Now.AddDays(3), Status = "Odbijena" }
       );

        modelBuilder.Entity<Recenzija>().HasData(
       new Recenzija { RecenzijaId = 1, KorisnikId = 3, TreningId=1,Tekst="Al'a sam se odradio/la",Ocjena=5 }
      );





    }
}
