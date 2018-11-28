<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Localizar.aspx.cs" Inherits="WebApplication1.Views.User.Localizar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h1>Localiza tu libro</h1>
    <div class="container img-thumbnail organizar">
        <br />
        <div class="row">
            <div class="col-12">
                <label>Aquí puedes localizar tu libro teniendo el código de un libro previamente consultado en <a href="http://biblioteca.uao.edu.co/F/-/?func=find-b-0">Catálogo UAO</a></label>
                <label>El formato del código de claficación debe ser: [418.007 A362L] para evitar errores en tu búsqueda.</label>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" Width="215"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validatorCodigo" CssClass="alert"
                    runat="server" ControlToValidate="txtCodigo"
                    ErrorMessage="Introducir el codigo"
                    InitialValue="">
                </asp:RequiredFieldValidator>
            </div>
            <div class="col-3">
                <asp:Button ID="Buscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="Buscar_Click" />
            </div>
        </div>
        <asp:Table ID="tblLibro" runat="server" CssClass="table"></asp:Table>
        
    </div>
</asp:Content>
