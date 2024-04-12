using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public interface IIzvjestajService
    {
        public Task<Model.Izvjestaj> GetZaposleniciIzvjestaj();

        public Task<Model.Izvjestaj> GetKorisniciIzvjestaj();

        public Task<Model.IzvjestajRezervacije> GetRezervacijeIzvjestaj();
    }
}
