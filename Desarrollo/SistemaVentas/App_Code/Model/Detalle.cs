using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Detalle
/// </summary>
[Serializable]
public class Detalle
{
    public Producto Producto { get; set; }
    public decimal Cantidad { get; set; }

    public int ProductoId { get { return Producto.ProductoId; } }

    public string Nombre { get { return Producto.Nombre; } }
    public decimal Precio { get { return Producto.Precio; } }
    public decimal Subtotal { get { return Precio * Cantidad; } }
    

    public Detalle()
    {
        
    }
}