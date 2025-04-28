using Gridstack.Models;
using Microsoft.EntityFrameworkCore;

namespace Gridstack.Services
{
    public class DetalleVentumService
    {
        private readonly GridstackContext _context;

        // Singleton constructor
        public DetalleVentumService(GridstackContext context)
        {
            _context = context;
        }

        public List<DetalleVentum> GetDetalleVentas()
        {
            return _context.DetalleVenta
                .Include(d => d.Producto)
                .Include(d => d.Venta)
                .Select(d => new DetalleVentum
                {
                    Id = d.Id,
                    VentaId = d.VentaId ?? 0,
                    ProductoId = d.ProductoId ?? 0,
                    Cantidad = d.Cantidad,
                    PrecioUnitario = d.PrecioUnitario,
                    Subtotal = d.Subtotal ?? 0,
                    Producto = d.Producto,
                    Venta = d.Venta
                }).ToList();
        }
    }
}
