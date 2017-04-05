using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Datos
/// </summary>
public class Datos
{
    private static Datos _instancia;

    public static Datos Instancia {
        get
        {
            if (_instancia == null)
                _instancia = new Datos();
            return _instancia;
        }
    }

    public List<Venta> Ventas { get; set; }
    public List<Producto> Productos { set; get; }

    private string nombreAplicacion;

    public string NombreAplicacion
    {
        get { return nombreAplicacion; }
        set { nombreAplicacion = value; }
    }

    private Datos()
    {
        Ventas = new List<Venta>();

        Ventas.Add(new Venta()
        {
            VentaId = 1,
            Cliente = "Juan Perez",
            Nit = "123465",
            Total = 153.25M
        });


        Ventas.Add(new Venta()
        {
            VentaId = 2,
            Cliente = "Pancracia Pinto",
            Nit = "42323423",
            Total = 5263.36M
        });



        Productos = new List<Producto>();
        Productos.Add(new Producto()
        {
            ProductoId = 1,
            Nombre = "Coca-Cola 2Lt",
            Precio = 10
        });
        Productos.Add(new Producto()
        {
            ProductoId = 2,
            Nombre = "Sprite 2Lt",
            Precio = 9.5M
        });
        Productos.Add(new Producto()
        {
            ProductoId = 3,
            Nombre = "Fanta 2Lt",
            Precio = 10
        });
        Productos.Add(new Producto()
        {
            ProductoId = 4,
            Nombre = "Acuarius Manzana 2Lt",
            Precio = 8
        });
        Productos.Add(new Producto()
        {
            ProductoId = 5,
            Nombre = "Pepsi 2Lt",
            Precio = 9.5M
        });

        Productos.Add(new Producto()
        {
            ProductoId = 5,
            Nombre = "Guarana 3Lt",
            Precio = 10.5M
        });



    }

    public Producto GetProductoById(int productoId)
    {
        foreach (Producto obj in Productos)
        {
            if (obj.ProductoId == productoId)
                return obj;
        }
        return null;
    }

}