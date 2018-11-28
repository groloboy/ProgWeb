<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="GestionCuenta.aspx.cs" Inherits="ProyectoFinal.Views.Admin.GestionCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
        <h2>Gestor de cuenta</h2>
        <br />
        <p>Recuerde que solo puede tener un admin y solo puede editar el correo y contraseña.</p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="id"
                AutoGenerateEditButton="True" DataSourceID="SqlDataAdmin">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="usuario" HeaderText="usuario" SortExpression="usuario" />
                <asp:BoundField DataField="contra" HeaderText="contra" SortExpression="contra" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataAdmin" runat="server"
            ConnectionString="<%$ ConnectionStrings:progWebConnectionString %>"
            SelectCommand="SELECT * FROM [admin]"
            UpdateCommand="UPDATE [admin] set [usuario]=@usuario, [contra]=@contra where [id]=@id"></asp:SqlDataSource>
    </div>
</asp:Content>
