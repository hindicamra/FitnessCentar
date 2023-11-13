using fitnessCentar.Services;
using Microsoft.AspNetCore.Mvc;

namespace fitnessCentar.Controllers
{
    [Route("[controller]")]

    public class BaseCRUDController<T, TSearch, TInsert, TUpdate> : BaseController<T, TSearch> where T : class where TSearch : class
    {
        protected readonly ICRUDService<T, TSearch, TInsert, TUpdate> service;
        protected readonly ILogger<BaseController<T, TSearch>> _logger;

        public BaseCRUDController(ILogger<BaseController<T, TSearch>> logger, ICRUDService<T, TSearch, TInsert, TUpdate> service) : base(logger, service)
        {
        }

        [HttpPost]
        public virtual async Task<T> Insert([FromBody] TInsert insert)
        {
            return await service.Insert(insert);
        }

        [HttpPut("{id}")]
        public virtual async Task<T> Update(int id, [FromBody] TUpdate update)
        {
            return await service.Update(id, update);
        }
    }
}
