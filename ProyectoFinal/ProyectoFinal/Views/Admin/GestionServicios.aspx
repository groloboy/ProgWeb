<%@ Page Title="Gestion" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="GestionServicios.aspx.cs" Inherits="WebApplication1.Views.Admin.GestionServicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h1>Gestión de Servicios</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:Button ID="Button1" runat="server" Text="Crear nuevo servicio" CssClass="btn btn-primary" PostBackUrl="~/Views/Servicios/CrearServicio.aspx" />
            </div>
        </div>
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="mGrid" AutoGenerateColumns="False" 
        DataKeyNames="Id" DataSourceID="SqlDataServicios">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
            <asp:BoundField DataField="urlimagen" HeaderText="urlimagen" SortExpression="urlimagen" />
            <asp:BoundField DataField="urlservicio" HeaderText="urlservicio" SortExpression="urlservicio" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="ver" runat="server" Text="Seleccionar" CommandArgument='<%# Eval("Id") %>' OnClick="ver_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataServicios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:progWebConnectionString %>" 
        SelectCommand="SELECT * FROM [Servicios]"></asp:SqlDataSource>

</asp:Content>
