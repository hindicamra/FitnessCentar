using AutoMapper;
using fitnessCentar.Model;
using fitnessCentar.Model.Requests;
using fitnessCentar.Model.SearchObjects;
using fitnessCentar.Services.Database;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Services
{
    public class KorisnikService : BaseCRUDService<Model.Korisnik, Database.Korisnik, KorisnikSearchObject, KorisnikInsertRequest, KorisnikUpdateRequest>, IKorisnikService 
    {

        public KorisnikService(FitnessCentarContext context, IMapper mapper)
            : base(context, mapper) 
        {
        }

        public override async Task BeforeInsert(Database.Korisnik entity, KorisnikInsertRequest insert)
        {
            entity.PasswordSalt = GenerateSalt();
            entity.PasswordHash = GenerateHash(entity.PasswordSalt, insert.Password);
        }

        public static string GenerateSalt()
        {
            RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
            var byteArray = new byte[16];
            provider.GetBytes(byteArray);

            return Convert.ToBase64String(byteArray);
        }

        public static string GenerateHash(string salt, string password)
        {
            byte[] src = Convert.FromBase64String(salt);
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] dst = new byte[src.Length + bytes.Length];

            System.Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            System.Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            HashAlgorithm algorithm = HashAlgorithm.Create("SHA1");
            byte[] inArray = algorithm.ComputeHash(dst);
            return Convert.ToBase64String(inArray);
        }

        public async Task<Model.Korisnik> Login(string username, string password)
        {
            var entity = await _context.Korisniks.FirstOrDefaultAsync(x => x.KorisnickoIme == username);

            if (entity != null)
            {
                var hash = GenerateHash(entity.PasswordSalt, password);

                if (hash == entity.PasswordSalt)
                {
                    return _mapper.Map<Model.Korisnik>(entity);
                }
            }

            return null;
        }
    }
}
