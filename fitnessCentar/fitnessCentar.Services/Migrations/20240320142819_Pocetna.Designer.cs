﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using fitnessCentar.Services.Database;

#nullable disable

namespace fitnessCentar.Services.Migrations
{
    [DbContext(typeof(FitnessCentarContext))]
    [Migration("20240320142819_Pocetna")]
    partial class Pocetna
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.13")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("fitnessCentar.Services.Database.Clanarina", b =>
                {
                    b.Property<int>("ClanarinaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ClanarinaId"));

                    b.Property<int>("KorisnikId")
                        .HasColumnType("int");

                    b.Property<int>("TipClanarineId")
                        .HasColumnType("int");

                    b.Property<DateTime>("VaziDo")
                        .HasColumnType("datetime2");

                    b.HasKey("ClanarinaId");

                    b.HasIndex("KorisnikId");

                    b.HasIndex("TipClanarineId");

                    b.ToTable("Clanarinas");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Korisnik", b =>
                {
                    b.Property<int>("KorisnikId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("KorisnikId"));

                    b.Property<string>("Addresa")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Ime")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("KorisnickoIme")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PasswordHash")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PasswordSalt")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Prezime")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<byte[]>("Slika")
                        .HasColumnType("varbinary(max)");

                    b.Property<bool>("Status")
                        .HasColumnType("bit");

                    b.Property<string>("Telefon")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("UlogaId")
                        .HasColumnType("int");

                    b.HasKey("KorisnikId");

                    b.HasIndex("UlogaId");

                    b.ToTable("Korisniks");

                    b.HasData(
                        new
                        {
                            KorisnikId = 1,
                            Addresa = "Adresa",
                            Email = "admin@gmail.com",
                            Ime = "Admin",
                            KorisnickoIme = "admin",
                            PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
                            PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
                            Prezime = "Admin",
                            Status = true,
                            Telefon = "060000000",
                            UlogaId = 1
                        },
                        new
                        {
                            KorisnikId = 2,
                            Addresa = "Adresa",
                            Email = "uposlenik@gmail.com",
                            Ime = "Uposlenik",
                            KorisnickoIme = "uposlenik",
                            PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
                            PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
                            Prezime = "Uposlenik",
                            Status = true,
                            Telefon = "060000001",
                            UlogaId = 2
                        },
                        new
                        {
                            KorisnikId = 3,
                            Addresa = "Adresa",
                            Email = "korisnik@gmail.com",
                            Ime = "Korisnik",
                            KorisnickoIme = "korisnik",
                            PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
                            PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
                            Prezime = "Korisnik",
                            Status = true,
                            Telefon = "060000002",
                            UlogaId = 3
                        });
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Placanja", b =>
                {
                    b.Property<int>("PlacanjeId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PlacanjeId"));

                    b.Property<DateTime>("Datum")
                        .HasColumnType("datetime2");

                    b.Property<float>("Iznos")
                        .HasColumnType("real");

                    b.Property<int?>("TipClanarineId")
                        .HasColumnType("int");

                    b.HasKey("PlacanjeId");

                    b.HasIndex("TipClanarineId");

                    b.ToTable("Placanjas");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.PlanIshrane", b =>
                {
                    b.Property<int>("PlanIshraneId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PlanIshraneId"));

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Opis")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("PlanIshraneId");

                    b.ToTable("PlanIshranes");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.PlanIshraneKorisnik", b =>
                {
                    b.Property<int>("PlanIshraneKorisnikId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PlanIshraneKorisnikId"));

                    b.Property<int?>("KorisnikId")
                        .HasColumnType("int");

                    b.Property<int?>("PlanIshraneId")
                        .HasColumnType("int");

                    b.HasKey("PlanIshraneKorisnikId");

                    b.HasIndex("KorisnikId");

                    b.HasIndex("PlanIshraneId");

