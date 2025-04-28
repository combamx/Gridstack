using Gridstack.Services;
using Microsoft.AspNetCore.Mvc;

namespace Gridstack.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        private readonly ProductoService _productoService;

        public ProductoController(ProductoService productoService)
        {
            _productoService = productoService;
        }

        [HttpGet]
        public IActionResult GetProductos()
        {
            var productos = _productoService.ObtenerProductos();
            return Ok(productos);
        }
    }
}
