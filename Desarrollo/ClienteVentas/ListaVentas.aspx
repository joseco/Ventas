<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaVentas.aspx.cs" Inherits="ListaVentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <h1>Listado de Ventas</h1>


    <asp:GridView ID="GridViewVentas" runat="server" CssClass="table-striped"
        GridLines="Both" Width="100%" AutoGenerateColumns="False">
        <EmptyDataTemplate>
            <p class="text-center">
                No hay ventas registradas en el sistema
            </p>
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
            <asp:BoundField DataField="Nit" HeaderText="NIT" />
            <asp:BoundField DataField="Total" HeaderText="Monto Total" />
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
