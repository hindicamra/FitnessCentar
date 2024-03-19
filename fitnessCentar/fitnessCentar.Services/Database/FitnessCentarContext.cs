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
            new Korisnik { KorisnikId=1, Ime="Admin", Prezime="Admin", KorisnickoIme="admin", PasswordHash="C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt="qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa="Adresa", Email="admin@gmail.com",Status=true,UlogaId=1,Telefon="060000000" },
            new Korisnik { KorisnikId=2, Ime="Uposlenik", Prezime="Uposlenik", KorisnickoIme="uposlenik", PasswordHash="C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt="qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa="Adresa", Email="uposlenik@gmail.com", Status=true, UlogaId=2, Telefon="060000001" },
            new Korisnik { KorisnikId=3, Ime="Korisnik", Prezime="Korisnik", KorisnickoIme="korisnik", PasswordHash="C5fuEDcAxNxDuUXqOJCU9DYfLpM=", PasswordSalt="qQ0nSvQ4rOy3pP/Zi95wIw==", Addresa="Adresa", Email="korisnik@gmail.com", Status=true, UlogaId=3, Telefon="060000002" }
            );


        modelBuilder.Entity<Trening>().HasData(
           new Trening { TreningId = 1, Naziv = "Trening ruku",Opis= "Opis treninga ruku" },
           new Trening { TreningId = 2, Naziv = "Trening nogu",Opis= "Opis treninga nogu" },
           new Trening { TreningId = 3, Naziv = "Trening ledja", Opis= "Opis treninga ledja" }
       );



    }
}
