<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Buzon.aspx.cs" Inherits="WebApplication1.Views.User.Buzon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h1>Buzón de sugerencias</h1>
    <div class="container img-thumbnail">
        <br />
        <div class="row">
            <div class="col-12">
                <label>Aqui puedes enviar tus sugerencias, indicando el tipo de sugerencia.</label>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <asp:TextBox ID="txtSugerencia" runat="server" TextMode="MultiLine" Columns="50" Rows="7" CssClass="form-control" Width="700px" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validatorSugerencia" CssClass="alert"
                    runat="server" ControlToValidate="txtSugerencia"
                    ErrorMessage="Añadir sugerencia"
                    InitialValue="">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-12">
                <asp:DropDownList ID="lTipos" runat="server" DataSourceID="tipos" DataTextField="tipo" DataValueField="tipo" CssClass="form-control" Width="170px"></asp:DropDownList>
                <asp:SqlDataSource ID="tipos" runat="server" ConnectionString="<%$ ConnectionStrings:progWebConnectionString %>" SelectCommand="SELECT [tipo] FROM [tipos]"></asp:SqlDataSource>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-2">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Enviar</button>
                
            </div>
            <div class="col-10"></div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">¡Atencion!</h4>
                </div>
                <div class="modal-body">
                    <p>¿Desea completar la operación?</p>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" runat="server" Text="Enviar" CssClass="btn btn-success" OnClick="Button1_Click" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
