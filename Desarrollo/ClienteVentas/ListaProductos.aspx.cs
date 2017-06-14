using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaProductos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        try
        {
            VentaService.VentasWebServiceSoapClient cliente = new VentaService.VentasWebServiceSoapClient();
            GridViewProductos.DataSource = cliente.GetProductos();

            GridViewProductos.DataBind();
        }
        catch (Exception  ex)
        {
            
        }
        
    }
}