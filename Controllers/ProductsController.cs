using System.Collections.Generic;
using System.Threading.Tasks;
using efcore_tenancy.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace efcore_tenancy.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly ProductsDbContext context;
        public ProductsController(ProductsDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Product>> Get()
        {
            return await context.Products.ToListAsync();
        }
    }
}
