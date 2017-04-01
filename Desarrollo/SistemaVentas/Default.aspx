<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPages/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="starter-template">

        <asp:TextBox ID="TxtNombre" runat="server"></asp:TextBox>
        <asp:Button ID="BtnSaludo" runat="server" CssClass="btn btn-default" OnClick="BtnSaludo_Click" Text="Saludar" />
        <br />
        <asp:Label ID="SaludoLabel" runat="server" Text="......"></asp:Label>
    </div>






</asp:Content>
