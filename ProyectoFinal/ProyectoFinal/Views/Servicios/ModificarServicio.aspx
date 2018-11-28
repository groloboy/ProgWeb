<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="ModificarServicio.aspx.cs" Inherits="ProyectoFinal.Views.Admin.Servicios.ModificarServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Modificar Servicio</h2>
        <hr />
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Título</label>
                    <input id="txtTitulo" runat="server" class="form-control" />
                    <span class="text-danger"></span>
                </div>
                <div class="form-group">
                    <label class="control-label">Descripción</label>
                    <textarea id="txtDescripcion" runat="server" class="form-control"></textarea>
                    <span class="text-danger"></span>
                </div>
                <div class="form-group">
                    <label class="control-label">Imagen</label><br />
                    <img src="#" id="txtImg" runat="server" /><br />
                    <label class="control-label">Si desea cambiar la imagen seleccione una nueva y de click en cambiar imagen.</label><br />
                    <label id="lbl" runat="server"></label>

                    <asp:FileUpload ID="FileUploadSeccion" CssClass="form-control" runat="server" />
                    <asp:Button Text="Cambiar Imagen" runat="server" CssClass="btn btn-secondary" OnClick="Aceptar_Click" />

                    <span class="text-danger"></span>
                </div>
                <div class="form-group">
                    <label class="control-label">Url</label>
                    <input id="txtUrl" runat="server" class="form-control" />
                    <span class="text-danger"></span>
                </div>
                <div class="form-group">
                    <a href="#" class="btn btn-info" data-toggle="modal" data-target="#m1">Editar</a>|
                    <a href="#" class="btn btn-danger" data-toggle="modal" data-target="#m2">Eliminar</a>|
                <a class="btn btn-default" href="/Views/Admin/GestionServicios.aspx">Regresar</a>
                    <!-- Modal -->
                    <div class="modal fade" id="m1" role="dialog">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">¡Atención!</h4>
                                </div>
                                <div class="modal-body">
                                    <p>¿Desea Editar?</p>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button Text="Aceptar" runat="server" CssClass="btn btn-success" OnClick="Editar_Click" />
                                    <button type="button" class="btn" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="m2" role="dialog">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">¡Atención!</h4>
                                </div>
                                <div class="modal-body">
                                    <p>¿Desea Eliminar?</p>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button Text="Aceptar" runat="server" CssClass="btn btn-success" OnClick="Eliminar_Click" />
                                    <button type="button" class="btn" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
