using fitnessCentar.Model.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public interface IKorisnikService
    {
        Task<List<Model.Korisnik>> Get();

        Model.Korisnik Insert(KorisnikInsertRequest request);
        Model.Korisnik Update(int id, KorisnikUpdateRequest request);

    }
}
