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

    public virtual DbSet<TreningKorisnik> TreningKorisniks { get; set; }

    public virtual DbSet<Uloga> Ulogas { get; set; }

    public virtual DbSet<VrstaTreninga> VrstaTreningas { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=fitnessCentar; TrustServerCertificate=True; Trusted_Connection=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Clanarina>(entity =>
        {
            entity.HasKey(e => e.ClanarinaId).HasName("PK__Clanarin__C51E3BB7C0AEE0EA");

            entity.ToTable("Clanarina");

            entity.Property(e => e.ClanarinaId).HasColumnName("ClanarinaID");
            entity.Property(e => e.KorisnikId).HasColumnName("KorisnikID");
            entity.Property(e => e.Naziv)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Opis)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.PlacanjeId).HasColumnName("PlacanjeID");
            entity.Property(e => e.TipClanarineId).HasColumnName("TipClanarineID");

            entity.HasOne(d => d.Korisnik).WithMany(p => p.Clanarinas)
                .HasForeignKey(d => d.KorisnikId)
                .HasConstraintName("FK__Clanarina__Koris__2D27B809");

            entity.HasOne(d => d.TipClanarine).WithMany(p => p.Clanarinas)
                .HasForeignKey(d => d.TipClanarineId)
                .HasConstraintName("FK__Clanarina__TipCl__2E1BDC42");
        });

        modelBuilder.Entity<Korisnik>(entity =>
        {
            entity.HasKey(e => e.KorisnikId).HasName("PK__Korisnik__80B06D61FE8398CA");

            entity.ToTable("Korisnik");

            entity.Property(e => e.KorisnikId).HasColumnName("KorisnikID");
            entity.Property(e => e.Addresa).HasMaxLength(255);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.Ime)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.KorisnickoIme)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PasswordHash).HasMaxLength(255);
            entity.Property(e => e.PasswordSalt).HasMaxLength(255);
            entity.Property(e => e.Prezime)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Telefon).HasMaxLength(20);
            entity.Property(e => e.UlogaId).HasColumnName("UlogaID");

            entity.HasOne(d => d.Uloga).WithMany(p => p.Korisniks)
                .HasForeignKey(d => d.UlogaId)
                .HasConstraintName("FK__Korisnik__UlogaI__267ABA7A");
        });

        modelBuilder.Entity<Placanja>(entity =>
        {
            entity.HasKey(e => e.PlacanjeId).HasName("PK__Placanja__DDE16D8CFE280613");

            entity.ToTable("Placanja");

            entity.Property(e => e.PlacanjeId).HasColumnName("PlacanjeID");
            entity.Property(e => e.ClanarinaId).HasColumnName("ClanarinaID");
            entity.Property(e => e.Iznos).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.Clanarina).WithMany(p => p.Placanjas)
                .HasForeignKey(d => d.ClanarinaId)
                .HasConstraintName("FK__Placanja__Clanar__30F848ED");
        });

        modelBuilder.Entity<PlanIshrane>(entity =>
        {
            entity.HasKey(e => e.PlanIshraneId).HasName("PK__PlanIshr__BDF97A96ABB5CCFD");

            entity.ToTable("PlanIshrane");

            entity.Property(e => e.PlanIshraneId).HasColumnName("PlanIshraneID");
            entity.Property(e => e.Naziv)
                .HasMaxLength(200)
                .IsUnicode(false);
        });

        modelBuilder.Entity<PlanIshraneKorisnik>(entity =>
        {
            entity.HasKey(e => e.PlanIshraneKorisnikId).HasName("PK__PlanIshr__3CA3B72868F0DAF5");

            entity.ToTable("PlanIshraneKorisnik");

            entity.Property(e => e.PlanIshraneKorisnikId).HasColumnName("PlanIshraneKorisnikID");
            entity.Property(e => e.KorisnikId).HasColumnName("KorisnikID");
            entity.Property(e => e.Opis)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.PlanIshraneId).HasColumnName("PlanIshraneID");

            entity.HasOne(d => d.Korisnik).WithMany(p => p.PlanIshraneKorisniks)
                .HasForeignKey(d => d.KorisnikId)
                .HasConstraintName("FK__PlanIshra__Koris__36B12243");

            entity.HasOne(d => d.PlanIshrane).WithMany(p => p.PlanIshraneKorisniks)
                .HasForeignKey(d => d.PlanIshraneId)
                .HasConstraintName("FK__PlanIshra__PlanI__35BCFE0A");
        });

        modelBuilder.Entity<Recenzija>(entity =>
        {
            entity.HasKey(e => e.RecenzijaId).HasName("PK__Recenzij__D36C60908123460A");

            entity.ToTable("Recenzija");

            entity.Property(e => e.RecenzijaId).HasColumnName("RecenzijaID");
            entity.Property(e => e.KorisnikId).HasColumnName("KorisnikID");
            entity.Property(e => e.Tekst).HasColumnType("text");
            entity.Property(e => e.TreningId).HasColumnName("TreningID");

            entity.HasOne(d => d.Korisnik).WithMany(p => p.Recenzijas)
                .HasForeignKey(d => d.KorisnikId)
                .HasConstraintName("FK__Recenzija__Koris__3E52440B");

            entity.HasOne(d => d.Trening).WithMany(p => p.Recenzijas)
                .HasForeignKey(d => d.TreningId)
                .HasConstraintName("FK__Recenzija__Treni__3F466844");
        });

        modelBuilder.Entity<Rezervacija>(entity =>
        {
            entity.HasKey(e => e.RezervacijaId).HasName("PK__Rezervac__CABA44FDFD2C77C0");

            entity.ToTable("Rezervacija");

            entity.Property(e => e.RezervacijaId).HasColumnName("RezervacijaID");
            entity.Property(e => e.DatumVreme).HasColumnType("datetime");
            entity.Property(e => e.KorisnikId).HasColumnName("KorisnikID");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.TreningId).HasColumnName("TreningID");

            entity.HasOne(d => d.Korisnik).WithMany(p => p.Rezervacijas)
                .HasForeignKey(d => d.KorisnikId)
                .HasConstraintName("FK__Rezervaci__Koris__46E78A0C");

            entity.HasOne(d => d.Trening).WithMany(p => p.Rezervacijas)
                .HasForeignKey(d => d.TreningId)
                .HasConstraintName("FK__Rezervaci__Treni__45F365D3");
        });

        modelBuilder.Entity<TipClanarine>(entity =>
        {
            entity.HasKey(e => e.TipClanarineId).HasName("PK__TipClana__341460FFD0BE19C9");

            entity.ToTable("TipClanarine");

            entity.Property(e => e.TipClanarineId).HasColumnName("TipClanarineID");
            entity.Property(e => e.Cena).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Naziv)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Trening>(entity =>
        {
            entity.HasKey(e => e.TreningId).HasName("PK__Trening__3B04A8F3AB61F2E4");

            entity.ToTable("Trening");

            entity.Property(e => e.TreningId).HasColumnName("TreningID");
            entity.Property(e => e.Opis)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.VrstaTreningaId).HasColumnName("VrstaTreningaID");

            entity.HasOne(d => d.VrstaTreninga).WithMany(p => p.Trenings)
                .HasForeignKey(d => d.VrstaTreningaId)
                .HasConstraintName("FK__Trening__VrstaTr__3B75D760");
        });

        modelBuilder.Entity<TreningKorisnik>(entity =>
        {
            entity.HasKey(e => e.TreningKorisnikId).HasName("PK__TreningK__C71A014C11C6B7A6");

            entity.ToTable("TreningKorisnik");

            entity.Property(e => e.TreningKorisnikId).HasColumnName("TreningKorisnikID");
            entity.Property(e => e.DatumVreme).HasColumnType("datetime");
            entity.Property(e => e.KorisnikId).HasColumnName("KorisnikID");
            entity.Property(e => e.Opis)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.TreningId).HasColumnName("TreningID");

            entity.HasOne(d => d.Korisnik).WithMany(p => p.TreningKorisniks)
                .HasForeignKey(d => d.KorisnikId)
                .HasConstraintName("FK__TreningKo__Koris__4316F928");

            entity.HasOne(d => d.Trening).WithMany(p => p.TreningKorisniks)
                .HasForeignKey(d => d.TreningId)
                .HasConstraintName("FK__TreningKo__Treni__4222D4EF");
        });

        modelBuilder.Entity<Uloga>(entity =>
        {
            entity.HasKey(e => e.UlogaId).HasName("PK__Uloga__DCAB23EB17EBF0A7");

            entity.ToTable("Uloga");

            entity.Property(e => e.UlogaId).HasColumnName("UlogaID");
            entity.Property(e => e.Naziv)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VrstaTreninga>(entity =>
        {
            entity.HasKey(e => e.VrstaTreningaId).HasName("PK__VrstaTre__58161930F1CE940E");

            entity.ToTable("VrstaTreninga");

            entity.Property(e => e.VrstaTreningaId).HasColumnName("VrstaTreningaID");
            entity.Property(e => e.Naziv)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Opis)
                .HasMaxLength(200)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
