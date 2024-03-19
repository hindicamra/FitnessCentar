using fitnessCentar.Filters;
using fitnessCentar.Security;
using fitnessCentar.Services;
using fitnessCentar.Services.Database;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers(x =>
{
    x.Filters.Add<ErrorFilter>();
});
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "Your API", Version = "v1" });

    c.AddSecurityDefinition("basicAuth", new Microsoft.OpenApi.Models.OpenApiSecurityScheme()
    {
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.Http,
        Scheme = "basic"
    });

    c.AddSecurityRequirement(new Microsoft.OpenApi.Models.OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "basicAuth" }
            },
            new string[]{}
        }
    });
});
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<FitnessCentarContext>(options =>
options.UseSqlServer(connectionString));

builder.Services.AddTransient<IKorisnikService, KorisnikService>();
builder.Services.AddTransient<IRecenzijaService, RecenzijaService>();
builder.Services.AddTransient<ITreningService, TreningService>();
builder.Services.AddTransient<IRezervacijaService, RezervacijaService>();

builder.Services.AddTransient<IClanarinaService, ClanarinaService>();
builder.Services.AddTransient<ITipClanarineService, TipClanarineService>();
builder.Services.AddTransient<IPlanIshraneService, PlanIshraneService>();
builder.Services.AddTransient<IPlanIshraneKorisnikService, PlanIshraneKorisnikService>();
builder.Services.AddTransient<IPlacanjaService, PlacanjaService>();

builder.Services.AddTransient<IUlogaService, UlogaService>();
builder.Services.AddTransient<IEmailService, EmailService>();

builder.Services.AddAutoMapper(typeof(IKorisnikService));
builder.Services.AddAuthentication("BasicAuthentication")
    .AddScheme<AuthenticationSchemeOptions, BasicAuthenticationHandler>("BasicAuthentication", null);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
/*using (var scope = app.Services.CreateAsyncScope())
{
    var dataContext = scope.ServiceProvider.GetRequiredService<FitnessCentarContext>();

    dataContext.Database.Migrate();

}*/

app.Run();
