using AutoMapper;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using fitnessCentar.Services.Exceptions;
using Microsoft.EntityFrameworkCore;

namespace fitnessCentar.Services
{
    public class PlacanjaService : BaseCRUDService<Model.Placanja, Database.Placanja, PlacanjaSearchObject, PlacanjaInsertRequest, PlacanjaUpdateRequest>, IPlacanjaService
    {
        private readonly ITipClanarineService _tipClanarineService;
        private readonly IClanarinaService _clanarinaService;

        public PlacanjaService(FitnessCentarContext context, IMapper mapper,
            ITipClanarineService tipClanarineService, IClanarinaService clanarinaService) : base(context, mapper)
        {
            _tipClanarineService = tipClanarineService;
            _clanarinaService = clanarinaService;
        }

        public override async Task BeforeInsert(Database.Placanja entity, PlacanjaInsertRequest insert)
        {
            var clanarina = await _context.Clanarinas.FirstOrDefaultAsync(c => c.KorisnikId == insert.KorisnikId);

            var tipClanarine = await _tipClanarineService.GetById(insert.TipClanarineId);

          

            if (clanarina != null)
            {
                

                ClanarinaUpdateRequest updateRequest = new ClanarinaUpdateRequest
                {
                   KorisnikId = clanarina.KorisnikId,
                   TipClanarineId=insert.TipClanarineId,
                   VaziDo = clanarina.VaziDo.AddDays(tipClanarine.Trajanje)
            };

              

                await _clanarinaService.Update(clanarina.ClanarinaId, updateRequest);



            }
            else
            {
                ClanarinaInsertRequest insertRequest = new ClanarinaInsertRequest
                {
                    KorisnikId = insert.KorisnikId,
                    TipClanarineId = insert.TipClanarineId,
                };
               await _clanarinaService.Insert(insertRequest);
            }


            await base.BeforeInsert(entity, insert);

        }


    }
}
