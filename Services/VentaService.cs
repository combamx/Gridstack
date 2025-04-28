using Gridstack.Models;
using Microsoft.EntityFrameworkCore;

namespace Gridstack.Services
{
    public class VentaService
    {
        private readonly GridstackContext _context;

        // Singleton constructor
        public VentaService(GridstackContext context)
        {
            _context = context;
        }

        public IEnumerable<Venta> ObtenerVentas()
        {
            return _context.Ventas
                .Include(d => d.DetalleVenta)
                .ToList();
        }
    }
}
