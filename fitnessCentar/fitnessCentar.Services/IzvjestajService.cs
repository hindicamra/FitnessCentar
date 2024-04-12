using AutoMapper;
using fitnessCentar.Model;
using fitnessCentar.Model.Status;
using fitnessCentar.Services.Database;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public class IzvjestajService : IIzvjestajService
    {
        protected FitnessCentarContext _context;


        public IzvjestajService(FitnessCentarContext context)
        {
            _context = context;
        }





        public async Task<Izvjestaj> GetKorisniciIzvjestaj()
        {
            int uloga = (int)Model.Status.Uloga.Korisnik;

            int aktivni = await _context.Korisniks
                .CountAsync(k => k.UlogaId == uloga && k.Status);


            int neaktivni = await _context.Korisniks
                .CountAsync(k => k.UlogaId == uloga && !k.Status);

            int ukupno = await _context.Korisniks
                .CountAsync(k => k.UlogaId == uloga);

            return new Izvjestaj
            {
                Aktivni = aktivni,
                NeAktivni = neaktivni,
                Ukupno = ukupno
            };
        }

        public async Task<IzvjestajRezervacije> GetRezervacijeIzvjestaj()
        {
            int nacekanju = await _context.Rezervacijas.CountAsync(r => r.Status == Enum.GetName(typeof(StatusRezervacije), StatusRezervacije.NaCekanju));
            int odobreno = await _context.Rezervacijas.CountAsync(r => r.Status == Enum.GetName(typeof(StatusRezervacije), StatusRezervacije.Odobrena));
            int odbijeno = await _context.Rezervacijas.CountAsync(r => r.Status == Enum.GetName(typeof(StatusRezervacije), StatusRezervacije.Odbijena));
            int ukupno = await _context.Rezervacijas.CountAsync();

            return new IzvjestajRezervacije
            {
                NaCekanju = nacekanju,
                Odobreno = odobreno,
                Odbijeno = odbijeno,
                Ukupno = ukupno

            };


           
        }

        public async Task<Izvjestaj> GetZaposleniciIzvjestaj()
        {
            int uloga = (int)Model.Status.Uloga.Uposlenik;

            int aktivni = await _context.Korisniks
                .CountAsync(k => k.UlogaId == uloga && k.Status);


            int neaktivni = await _context.Korisniks
                .CountAsync(k => k.UlogaId == uloga && !k.Status);

            int ukupno = await _context.Korisniks
                .CountAsync(k => k.UlogaId == uloga);

            return new Izvjestaj
            {
                Aktivni = aktivni,
                NeAktivni = neaktivni,
                Ukupno = ukupno
            };
        }


    }
}
