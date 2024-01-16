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
            //Dobaviti trajanje clanarine i produziti clanarinu

            var clanarina = await _clanarinaService.GetById(insert.ClanarinaId);

            if (clanarina is null)
            {
                throw new UserException("Clanarina sa proslijedjenim Id ne postoji");
            }

            var tipClanarine = await _tipClanarineService.GetById(clanarina.TipClanarineId);

            // Provjera da li je uplacen dovoljan iznos za tip clanarine

            if (insert.Iznos < tipClanarine.Cijena)
            {
                throw new UserException("Nedovoljan iznos za uplatu");
            }

            ClanarinaUpdateRequest updateRequest = _mapper.Map<ClanarinaUpdateRequest>(clanarina);

            updateRequest.VaziDo = clanarina.VaziDo.AddDays(tipClanarine.Trajanje);

            await _clanarinaService.Update(clanarina.ClanarinaId, updateRequest);
        }
    }
}
