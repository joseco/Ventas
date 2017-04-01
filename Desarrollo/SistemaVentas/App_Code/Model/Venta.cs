using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Venta
/// </summary>
public class Venta
{
    public int VentaId { get; set; }
    public string Cliente { get; set; }
    public string Nit { get; set; }
    public decimal Total { get; set; }

    public Venta()
    {
        
    }
}