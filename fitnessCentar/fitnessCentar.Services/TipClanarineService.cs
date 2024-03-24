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
    public class TipClanarineService : BaseCRUDService<Model.TipClanarina, Database.TipClanarine, TipClanarineSearchObject, TipClanarinaInsertRequest, TipClanarinaUpdateRequest>, ITipClanarineService
    {
        public TipClanarineService(FitnessCentarContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public override IQueryable<TipClanarine> AddFilter(IQueryable<TipClanarine> query, TipClanarineSearchObject? search = null)
        {
            if (search != null && !string.IsNullOrEmpty(search.Naziv))
            {
                query = query.Where(x => x.Naziv.Contains(search.Naziv));
            }

            return base.AddFilter(query, search);
        }
    }
}
