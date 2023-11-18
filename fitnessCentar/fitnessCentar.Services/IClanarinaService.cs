using fitnessCentar.Model.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public interface IClanarinaService : ICRUDService<Model.Clanarina, Model.SearchObjects.ClanarinaSearchObject, ClanarinaInsertRequest, ClanarinaUpdateRequest>
    {
    }
}
