using Gridstack.Services;
using Microsoft.AspNetCore.Mvc;

namespace Gridstack.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DetalleVentumController : ControllerBase
    {
        private readonly DetalleVentumService _detalleVentumService;

        public DetalleVentumController(DetalleVentumService detalleVentumService)
        {
            _detalleVentumService = detalleVentumService;
        }

        [HttpGet]
        public IActionResult GetVentas()
        {
            var ventas = _detalleVentumService.GetDetalleVentas();
            return Ok(ventas);
        }
    }
}
