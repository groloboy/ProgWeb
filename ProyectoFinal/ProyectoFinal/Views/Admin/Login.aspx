<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Views.Admin.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container text-center" style="padding-left: 35%; padding-right: 35%; ">
        <br />
        <br />
        <img class="mb-4" src="/Imagenes/585e4bf3cb11b227491c339a.png" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">Por favor inicia sesión</h1>
        
        <label for="txtUser" class="sr-only">Usuario</label>
        <asp:TextBox runat="server" type="email" ID="txtUser" class="form-control" placeholder="Email" required="true" autofocus="true"></asp:TextBox>
        <label for="txtPass" class="sr-only">Contraseña</label>
        <asp:TextBox runat="server" type="password" ID="txtPass" class="form-control" placeholder="Contraseña" required="true"></asp:TextBox>
        <asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Aceptar" CssClass="btn btn-primary btn-lg btn-block" />
        <asp:Label ID="Msg" runat="server" CssClass="alerta"></asp:Label>
        <p class="mt-5 mb-3 text-muted">2018</p>
    </div>
</asp:Content>
