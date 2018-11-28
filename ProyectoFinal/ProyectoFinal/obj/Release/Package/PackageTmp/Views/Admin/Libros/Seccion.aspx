<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Seccion.aspx.cs" Inherits="ProyectoFinal.Views.Admin.Libros.Seccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Sección</h2>
        <br />
        <div class="form-group">
            <label for="txtEstante" class="control-label">Codigo del estante (el codigo debe tener este formato: 8A15)</label>
            <asp:TextBox runat="server" ID="txtEstante" class="form-control" requiered="true" Width="100" />
        </div>
        <div class="form-group">
            <label for="DropDownListPiso" class="control-label">Piso</label>&nbsp;
                <asp:DropDownList ID="DropDownListPiso" runat="server" CssClass="form-control" Width="100" DataSourceID="SqlDataSourcePiso" DataTextField="id_piso" DataValueField="id_piso">
                </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourcePiso" runat="server" ConnectionString="<%$ ConnectionStrings:progWebConnectionString %>" SelectCommand="SELECT [id_piso] FROM [piso]"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <label for="FileUploadSeccion" class="control-label">Imagen</label>
            <asp:FileUpload ID="FileUploadSeccion" CssClass="form-control" Width="350" required="true" runat="server" />
        </div>
        <asp:Button runat="server" ID="Enviar" CssClass="btn btn-primary" Text="Enviar" OnClick="Enviar_Click" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="../GestionLibros.aspx">Regresar</asp:HyperLink>
        <br />
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text=" " CssClass="alerta"/>
    </div>
</asp:Content>
