using Gridstack.Models;
using Microsoft.EntityFrameworkCore;

namespace Gridstack.Services
{
    public class ProductoService
    {
        private readonly GridstackContext _context;

        // Singleton constructor
        public ProductoService(GridstackContext context)
        {
            _context = context;
        }

        public IEnumerable<Producto> ObtenerProductos()
        {
            return _context.Productos
                .Include(d => d.DetalleVenta)
                .ToList();
        }

        public bool GuardarProductos(IEnumerable<Producto> productos)
        {
            _context.Productos.AddRange(productos);
            return _context.SaveChanges() > 0;
        }

        public bool EliminarProductos(IEnumerable<Producto> productos)
        {
            _context.Productos.RemoveRange(productos);
            return _context.SaveChanges() > 0;
        }

        public bool ActualizarProductos(IEnumerable<Producto> productos)
        {
            _context.Productos.UpdateRange(productos);
            return _context.SaveChanges() > 0;
        }
    }
}
