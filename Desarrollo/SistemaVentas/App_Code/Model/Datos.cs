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

    }
}