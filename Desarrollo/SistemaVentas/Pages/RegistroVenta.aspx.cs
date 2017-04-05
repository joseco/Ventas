using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_RegistroVenta : System.Web.UI.Page
{
    public Venta VentaActual
    {
        set { ViewState["VentaActual"] = value; }
        get
        {
            return (Venta)ViewState["VentaActual"];
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            VentaActual = new Venta();

            ProductosGridView.DataSource = new List<Detalle>();
            ProductosGridView.DataBind();

            ProductosComboBox.DataSource = Datos.Instancia.Productos;
            ProductosComboBox.DataBind();
        }
    }

    protected void BtnAgregar_Click(object sender, EventArgs e)
    {
        int productoId = Convert.ToInt32(ProductosComboBox.SelectedValue);
        Producto objProducto = Datos.Instancia.GetProductoById(productoId);
        decimal cantidad = Convert.ToDecimal(CantidadTextBox.Text);

        VentaActual.DetalleVenta.Add(new Detalle()
        {
            Cantidad = cantidad,
            Producto = objProducto
        });

        ProductosGridView.DataSource = VentaActual.DetalleVenta;
        ProductosGridView.DataBind();

        BtnGuardar.Visible = true;

    }

    protected void BtnGuardar_Click(object sender, EventArgs e)
    {

        VentaActual.Cliente = ClienteTextBox.Text;
        VentaActual.Nit = NitTextBox.Text;

        decimal total = 0;
        foreach (Detalle detalle in VentaActual.DetalleVenta)
        {
            total += detalle.Subtotal;
        }
        VentaActual.Total = total;
        Datos.Instancia.Ventas.Add(VentaActual);

        Response.Redirect("ListaVentas.aspx");
    }

    protected void ProductosGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "Quitar")
        {
            int productoId = Convert.ToInt32(e.CommandArgument);
            int indexToDelete = -1;
            int index = 0;
            foreach (Detalle detalle in VentaActual.DetalleVenta)
            {
                if(detalle.ProductoId == productoId)
                {
                    indexToDelete = index;
                    break;
                }
                index++;
            }
            if(indexToDelete >= 0)
                VentaActual.DetalleVenta.RemoveAt(indexToDelete);

            ProductosGridView.DataSource = VentaActual.DetalleVenta;
            ProductosGridView.DataBind();

            if (VentaActual.DetalleVenta.Count == 0)
                BtnGuardar.Visible = false;

        }
    }
}