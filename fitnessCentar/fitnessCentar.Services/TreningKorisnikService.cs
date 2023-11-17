using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public class TreningKorisnikService: BaseCRUDService<Model.TreningKorisnik, Database.TreningKorisnik, TreningKorisnikSearchObject, TreningKorisnikInsertRequest, TreningKorisnikUpdateRequest>, ITreningKorisnikService

    {
        public TreningKorisnikService(FitnessCentarContext context, IMapper mapper)
        : base(context, mapper)
        {
        }
    }
}
