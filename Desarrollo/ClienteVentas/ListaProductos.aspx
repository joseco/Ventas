<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaProductos.aspx.cs" Inherits="ListaProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <asp:GridView ID="GridViewProductos" runat="server" CssClass="table-striped"
            GridLines="Both" Width="100%" AutoGenerateColumns="False">
            <EmptyDataTemplate>
                <p class="text-center">
                    No hay productos registrados en el sistema
                </p>
            </EmptyDataTemplate>
            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
