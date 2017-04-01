<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ListaVentas.aspx.cs" Inherits="Pages_ListaVentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <h1>Listado de Ventas</h1>





    <asp:GridView ID="GridViewVentas" runat="server" CssClass="table-striped" GridLines="None" Width="100%">
    </asp:GridView>
    <br />





</asp:Content>

