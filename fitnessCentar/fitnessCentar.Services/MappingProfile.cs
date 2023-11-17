using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public class MappingProfile : Profile
    {
        public MappingProfile() 
        {
            CreateMap<Database.Korisnik, Model.Korisnik>();
            CreateMap<Model.Requests.KorisnikInsertRequest, Database.Korisnik>();
            CreateMap<Model.Requests.KorisnikUpdateRequest, Database.Korisnik>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Database.Recenzija, Model.Recenzija>();
            CreateMap<Model.Requests.RecenzijaInsertRequest, Database.Recenzija>();
            CreateMap<Model.Requests.RecenzijaUpdateRequest, Database.Recenzija>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Database.Trening, Model.Trening>();
            CreateMap<Model.Requests.TreningInsertRequest, Database.Trening>();
            CreateMap<Model.Requests.TreningUpdateRequest, Database.Trening>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Database.VrstaTreninga, Model.VrstaTreninga>();
            CreateMap<Model.Requests.VrstaTreningaInsertRequest, Database.VrstaTreninga>();
            CreateMap<Model.Requests.VrstaTreningaUpdateRequest, Database.VrstaTreninga>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Database.TreningKorisnik, Model.TreningKorisnik>();
            CreateMap<Model.Requests.TreningKorisnikInsertRequest, Database.TreningKorisnik>();
            CreateMap<Model.Requests.TreningUpdateRequest, Database.TreningKorisnik>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Database.Uloga, Model.Uloga>();

        }
    }
}
