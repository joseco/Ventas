using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Producto
/// </summary>
[Serializable]
public class Producto
{
    public int ProductoId { get; set; }
    public string Nombre { get; set; }
    public decimal Precio { get; set; }

    public Producto()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}