                    b.ToTable("PlanIshraneKorisniks");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Recenzija", b =>
                {
                    b.Property<int>("RecenzijaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("RecenzijaId"));

                    b.Property<int>("KorisnikId")
                        .HasColumnType("int");

                    b.Property<int>("Ocjena")
                        .HasColumnType("int");

                    b.Property<string>("Tekst")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("TreningId")
                        .HasColumnType("int");

                    b.HasKey("RecenzijaId");

                    b.HasIndex("KorisnikId");

                    b.HasIndex("TreningId");

                    b.ToTable("Recenzijas");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Rezervacija", b =>
                {
                    b.Property<int>("RezervacijaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("RezervacijaId"));

                    b.Property<DateTime>("Datum")
                        .HasColumnType("datetime2");

                    b.Property<int>("KorisnikId")
                        .HasColumnType("int");

                    b.Property<string>("Status")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("TreningId")
                        .HasColumnType("int");

                    b.HasKey("RezervacijaId");

                    b.HasIndex("KorisnikId");

                    b.HasIndex("TreningId");

                    b.ToTable("Rezervacijas");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.TipClanarine", b =>
                {
                    b.Property<int>("TipClanarineId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("TipClanarineId"));

                    b.Property<float>("Cijena")
                        .HasColumnType("real");

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("Trajanje")
                        .HasColumnType("int");

                    b.HasKey("TipClanarineId");

                    b.ToTable("TipClanarines");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Trening", b =>
                {
                    b.Property<int>("TreningId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("TreningId"));

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Opis")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("TreningId");

                    b.ToTable("Trenings");

                    b.HasData(
                        new
                        {
                            TreningId = 1,
                            Naziv = "Trening ruku",
                            Opis = "Opis treninga ruku"
                        },
                        new
                        {
                            TreningId = 2,
                            Naziv = "Trening nogu",
                            Opis = "Opis treninga nogu"
                        },
                        new
                        {
                            TreningId = 3,
                            Naziv = "Trening ledja",
                            Opis = "Opis treninga ledja"
                        });
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Uloga", b =>
                {
                    b.Property<int>("UlogaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("UlogaId"));

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("UlogaId");

                    b.ToTable("Ulogas");

                    b.HasData(
                        new
                        {
                            UlogaId = 1,
                            Naziv = "Admin"
                        },
                        new
                        {
                            UlogaId = 2,
                            Naziv = "Uposlenik"
                        },
                        new
                        {
                            UlogaId = 3,
                            Naziv = "Korisnik"
                        });
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Clanarina", b =>
                {
                    b.HasOne("fitnessCentar.Services.Database.Korisnik", "Korisnik")
                        .WithMany("Clanarinas")
                        .HasForeignKey("KorisnikId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("fitnessCentar.Services.Database.TipClanarine", "TipClanarine")
                        .WithMany()
                        .HasForeignKey("TipClanarineId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Korisnik");

                    b.Navigation("TipClanarine");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Korisnik", b =>
                {
                    b.HasOne("fitnessCentar.Services.Database.Uloga", "Uloga")
                        .WithMany("Korisniks")
                        .HasForeignKey("UlogaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Uloga");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Placanja", b =>
                {
                    b.HasOne("fitnessCentar.Services.Database.TipClanarine", "TipClanarine")
                        .WithMany()
                        .HasForeignKey("TipClanarineId");

                    b.Navigation("TipClanarine");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.PlanIshraneKorisnik", b =>
                {
                    b.HasOne("fitnessCentar.Services.Database.Korisnik", "Korisnik")
                        .WithMany("PlanIshraneKorisniks")
                        .HasForeignKey("KorisnikId");

                    b.HasOne("fitnessCentar.Services.Database.PlanIshrane", "PlanIshrane")
                        .WithMany("PlanIshraneKorisniks")
                        .HasForeignKey("PlanIshraneId");

                    b.Navigation("Korisnik");

                    b.Navigation("PlanIshrane");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Recenzija", b =>
                {
                    b.HasOne("fitnessCentar.Services.Database.Korisnik", "Korisnik")
                        .WithMany("Recenzijas")
                        .HasForeignKey("KorisnikId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("fitnessCentar.Services.Database.Trening", "Trening")
                        .WithMany("Recenzijas")
                        .HasForeignKey("TreningId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Korisnik");

                    b.Navigation("Trening");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Rezervacija", b =>
                {
                    b.HasOne("fitnessCentar.Services.Database.Korisnik", "Korisnik")
                        .WithMany("Rezervacijas")
                        .HasForeignKey("KorisnikId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("fitnessCentar.Services.Database.Trening", "Trening")
                        .WithMany("Rezervacijas")
                        .HasForeignKey("TreningId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Korisnik");

                    b.Navigation("Trening");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Korisnik", b =>
                {
                    b.Navigation("Clanarinas");

                    b.Navigation("PlanIshraneKorisniks");

                    b.Navigation("Recenzijas");

                    b.Navigation("Rezervacijas");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.PlanIshrane", b =>
                {
                    b.Navigation("PlanIshraneKorisniks");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Trening", b =>
                {
                    b.Navigation("Recenzijas");

                    b.Navigation("Rezervacijas");
                });

            modelBuilder.Entity("fitnessCentar.Services.Database.Uloga", b =>
                {
                    b.Navigation("Korisniks");
                });
#pragma warning restore 612, 618
        }
    }
}