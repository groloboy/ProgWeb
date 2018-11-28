<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Libro.aspx.cs" Inherits="ProyectoFinal.Views.Admin.Libros.Libro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Libro</h2>
        <br />
        <div class="form-group">
            <label for="txtTitulo" class="control-label">Título del libro</label>
            <asp:TextBox runat="server" ID="txtTitulo" class="form-control" requiered="true" Width="350" />
        </div>
        <br />
        <div class="form-group">
            <label for="txtCodigo" class="control-label">Código de clasificación: </label>
            <asp:TextBox runat="server" ID="txtCodigo" class="form-control" requiered="true" Width="300" />
        </div>
        <br />
        <div class="form-group">
            <label for="txtEstante" class="control-label">Sección: </label>
            <asp:DropDownList ID="DropDownListEstante" runat="server" DataSourceID="SqlDataSourceSeccion" DataTextField="num_estante" DataValueField="id_seccion">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceSeccion" runat="server" ConnectionString="<%$ ConnectionStrings:progWebConnectionString %>" SelectCommand="SELECT [num_estante], [id_seccion] FROM [seccion]"></asp:SqlDataSource>
        </div>
        <br />
        <asp:Button runat="server" ID="Enviar" CssClass="btn btn-primary" Text="Enviar" OnClick="Enviar_Click" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="/Views/Admin/GestionLibros.aspx">Regresar</asp:HyperLink>
    </div>
</asp:Content>
