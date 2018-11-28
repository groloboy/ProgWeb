using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Views.Admin.Servicios
{
    public partial class CrearServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtDescripcion.Attributes.Add("autocomplete", "off");
            txtTitulo.Attributes.Add("autocomplete", "off");
            txtUrl.Attributes.Add("autocomplete", "off");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            var strTitulo = txtTitulo.Text;
            var strDescripcion = txtDescripcion.Text;
            var strUrl = txtUrl.Text;
            string strImagen = "";
            
            if (IsPostBack)
            {
                Boolean fileOK = false;
                String path = Server.MapPath("/Imagenes/Servicios/");
                if (FileUploadSeccion.HasFile)
                {
                    String fileExtension =
                        System.IO.Path.GetExtension(FileUploadSeccion.FileName).ToLower();
                    String[] allowedExtensions =
                        {".gif", ".png", ".jpeg", ".jpg"};
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                if (fileOK)
                {
                    try
                    {
                        FileUploadSeccion.PostedFile.SaveAs(path + FileUploadSeccion.FileName);
                        strImagen = "/Imagenes/Servicios/" + FileUploadSeccion.FileName;
                        lblStatus.Text = "Su archivo se cargó en: " + strImagen;

                        var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
                        var strSQL = "Insert into Servicios(Nombre,Descripcion,urlimagen,urlservicio) values ('" + strTitulo + "','" + strDescripcion + "','" + strImagen + "','" + strUrl + "')";
                        var cmd = new SqlCommand(strSQL, sqlConn);

                        sqlConn.Open();
                        cmd.ExecuteNonQuery();
                        sqlConn.Close();

                        Response.Redirect("~/Views/Admin/GestionServicios.aspx");
                    }
                    catch (Exception ex)
                    {
                        lblStatus.Text = "Error al subir.";
                    }
                }
                else
                {
                    lblStatus.Text = "Este tipo de archivos no esta permitido.";
                }
            }
        }
    }
}