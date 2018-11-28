<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="GestiónLibros.aspx.cs" Inherits="ProyectoFinal.Views.Admin.GestionLibros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h1>Gestion de libros</h1>
    <div class="container">
        <div class="row">
            <div class="col-6">
                
                <a href="/Views/Libros/Libro.aspx">
                    <img src="../../Imagenes/Untitled.png" class="img" style="height:200px; width:200px" />
                    <div class=""><h3>Libros</h3></div>
                </a>
            </div>
            <div class="col-6">
                
                <a href="/Views/Libros/Seccion.aspx">
                    <img src="../../Imagenes/Untitled%20(1).png" class="img" style="height:200px; width:200px"/>
                    <div class=""><h3>Añadir Sección</h3></div>
                </a>
            </div>
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="SqlDataLibros" DataKeyNames="id_libro">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id_libro" HeaderText="id_libro" SortExpression="id_libro" InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="codigo" HeaderText="codigo" SortExpression="codigo" />
                <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                <asp:BoundField DataField="piso" HeaderText="piso" SortExpression="piso" />
                <asp:BoundField DataField="foto" HeaderText="foto" SortExpression="foto" />
                <asp:BoundField DataField="num_estante" HeaderText="num_estante" SortExpression="num_estante" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataLibros" runat="server" 
            ConnectionString="<%$ ConnectionStrings:progWebConnectionString %>" 
            DeleteCommand="DELETE FROM libro WHERE id_libro=@id_libro" 
            SelectCommand="SELECT l.id_libro, l.codigo, l.titulo, s.id_piso as piso, s.foto, s.num_estante FROM libro AS l INNER JOIN seccion AS s ON l.id_seccion = s.id_seccion INNER JOIN piso AS p ON p.id_piso = s.id_piso" 
            UpdateCommand="UPDATE libro SET titulo =@titulo, codigo =@codigo, id_seccion =@id_seccion WHERE id_libro=@id_libro"></asp:SqlDataSource>
    </div>
</asp:Content>
