using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace fitnessCentar.Services.Migrations
{
    /// <inheritdoc />
    public partial class Pocetna : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PlanIshranes",
                columns: table => new
                {
                    PlanIshraneId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Opis = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PlanIshranes", x => x.PlanIshraneId);
                });

            migrationBuilder.CreateTable(
                name: "TipClanarines",
                columns: table => new
                {
                    TipClanarineId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Cijena = table.Column<float>(type: "real", nullable: false),
                    Trajanje = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipClanarines", x => x.TipClanarineId);
                });

            migrationBuilder.CreateTable(
                name: "Trenings",
                columns: table => new
                {
                    TreningId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Opis = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Trenings", x => x.TreningId);
                });

            migrationBuilder.CreateTable(
                name: "Ulogas",
                columns: table => new
                {
                    UlogaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ulogas", x => x.UlogaId);
                });

            migrationBuilder.CreateTable(
                name: "Placanjas",
                columns: table => new
                {
                    PlacanjeId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Iznos = table.Column<float>(type: "real", nullable: false),
                    Datum = table.Column<DateTime>(type: "datetime2", nullable: false),
                    TipClanarineId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Placanjas", x => x.PlacanjeId);
                    table.ForeignKey(
                        name: "FK_Placanjas_TipClanarines_TipClanarineId",
                        column: x => x.TipClanarineId,
                        principalTable: "TipClanarines",
                        principalColumn: "TipClanarineId");
                });

            migrationBuilder.CreateTable(
                name: "Korisniks",
                columns: table => new
                {
                    KorisnikId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Ime = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Prezime = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KorisnickoIme = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PasswordSalt = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Telefon = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Addresa = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UlogaId = table.Column<int>(type: "int", nullable: false),
                    Slika = table.Column<byte[]>(type: "varbinary(max)", nullable: true),
                    Status = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Korisniks", x => x.KorisnikId);
                    table.ForeignKey(
                        name: "FK_Korisniks_Ulogas_UlogaId",
                        column: x => x.UlogaId,
                        principalTable: "Ulogas",
                        principalColumn: "UlogaId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Clanarinas",
                columns: table => new
                {
                    ClanarinaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    KorisnikId = table.Column<int>(type: "int", nullable: false),
                    TipClanarineId = table.Column<int>(type: "int", nullable: false),
                    VaziDo = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Clanarinas", x => x.ClanarinaId);
                    table.ForeignKey(
                        name: "FK_Clanarinas_Korisniks_KorisnikId",
                        column: x => x.KorisnikId,
                        principalTable: "Korisniks",
                        principalColumn: "KorisnikId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Clanarinas_TipClanarines_TipClanarineId",
                        column: x => x.TipClanarineId,
                        principalTable: "TipClanarines",
                        principalColumn: "TipClanarineId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PlanIshraneKorisniks",
                columns: table => new
                {
                    PlanIshraneKorisnikId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PlanIshraneId = table.Column<int>(type: "int", nullable: true),
                    KorisnikId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PlanIshraneKorisniks", x => x.PlanIshraneKorisnikId);
                    table.ForeignKey(
                        name: "FK_PlanIshraneKorisniks_Korisniks_KorisnikId",
                        column: x => x.KorisnikId,
                        principalTable: "Korisniks",
                        principalColumn: "KorisnikId");
                    table.ForeignKey(
                        name: "FK_PlanIshraneKorisniks_PlanIshranes_PlanIshraneId",
                        column: x => x.PlanIshraneId,
                        principalTable: "PlanIshranes",
                        principalColumn: "PlanIshraneId");
                });

            migrationBuilder.CreateTable(
                name: "Recenzijas",
                columns: table => new
                {
                    RecenzijaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    KorisnikId = table.Column<int>(type: "int", nullable: false),
                    TreningId = table.Column<int>(type: "int", nullable: false),
                    Tekst = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Ocjena = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Recenzijas", x => x.RecenzijaId);
                    table.ForeignKey(
                        name: "FK_Recenzijas_Korisniks_KorisnikId",
                        column: x => x.KorisnikId,
                        principalTable: "Korisniks",
                        principalColumn: "KorisnikId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Recenzijas_Trenings_TreningId",
                        column: x => x.TreningId,
                        principalTable: "Trenings",
                        principalColumn: "TreningId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Rezervacijas",
                columns: table => new
                {
                    RezervacijaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TreningId = table.Column<int>(type: "int", nullable: false),
                    KorisnikId = table.Column<int>(type: "int", nullable: false),
                    Datum = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Rezervacijas", x => x.RezervacijaId);
                    table.ForeignKey(
                        name: "FK_Rezervacijas_Korisniks_KorisnikId",
                        column: x => x.KorisnikId,
                        principalTable: "Korisniks",
                        principalColumn: "KorisnikId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Rezervacijas_Trenings_TreningId",
                        column: x => x.TreningId,
                        principalTable: "Trenings",
                        principalColumn: "TreningId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "PlanIshranes",
                columns: new[] { "PlanIshraneId", "Naziv", "Opis" },
                values: new object[,]
                {
                    { 1, "Proteinska dijeta", "Visok unos proteina, niskokaloricni obroci" },
                    { 2, "Keto dijeta", "Visok unos masti, vrlo nizak unos ugljenih hidrata" },
                    { 3, "Mediteranska dijeta", "Obilje voca, povrca, ribe i maslinovog ulja" },
                    { 4, "Veganska dijeta", "Ishrana bez proizvoda zivotinjskog porekla" },
                    { 5, "Paleo dijeta", "Ishrana bazirana na namirnicama iz paleolitskog doba" },
                    { 6, "Bezglutenska dijeta", "Izbjegavanje glutena u ishrani" },
                    { 7, "DASH dijeta", "Dijeta usmerena na smanjenje krvnog pritiska" },
                    { 8, "Dijeta sa niskim unosom ugljenih hidrata", "Smanjen unos ugljenih hidrata za mrsavljenje" },
                    { 9, "Sirova hrana dijeta", "Konzumacija sirovih i minimalno obradjenih namirnica" },
                    { 10, "Zone dijeta", "Izbalansiran unos proteina, masti i ugljenih hidrata" }
                });

            migrationBuilder.InsertData(
                table: "TipClanarines",
                columns: new[] { "TipClanarineId", "Cijena", "Naziv", "Trajanje" },
                values: new object[,]
                {
                    { 1, 7f, "7-dnevna", 7 },
                    { 2, 30f, "30-dnevna", 30 },
                    { 3, 60f, "60-dnevna", 60 },
                    { 4, 15f, "Vikend paket", 8 },
                    { 5, 25f, "Student", 30 },
                    { 6, 100f, "Porodicna", 30 },
                    { 7, 20f, "Seniorska", 30 },
                    { 8, 5f, "Proba-7-dnevna", 7 }
                });

            migrationBuilder.InsertData(
                table: "Trenings",
                columns: new[] { "TreningId", "Naziv", "Opis" },
                values: new object[,]
                {
                    { 1, "Trening ruku", "Opis treninga ruku" },
                    { 2, "Trening nogu", "Opis treninga nogu" },
                    { 3, "Trening ledja", "Opis treninga ledja" },
                    { 4, "Trening ramena", "Opis treninga ramena" },
                    { 5, "Kardio trening", "Opis kardio treninga" },
                    { 6, "Trening za cjelokupno tijelo", "Opis treninga za cjelokupno tijelo" },
                    { 7, "Pilates", "Opis pilates treninga" },
                    { 8, "Yoga", "Opis yoga treninga" },
                    { 9, "Trening za snagu", "Opis treninga za snagu" },
                    { 10, "Trening ledja", "Opis treninga ledja" }
                });

            migrationBuilder.InsertData(
                table: "Ulogas",
                columns: new[] { "UlogaId", "Naziv" },
                values: new object[,]
                {
                    { 1, "Admin" },
                    { 2, "Uposlenik" },
                    { 3, "Korisnik" }
                });

            migrationBuilder.InsertData(
                table: "Korisniks",
                columns: new[] { "KorisnikId", "Addresa", "Email", "Ime", "KorisnickoIme", "PasswordHash", "PasswordSalt", "Prezime", "Slika", "Status", "Telefon", "UlogaId" },
                values: new object[,]
                {
                    { 1, "Ulica 1", "admin@gmail.com", "Admin", "admin", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Admin", null, true, "060000000", 1 },
                    { 2, "Ulica 2", "uposlenik@gmail.com", "Uposlenik", "uposlenik", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Uposlenik", null, true, "060000001", 2 },
                    { 3, "Ulica 3", "korisnik@gmail.com", "Korisnik", "korisnik", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Korisnik", null, true, "060000002", 3 },
                    { 4, "Ulica 4", "nejlahindic@gmail.com", "Nejla", "nejlahindic", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Hindic", null, true, "060000003", 3 },
                    { 5, "Ulica 5", "edincilic@gmail.com", "Edin", "edincilic", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Cilic", null, true, "060000004", 3 },
                    { 6, "Ulica 6", "darisjahic@gmail.com", "Daris", "darisjahic", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Jahic", null, true, "060000005", 3 },
                    { 7, "Ulica 7", "saracilic@gmail.com", "Sara", "saracilic", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Cilic", null, true, "060000006", 3 },
                    { 8, "Ulica 8", "selmabehrem@gmail.com", "Selma", "selmabehrem", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Behrem", null, true, "060000007", 3 },
                    { 9, "Ulica 9", "kenanmacic@gmail.com", "Kenan", "kenanmacic", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Macic", null, true, "060000008", 3 },
                    { 10, "Ulica 10", "aldijanadjelmo@gmail.com", "Aldijana", "aldijanadjelmo", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Djelmo", null, true, "060000009", 3 },
                    { 11, "Ulica 11", "lanasefer@gmail.com", "Lana", "lanasefer", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Sefer", null, true, "060000010", 3 },
                    { 12, "Ulica 12", "adnanlulic@gmail.com", "Adnan", "adnanlulic", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Lulic", null, true, "060000011", 3 }
                });

            migrationBuilder.InsertData(
                table: "Placanjas",
                columns: new[] { "PlacanjeId", "Datum", "Iznos", "TipClanarineId" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(39), 60f, 3 },
                    { 2, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(132), 7f, 1 },
                    { 3, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(138), 30f, 2 },
                    { 4, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(143), 15f, 4 },
                    { 5, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(148), 25f, 5 },
                    { 6, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(169), 100f, 6 },
                    { 7, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(181), 20f, 7 },
                    { 8, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(186), 5f, 8 },
                    { 9, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(191), 60f, 3 },
                    { 10, new DateTime(2024, 5, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(197), 30f, 2 }
                });

            migrationBuilder.InsertData(
                table: "Clanarinas",
                columns: new[] { "ClanarinaId", "KorisnikId", "TipClanarineId", "VaziDo" },
                values: new object[,]
                {
                    { 1, 3, 3, new DateTime(2024, 7, 14, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(250) },
                    { 2, 4, 1, new DateTime(2024, 5, 22, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(258) },
                    { 3, 5, 2, new DateTime(2024, 6, 14, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(263) },
                    { 4, 6, 3, new DateTime(2024, 7, 14, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(269) },
                    { 5, 7, 4, new DateTime(2024, 5, 23, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(273) },
                    { 6, 8, 5, new DateTime(2024, 6, 14, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(319) },
                    { 7, 9, 6, new DateTime(2024, 6, 14, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(325) },
                    { 8, 10, 7, new DateTime(2024, 6, 14, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(330) },
                    { 9, 11, 8, new DateTime(2024, 5, 22, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(335) },
                    { 10, 12, 1, new DateTime(2024, 5, 22, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(339) }
                });

            migrationBuilder.InsertData(
                table: "PlanIshraneKorisniks",
                columns: new[] { "PlanIshraneKorisnikId", "KorisnikId", "PlanIshraneId" },
                values: new object[,]
                {
                    { 1, 3, 1 },
                    { 2, 3, 2 },
                    { 3, 4, 1 },
                    { 4, 5, 2 },
                    { 5, 6, 3 },
                    { 6, 7, 1 },
                    { 7, 8, 2 },
                    { 8, 9, 3 },
                    { 9, 10, 1 },
                    { 10, 11, 2 }
                });

            migrationBuilder.InsertData(
                table: "Recenzijas",
                columns: new[] { "RecenzijaId", "KorisnikId", "Ocjena", "Tekst", "TreningId" },
                values: new object[,]
                {
                    { 1, 3, 5, "Odlican trening", 1 },
                    { 2, 4, 4, "Odlican trening, bas mi je prijalo!", 2 },
                    { 3, 5, 5, "Bilo je naporno, ali vrijedilo je.", 3 },
                    { 4, 6, 3, "Solidan trening, moglo bi biti bolje.", 1 },
                    { 5, 7, 5, "Fantasticna energija i atmosfera!", 2 },
                    { 6, 8, 2, "Bilo je previse intenzivno za mene.", 3 },
                    { 7, 9, 4, "Svidja mi se kako je trening strukturisan.", 1 },
                    { 8, 10, 3, "Nisam bas zadovoljan, ocekivala sam vise.", 2 },
                    { 9, 11, 5, "Vrhunski trening, osjecam se sjajno!", 3 },
                    { 10, 12, 4, "Trener je bio odlican, trening je bio izazovan.", 1 },
                    { 11, 3, 3, "Prosjecan trening, nista posebno.", 2 }
                });

            migrationBuilder.InsertData(
                table: "Rezervacijas",
                columns: new[] { "RezervacijaId", "Datum", "KorisnikId", "Status", "TreningId" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 4, 15, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(1150), 3, "Odobrena", 1 },
                    { 2, new DateTime(2024, 4, 17, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(1172), 3, "NaCekanju", 1 },
                    { 3, new DateTime(2024, 4, 18, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(1179), 3, "Odbijena", 1 },
                    { 4, new DateTime(2024, 5, 16, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(1185), 4, "Odobrena", 2 },
                    { 5, new DateTime(2024, 5, 17, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(1191), 5, "NaCekanju", 2 },
                    { 6, new DateTime(2024, 5, 18, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(1196), 6, "Odbijena", 2 },
                    { 7, new DateTime(2024, 5, 16, 16, 31, 25, 995, DateTimeKind.Local).AddTicks(1201), 7, "Odobrena", 3 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Clanarinas_KorisnikId",
                table: "Clanarinas",
                column: "KorisnikId");

            migrationBuilder.CreateIndex(
                name: "IX_Clanarinas_TipClanarineId",
                table: "Clanarinas",
                column: "TipClanarineId");

            migrationBuilder.CreateIndex(
                name: "IX_Korisniks_UlogaId",
                table: "Korisniks",
                column: "UlogaId");

            migrationBuilder.CreateIndex(
                name: "IX_Placanjas_TipClanarineId",
                table: "Placanjas",
                column: "TipClanarineId");

            migrationBuilder.CreateIndex(
                name: "IX_PlanIshraneKorisniks_KorisnikId",
                table: "PlanIshraneKorisniks",
                column: "KorisnikId");

            migrationBuilder.CreateIndex(
                name: "IX_PlanIshraneKorisniks_PlanIshraneId",
                table: "PlanIshraneKorisniks",
                column: "PlanIshraneId");

            migrationBuilder.CreateIndex(
                name: "IX_Recenzijas_KorisnikId",
                table: "Recenzijas",
                column: "KorisnikId");

            migrationBuilder.CreateIndex(
                name: "IX_Recenzijas_TreningId",
                table: "Recenzijas",
                column: "TreningId");

            migrationBuilder.CreateIndex(
                name: "IX_Rezervacijas_KorisnikId",
                table: "Rezervacijas",
                column: "KorisnikId");

            migrationBuilder.CreateIndex(
                name: "IX_Rezervacijas_TreningId",
                table: "Rezervacijas",
                column: "TreningId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Clanarinas");

            migrationBuilder.DropTable(
                name: "Placanjas");

            migrationBuilder.DropTable(
                name: "PlanIshraneKorisniks");

            migrationBuilder.DropTable(
                name: "Recenzijas");

            migrationBuilder.DropTable(
                name: "Rezervacijas");

            migrationBuilder.DropTable(
                name: "TipClanarines");

            migrationBuilder.DropTable(
                name: "PlanIshranes");

            migrationBuilder.DropTable(
                name: "Korisniks");

            migrationBuilder.DropTable(
                name: "Trenings");

            migrationBuilder.DropTable(
                name: "Ulogas");
        }
    }
}
