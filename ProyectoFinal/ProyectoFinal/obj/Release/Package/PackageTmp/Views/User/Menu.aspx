<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WebApplication1.Views.User.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" DataSourceID="menuDinamico" DataKeyField="Id">
        <ItemTemplate>
            <div class="containers" style="width: 200px">
                <img class="imagenes " src="<%# Eval("urlimagen") %>" data-toggle="collapse" data-target="#m<%#Eval("Id")%>" />
                <div class="middle">
                    <div class="text">
                        <h5><%# Eval("Nombre") %></h5>
                    </div>
                </div>
                <div class="figure-caption collapse" id="m<%#Eval("Id")%>">
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#n<%#Eval("Id")%>">Ver mas</a>
                    <a href="<%# Eval("urlservicio") %>" class="btn btn-primary">Ir al sitio</a>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="n<%#Eval("Id")%>" role="dialog" style="width: 500px">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><%# Eval("Nombre") %></h4>
                        </div>
                        <div class="modal-body">
                            <p class="text-justify">
                                <%# Eval("Descripcion") %>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="menuDinamico" runat="server" ConnectionString="<%$ ConnectionStrings:progWebConnectionString %>" SelectCommand="SELECT * FROM [Servicios]"></asp:SqlDataSource>
    <hr />
    <div class="container">
        <p>¿Deseas recibir notificaciones y boletines informativos sobre la biblioteca? Envíanos tu correo </p>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Añadir correo</button>
        
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Mensaje</h4>
                    </div>
                    <div class="modal-body">
                        <label>Si deseas recibir notificaciones y boletines informativos envianos tu correo</label>
                        <asp:TextBox runat="server" type="email" ID="txtEmail" class="form-control" placeholder="Email" required="true" autofocus="true"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="btnAceptar_Click" />
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
