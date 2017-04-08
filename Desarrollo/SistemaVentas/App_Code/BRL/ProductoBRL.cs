using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductoBRL
/// </summary>
public class ProductoBRL
{
    public ProductoBRL()
    {
        
    }

    public static List<Producto> GetProductos()
    {
        ProductoDSTableAdapters.ProductoTableAdapter adapter = new ProductoDSTableAdapters.ProductoTableAdapter();
        ProductoDS.ProductoDataTable table = adapter.GetProductos();

        List<Producto> list = new List<Producto>();
        foreach (var row in table)
        {
            list.Add(new Producto()
            {
                Nombre = row.nombre,
                Precio = row.precio,
                ProductoId = row.productoId
            });
        }
        return list;
    }


    public static Producto GetProductoById(int productoId)
    {
        if (productoId <= 0)
            throw new ArgumentException("Producto Id debe ser mayor o igual que cero");

        ProductoDSTableAdapters.ProductoTableAdapter adapter = new ProductoDSTableAdapters.ProductoTableAdapter();
        ProductoDS.ProductoDataTable table = adapter.GetProductoById(productoId);

        ProductoDS.ProductoRow row = table[0];
        Producto obj = new Producto()
        {
            Nombre = row.nombre,
            Precio = row.precio,
            ProductoId = row.productoId
        };

        return obj;
    }
}