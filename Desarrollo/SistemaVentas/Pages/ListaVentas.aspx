<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ListaVentas.aspx.cs" Inherits="Pages_ListaVentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <h1>Listado de Ventas</h1>


    <asp:GridView ID="GridViewVentas" runat="server" CssClass="table-striped"
        GridLines="None" Width="100%" AutoGenerateColumns="False">
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
    <br />





</asp:Content>

