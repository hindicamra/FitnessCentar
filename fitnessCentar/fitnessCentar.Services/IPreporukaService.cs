using System;
using fitnessCentar.Model;

namespace fitnessCentar.Services
{
	public interface IPreporukaService
	{
        public Task<List<Preporuka>> Get(int korisnikId);
    }
}

