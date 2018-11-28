<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="CrearServicio.aspx.cs" Inherits="WebApplication1.Views.Admin.Servicios.CrearServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-4">
            <br />
            <div class="text-danger"></div>
            <div class="form-group">
                <label for="txtTitulo" class="control-label">Titulo</label>
                <asp:TextBox runat="server" ID="txtTitulo" class="form-control" requiered="true" />
            </div>
            <div class="form-group">
                <label for="txtDescripcion" class="control-label">Descripción</label>
                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Columns="50" Rows="10" CssClass="form-control" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtImagen" class="control-label">Url Imagen</label>
                <asp:TextBox runat="server" ID="txtImagen" class="form-control" requiered="true" />
            </div>
            <div class="form-group">
                <label for="txtUrl" class="control-label">Direccion del servicio</label>
                <asp:TextBox runat="server" ID="txtUrl" class="form-control" />
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="btnAceptar_Click" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Views/Admin/GestionServicios.aspx">Regresar</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
