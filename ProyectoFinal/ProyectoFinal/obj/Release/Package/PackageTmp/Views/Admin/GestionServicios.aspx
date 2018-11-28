<%@ Page Title="Gestion" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="GestionServicios.aspx.cs" Inherits="WebApplication1.Views.Admin.GestionServicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h1>Gestion de Servicios</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:Button ID="Button1" runat="server" Text="Crear nuevo servicio" CssClass="btn btn-primary" PostBackUrl="~/Views/Admin/Servicios/CrearServicio.aspx" />
            </div>
        </div>
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="mGrid">
        
    </asp:GridView>
</asp:Content>
