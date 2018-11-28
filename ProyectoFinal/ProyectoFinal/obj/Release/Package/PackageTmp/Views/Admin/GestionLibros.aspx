<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="GestionLibros.aspx.cs" Inherits="ProyectoFinal.Views.Admin.GestionLibros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h1>Gestion de libros</h1>
    <div class="container">
        <div class="row">
            <div class="col-6">
                
                <a href="Libros/Libro.aspx">
                    <img src="../../Imagenes/Untitled.png" class="img" style="height:200px; width:200px" />
                    <div class=""><h3>Libros</h3></div>
                </a>
            </div>
            <div class="col-6">
                
                <a href="Libros/Seccion.aspx">
                    <img src="../../Imagenes/Untitled%20(1).png" class="img" style="height:200px; width:200px"/>
                    <div class=""><h3>Añadir Seccion</h3></div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
