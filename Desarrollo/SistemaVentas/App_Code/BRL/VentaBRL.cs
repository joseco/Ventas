using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for VentaBRL
/// </summary>
public class VentaBRL
{
    public VentaBRL()
    {

    }

    public static List<Venta> GetVentas()
    {
        VentaDSTableAdapters.VentaTableAdapter adapter = new VentaDSTableAdapters.VentaTableAdapter();
        VentaDS.VentaDataTable table = adapter.GetVentas();

        List<Venta> list = new List<Venta>();
        foreach (var row in table)
        {
            list.Add(new Venta()
            {
                VentaId = row.ventaId,
                Cliente = row.cliente,
                Nit = row.nit,
                Total = row.total,
                Fecha = row.fecha
            });
        }
        return list;
    }

    public static int RegistrarVenta(Venta obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no debe ser nulo");

        if (string.IsNullOrEmpty(obj.Cliente))
            throw new ArgumentException("El cliente no debe ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.Nit))
            throw new ArgumentException("El nit no debe ser nulo o vacio");

        if (obj.DetalleVenta.Count <= 0)
            throw new ArgumentException("El detalle de la venta no puede estar vacio");

        DataTable tblDetalle = new DataTable();
        tblDetalle.Columns.Add("productoId", typeof(int));
        tblDetalle.Columns.Add("precio", typeof(decimal));
        tblDetalle.Columns.Add("cantidad", typeof(int));
        tblDetalle.Columns.Add("subtotal", typeof(decimal));

        foreach (var detalle in obj.DetalleVenta)
        {
            DataRow row = tblDetalle.NewRow();
            row["productoId"] = detalle.ProductoId;
            row["precio"] = detalle.Precio;
            row["cantidad"] = detalle.Cantidad;
            row["subtotal"] = detalle.Subtotal;
            tblDetalle.Rows.Add(row);

        }

        VentaDSTableAdapters.VentaTableAdapter adapter = new VentaDSTableAdapters.VentaTableAdapter();
        int? ventaId = 0;
        adapter.RegistrarVenta(ref ventaId, obj.Cliente, obj.Nit, obj.Total, tblDetalle);

        return ventaId.Value;
    }



}