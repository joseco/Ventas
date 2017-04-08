<%@ Page Title="Registro de Ventas" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="RegistroVenta.aspx.cs" Inherits="Pages_RegistroVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">

        <div class="col-md-6">

            <div class="form-group">
                <label>Cliente</label>
                <asp:TextBox ID="ClienteTextBox" runat="server" CssClass="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator ForeColor="Red" runat="server"
                    ControlToValidate="ClienteTextBox" Display="Dynamic"
                    ErrorMessage="Debe ingresar el nombre del Cliente"
                    ValidationGroup="RegistroVenta">
                </asp:RequiredFieldValidator>

            </div>
        </div>

        <div class="col-md-6">


            <div class="form-group">
                <label>NIT</label>
                <asp:TextBox ID="NitTextBox" runat="server" CssClass="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator ForeColor="Red" runat="server"
                    ControlToValidate="NitTextBox" Display="Dynamic" 
                    ErrorMessage="Debe ingresar el NIT" 
                    ValidationGroup="RegistroVenta">
                </asp:RequiredFieldValidator>

            </div>


        </div>


    </div>


    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Seleccione un producto</label>
                <asp:DropDownList ID="ProductosComboBox" runat="server" CssClass="form-control" DataTextField="Nombre" DataValueField="ProductoId"></asp:DropDownList>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="form-group">
                <label>Ingrese la cantidad</label>
                <asp:TextBox ID="CantidadTextBox" runat="server"
                    TextMode="Number" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ForeColor="Red" runat="server"
                    ControlToValidate="CantidadTextBox" Display="Dynamic" 
                    ErrorMessage="Debe ingresar la Cantidad" 
                    ValidationGroup="AgregarArticulo">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ForeColor="Red"
                    ControlToValidate="CantidadTextBox" Display="Dynamic" 
                    ErrorMessage="Debe ingresar un numero" 
                    ValidationExpression="[0-9]*"
                    ValidationGroup="AgregarArticulo">
                </asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="col-md-3">
           <div class="form-group">
                <br />
                <asp:Button ID="BtnAgregar" runat="server"
                    Text="Agregar Articulo" CssClass="btn btn-primary"
                    OnClick="BtnAgregar_Click" 
                    ValidationGroup="AgregarArticulo" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="ProductosGridView" runat="server" Width="100%"
                CssClass="table-striped"
                AutoGenerateColumns="False"
                GridLines="None" OnRowCommand="ProductosGridView_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="BtnQuitar" runat="server"
                                CommandName="Quitar"
                                CommandArgument='<%# Eval("ProductoId") %>'>
                                Quitar
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" />
                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" />
                </Columns>
                <EmptyDataTemplate>
                    <p class="text-center">
                        No se han agregado productos al detalle de la venta
                    </p>

                </EmptyDataTemplate>
            </asp:GridView>


        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <br />
            <asp:Button ID="BtnGuardar" runat="server"
                CssClass="btn btn-primary"
                Text="Registrar Venta" Visible="false" OnClick="BtnGuardar_Click"
                ValidationGroup="RegistroVenta" />
        </div>
    </div>


</asp:Content>

    