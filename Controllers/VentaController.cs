using Gridstack.Services;
using Microsoft.AspNetCore.Mvc;

namespace Gridstack.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VentaController : ControllerBase
    {
        private readonly VentaService _ventaService;

        public VentaController(VentaService ventaService)
        {
            _ventaService = ventaService;
        }

        [HttpGet]
        public IActionResult GetVentas()
        {
            var ventas = _ventaService.ObtenerVentas();
            return Ok(ventas);
        }
    }
}
