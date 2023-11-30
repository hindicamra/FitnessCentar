using System;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text;
using System.Text.Encodings.Web;
using fitnessCentar.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Options;

namespace fitnessCentar.Security
{
    public class BasicAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
    {
        IKorisnikService _korisnikService;
        IUlogaService _ulogaService;

        public BasicAuthenticationHandler(
            IKorisnikService korisnikService,
            IUlogaService ulogaService,
            IOptionsMonitor<AuthenticationSchemeOptions> options,
            ILoggerFactory logger,
            UrlEncoder encoder,
            ISystemClock clock)
            : base(options, logger, encoder, clock)
        {
            _korisnikService = korisnikService;
            _ulogaService = ulogaService;
        }

        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {
            if (!Request.Headers.ContainsKey("Authorization"))
            {
                return AuthenticateResult.Fail("Missing Authorization Header");
            }

            Model.Korisnik user = null;
            try
            {
                var authHeader = AuthenticationHeaderValue.Parse(Request.Headers["Authorization"]);
                var credentialBytes = Convert.FromBase64String(authHeader.Parameter);
                var credentials = Encoding.UTF8.GetString(credentialBytes).Split(':');
                var username = credentials[0];
                var password = credentials[1];
                user = await _korisnikService.Login(username, password);
            }
            catch
            {
                return AuthenticateResult.Fail("Invalid Authorization Header");
            }

            if (user == null)
                return AuthenticateResult.Fail("Invalid Username or Password");

            var claims = new List<Claim> {
                new Claim(ClaimTypes.NameIdentifier, user.KorisnickoIme),
                new Claim(ClaimTypes.Name, user.Ime),
            };

            var rola = await _ulogaService.GetById(user.UlogaId);
            claims.Add(new Claim(ClaimTypes.Role, rola.Naziv));

            var identity = new ClaimsIdentity(claims, Scheme.Name);
            var principal = new ClaimsPrincipal(identity);
            var ticket = new AuthenticationTicket(principal, Scheme.Name);

            return AuthenticateResult.Success(ticket);
        }
    }
}

