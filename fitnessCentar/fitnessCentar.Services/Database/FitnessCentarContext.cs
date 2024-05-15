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
            new Korisnik { KorisnikId = 1, Ime = "Admin", Prezime = "Admin", KorisnickoIme = "admin", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 1", Email = "admin@gmail.com", Status = true, UlogaId = 1, Telefon = "060000000" },
            new Korisnik { KorisnikId = 2, Ime = "Uposlenik", Prezime = "Uposlenik", KorisnickoIme = "uposlenik", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 2", Email = "uposlenik@gmail.com", Status = true, UlogaId = 2, Telefon = "060000001" },
            new Korisnik { KorisnikId = 3, Ime = "Korisnik", Prezime = "Korisnik", KorisnickoIme = "korisnik", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 3", Email = "korisnik@gmail.com", Status = true, UlogaId = 3, Telefon = "060000002" },
            new Korisnik { KorisnikId = 4, Ime = "Nejla", Prezime = "Hindic", KorisnickoIme = "nejlahindic", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 4", Email = "nejlahindic@gmail.com", Status = true, UlogaId = 3, Telefon = "060000003" },
            new Korisnik { KorisnikId = 5, Ime = "Edin", Prezime = "Cilic", KorisnickoIme = "edincilic", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 5", Email = "edincilic@gmail.com", Status = true, UlogaId = 3, Telefon = "060000004" },
            new Korisnik { KorisnikId = 6, Ime = "Daris", Prezime = "Jahic", KorisnickoIme = "darisjahic", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 6", Email = "darisjahic@gmail.com", Status = true, UlogaId = 3, Telefon = "060000005" },
            new Korisnik { KorisnikId = 7, Ime = "Sara", Prezime = "Cilic", KorisnickoIme = "saracilic", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 7", Email = "saracilic@gmail.com", Status = true, UlogaId = 3, Telefon = "060000006" },
            new Korisnik { KorisnikId = 8, Ime = "Selma", Prezime = "Behrem", KorisnickoIme = "selmabehrem", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 8", Email = "selmabehrem@gmail.com", Status = true, UlogaId = 3, Telefon = "060000007" },
            new Korisnik { KorisnikId = 9, Ime = "Kenan", Prezime = "Macic", KorisnickoIme = "kenanmacic", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 9", Email = "kenanmacic@gmail.com", Status = true, UlogaId = 3, Telefon = "060000008" },
            new Korisnik { KorisnikId = 10, Ime = "Aldijana", Prezime = "Djelmo", KorisnickoIme = "aldijanadjelmo", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 10", Email = "aldijanadjelmo@gmail.com", Status = true, UlogaId = 3, Telefon = "060000009" },
            new Korisnik { KorisnikId = 11, Ime = "Lana", Prezime = "Sefer", KorisnickoIme = "lanasefer", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 11", Email = "lanasefer@gmail.com", Status = true, UlogaId = 3, Telefon = "060000010" },
            new Korisnik { KorisnikId = 12, Ime = "Adnan", Prezime = "Lulic", KorisnickoIme = "adnanlulic", PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa = "Ulica 12", Email = "adnanlulic@gmail.com", Status = true, UlogaId = 3, Telefon = "060000011" }

            );


        modelBuilder.Entity<Trening>().HasData(
           new Trening { TreningId = 1, Naziv = "Trening ruku", Opis = "Opis treninga ruku" },
           new Trening { TreningId = 2, Naziv = "Trening nogu", Opis = "Opis treninga nogu" },
           new Trening { TreningId = 3, Naziv = "Trening ledja", Opis = "Opis treninga ledja" },
           new Trening { TreningId = 4, Naziv = "Trening ramena", Opis = "Opis treninga ramena" },
           new Trening { TreningId = 5, Naziv = "Kardio trening", Opis = "Opis kardio treninga" },
           new Trening { TreningId = 6, Naziv = "Trening za cjelokupno tijelo", Opis = "Opis treninga za cjelokupno tijelo" },
           new Trening { TreningId = 7, Naziv = "Pilates", Opis = "Opis pilates treninga" },
           new Trening { TreningId = 8, Naziv = "Yoga", Opis = "Opis yoga treninga" },
           new Trening { TreningId = 9, Naziv = "Trening za snagu", Opis = "Opis treninga za snagu" },
           new Trening { TreningId = 10, Naziv = "Trening ledja", Opis = "Opis treninga ledja" }
       );

        modelBuilder.Entity<TipClanarine>().HasData(
          new TipClanarine { TipClanarineId = 1, Naziv = "7-dnevna", Cijena = 7, Trajanje = 7 },
          new TipClanarine { TipClanarineId = 2, Naziv = "30-dnevna", Cijena = 30, Trajanje = 30 },
          new TipClanarine { TipClanarineId = 3, Naziv = "60-dnevna", Cijena = 60, Trajanje = 60 },
          new TipClanarine { TipClanarineId = 4, Naziv = "Vikend paket", Cijena = 15, Trajanje = 8 },
          new TipClanarine { TipClanarineId = 5, Naziv = "Student", Cijena = 25, Trajanje = 30 },
          new TipClanarine { TipClanarineId = 6, Naziv = "Porodicna", Cijena = 100, Trajanje = 30 },
          new TipClanarine { TipClanarineId = 7, Naziv = "Seniorska", Cijena = 20, Trajanje = 30 },
          new TipClanarine { TipClanarineId = 8, Naziv = "Proba-7-dnevna", Cijena = 5, Trajanje = 7 }





        );

        modelBuilder.Entity<Placanja>().HasData(
         new Placanja { PlacanjeId = 1, Iznos = 60, TipClanarineId = 3, Datum = DateTime.Now },
         new Placanja { PlacanjeId = 2, Iznos = 7, TipClanarineId = 1, Datum = DateTime.Now },
         new Placanja { PlacanjeId = 3, Iznos = 30, TipClanarineId = 2, Datum = DateTime.Now },
         new Placanja { PlacanjeId = 4, Iznos = 15, TipClanarineId = 4, Datum = DateTime.Now },
         new Placanja { PlacanjeId = 5, Iznos = 25, TipClanarineId = 5, Datum = DateTime.Now },
         new Placanja { PlacanjeId = 6, Iznos = 100, TipClanarineId = 6, Datum = DateTime.Now },
         new Placanja { PlacanjeId = 7, Iznos = 20, TipClanarineId = 7, Datum = DateTime.Now },
         new Placanja { PlacanjeId = 8, Iznos = 5, TipClanarineId = 8, Datum = DateTime.Now },
         new Placanja { PlacanjeId = 9, Iznos = 60, TipClanarineId = 3, Datum = DateTime.Now },
         new Placanja { PlacanjeId = 10, Iznos = 30, TipClanarineId = 2, Datum = DateTime.Now }

        );

        modelBuilder.Entity<Clanarina>().HasData(
         new Clanarina { ClanarinaId = 1, KorisnikId = 3, TipClanarineId = 3, VaziDo = DateTime.Now.AddDays(60) },
         new Clanarina { ClanarinaId = 2, KorisnikId = 4, TipClanarineId = 1, VaziDo = DateTime.Now.AddDays(7) },
         new Clanarina { ClanarinaId = 3, KorisnikId = 5, TipClanarineId = 2, VaziDo = DateTime.Now.AddDays(30) },
         new Clanarina { ClanarinaId = 4, KorisnikId = 6, TipClanarineId = 3, VaziDo = DateTime.Now.AddDays(60) },
         new Clanarina { ClanarinaId = 5, KorisnikId = 7, TipClanarineId = 4, VaziDo = DateTime.Now.AddDays(8) },
         new Clanarina { ClanarinaId = 6, KorisnikId = 8, TipClanarineId = 5, VaziDo = DateTime.Now.AddDays(30) },
         new Clanarina { ClanarinaId = 7, KorisnikId = 9, TipClanarineId = 6, VaziDo = DateTime.Now.AddDays(30) },
         new Clanarina { ClanarinaId = 8, KorisnikId = 10, TipClanarineId = 7, VaziDo = DateTime.Now.AddDays(30) },
         new Clanarina { ClanarinaId = 9, KorisnikId = 11, TipClanarineId = 8, VaziDo = DateTime.Now.AddDays(7) },
         new Clanarina { ClanarinaId = 10, KorisnikId = 12, TipClanarineId = 1, VaziDo = DateTime.Now.AddDays(7) }
        );

        modelBuilder.Entity<PlanIshrane>().HasData(
         new PlanIshrane { PlanIshraneId = 1, Naziv = "Proteinska dijeta", Opis = "Visok unos proteina, niskokaloricni obroci" },
         new PlanIshrane { PlanIshraneId = 2, Naziv = "Keto dijeta", Opis = "Visok unos masti, vrlo nizak unos ugljenih hidrata" },
         new PlanIshrane { PlanIshraneId = 3, Naziv = "Mediteranska dijeta", Opis = "Obilje voca, povrca, ribe i maslinovog ulja" },
         new PlanIshrane { PlanIshraneId = 4, Naziv = "Veganska dijeta", Opis = "Ishrana bez proizvoda zivotinjskog porekla" },
         new PlanIshrane { PlanIshraneId = 5, Naziv = "Paleo dijeta", Opis = "Ishrana bazirana na namirnicama iz paleolitskog doba" },
         new PlanIshrane { PlanIshraneId = 6, Naziv = "Bezglutenska dijeta", Opis = "Izbjegavanje glutena u ishrani" },
         new PlanIshrane { PlanIshraneId = 7, Naziv = "DASH dijeta", Opis = "Dijeta usmerena na smanjenje krvnog pritiska" },
         new PlanIshrane { PlanIshraneId = 8, Naziv = "Dijeta sa niskim unosom ugljenih hidrata", Opis = "Smanjen unos ugljenih hidrata za mrsavljenje" },
         new PlanIshrane { PlanIshraneId = 9, Naziv = "Sirova hrana dijeta", Opis = "Konzumacija sirovih i minimalno obradjenih namirnica" },
         new PlanIshrane { PlanIshraneId = 10, Naziv = "Zone dijeta", Opis = "Izbalansiran unos proteina, masti i ugljenih hidrata" }



        );
        modelBuilder.Entity<PlanIshraneKorisnik>().HasData(
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 1, PlanIshraneId = 1, KorisnikId = 3 },
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 2, PlanIshraneId = 2, KorisnikId = 3 },
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 3, PlanIshraneId = 1, KorisnikId = 4 },
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 4, PlanIshraneId = 2, KorisnikId = 5 },
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 5, PlanIshraneId = 3, KorisnikId = 6 },
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 6, PlanIshraneId = 1, KorisnikId = 7 },
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 7, PlanIshraneId = 2, KorisnikId = 8 },
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 8, PlanIshraneId = 3, KorisnikId = 9 },
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 9, PlanIshraneId = 1, KorisnikId = 10 },
         new PlanIshraneKorisnik { PlanIshraneKorisnikId = 10, PlanIshraneId = 2, KorisnikId = 11 }

        );

        modelBuilder.Entity<Rezervacija>().HasData(
        new Rezervacija { RezervacijaId = 1, TreningId = 1, KorisnikId = 3, Datum = DateTime.Now.AddMonths(-1), Status = "Odobrena" },
        new Rezervacija { RezervacijaId = 2, TreningId = 1, KorisnikId = 3, Datum = DateTime.Now.AddDays(2).AddMonths(-1), Status = "NaCekanju" },
        new Rezervacija { RezervacijaId = 3, TreningId = 1, KorisnikId = 3, Datum = DateTime.Now.AddDays(3).AddMonths(-1), Status = "Odbijena" },
        new Rezervacija { RezervacijaId = 4, TreningId = 2, KorisnikId = 4, Datum = DateTime.Now.AddDays(1), Status = "Odobrena" },
        new Rezervacija { RezervacijaId = 5, TreningId = 2, KorisnikId = 5, Datum = DateTime.Now.AddDays(2), Status = "NaCekanju" },
        new Rezervacija { RezervacijaId = 6, TreningId = 2, KorisnikId = 6, Datum = DateTime.Now.AddDays(3), Status = "Odbijena" },
        new Rezervacija { RezervacijaId = 7, TreningId = 3, KorisnikId = 7, Datum = DateTime.Now.AddDays(1), Status = "Odobrena" }
       );

        modelBuilder.Entity<Recenzija>().HasData(
       new Recenzija { RecenzijaId = 1, KorisnikId = 3, TreningId = 1, Tekst = "Odlican trening", Ocjena = 5 },
       new Recenzija { RecenzijaId = 2, KorisnikId = 4, TreningId = 2, Tekst = "Odlican trening, bas mi je prijalo!", Ocjena = 4 },
       new Recenzija { RecenzijaId = 3, KorisnikId = 5, TreningId = 3, Tekst = "Bilo je naporno, ali vrijedilo je.", Ocjena = 5 },
       new Recenzija { RecenzijaId = 4, KorisnikId = 6, TreningId = 1, Tekst = "Solidan trening, moglo bi biti bolje.", Ocjena = 3 },
       new Recenzija { RecenzijaId = 5, KorisnikId = 7, TreningId = 2, Tekst = "Fantasticna energija i atmosfera!", Ocjena = 5 },
       new Recenzija { RecenzijaId = 6, KorisnikId = 8, TreningId = 3, Tekst = "Bilo je previse intenzivno za mene.", Ocjena = 2 },
       new Recenzija { RecenzijaId = 7, KorisnikId = 9, TreningId = 1, Tekst = "Svidja mi se kako je trening strukturisan.", Ocjena = 4 },
       new Recenzija { RecenzijaId = 8, KorisnikId = 10, TreningId = 2, Tekst = "Nisam bas zadovoljan, ocekivala sam vise.", Ocjena = 3 },
       new Recenzija { RecenzijaId = 9, KorisnikId = 11, TreningId = 3, Tekst = "Vrhunski trening, osjecam se sjajno!", Ocjena = 5 },
       new Recenzija { RecenzijaId = 10, KorisnikId = 12, TreningId = 1, Tekst = "Trener je bio odlican, trening je bio izazovan.", Ocjena = 4 },
       new Recenzija { RecenzijaId = 11, KorisnikId = 3, TreningId = 2, Tekst = "Prosjecan trening, nista posebno.", Ocjena = 3 }
      );





    }
}
