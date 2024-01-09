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


}

    