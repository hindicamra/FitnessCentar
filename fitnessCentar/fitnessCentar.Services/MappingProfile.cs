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
           


            CreateMap<Database.Korisnik, Model.Korisnik>().ForMember(dest => dest.Uloga, opt => opt.MapFrom(src => src.Uloga.Naziv));
            //CreateMap<Database.Korisnik, Model.Korisnik>();
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

           

            

            CreateMap<Database.Clanarina, Model.Clanarina>();
            CreateMap<Model.Requests.ClanarinaInsertRequest, Database.Clanarina>();
            CreateMap<Model.Requests.ClanarinaUpdateRequest, Database.Clanarina>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Database.TipClanarine, Model.TipClanarina>();
            CreateMap<Model.Requests.TipClanarinaInsertRequest, Database.TipClanarine>();
            CreateMap<Model.Requests.TipClanarinaUpdateRequest, Database.TipClanarine>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Database.PlanIshrane, Model.PlanIshrane>();
            CreateMap<Model.Requests.PlanIshraneInsertRequest, Database.PlanIshrane>();
            CreateMap<Model.Requests.PlanIshraneUpdateRequest, Database.PlanIshrane>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Database.PlanIshraneKorisnik, Model.PlanIshraneKorisnik>();
            CreateMap<Model.Requests.PlanIshraneKorisnikInsertRequest, Database.PlanIshraneKorisnik>();
            CreateMap<Model.Requests.PlanIshraneKorisnikUpdateRequest, Database.PlanIshraneKorisnik>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));


            CreateMap<Database.Placanja, Model.Placanja>();
            CreateMap<Model.Requests.PlacanjaInsertRequest, Database.Placanja>();
            CreateMap<Model.Requests.PlacanjaUpdateRequest, Database.Placanja>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Database.Uloga, Model.Uloga>();

        }
    }
}
