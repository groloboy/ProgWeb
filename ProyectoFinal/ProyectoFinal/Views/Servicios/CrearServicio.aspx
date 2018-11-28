<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="CrearServicio.aspx.cs" Inherits="WebApplication1.Views.Admin.Servicios.CrearServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-4">
            <br />
            <div class="text-danger"></div>
            <div class="form-group">
                <label for="txtTitulo" class="control-label">Título</label>
                <asp:TextBox runat="server" ID="txtTitulo" class="form-control" requiered="true" />
            </div>
            <div class="form-group">
                <label for="txtDescripcion" class="control-label">Descripción</label>
                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Columns="50" Rows="4" CssClass="form-control" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="FileUploadSeccion" class="control-label">Imagen</label>
            <asp:FileUpload ID="FileUploadSeccion" CssClass="form-control" Width="350" required="true" runat="server" />
                <asp:Label runat="server" ID="lblStatus" Text=" " CssClass="alerta"/>
            </div>
            <div class="form-group">
                <label for="txtUrl" class="control-label">Dirección del servicio</label>
                <asp:TextBox runat="server" ID="txtUrl" class="form-control" />
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="btnAceptar_Click" />
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn" NavigateUrl="~/Views/Admin/GestionServicios.aspx">Regresar</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
