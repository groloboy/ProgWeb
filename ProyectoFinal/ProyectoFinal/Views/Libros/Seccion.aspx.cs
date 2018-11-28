using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinal.Views.Admin.Libros
{
    public partial class Seccion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEstante.Attributes.Add("autocomplete", "off");
        }

        protected void Enviar_Click(object sender, EventArgs e)
        {
            string strEstante = txtEstante.Text;
            string strPiso = DropDownListPiso.SelectedValue;
            string strFile = "";
            if (IsPostBack)
            {
                Boolean fileOK = false;
                String path = Server.MapPath("~/Imagenes/Secciones/");
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
                        strFile = "~/Imagenes/Secciones/" + FileUploadSeccion.FileName;
                        StatusLabel.Text = "Su archivo se cargó en: "+strFile;

                        var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
                        var strSQL = "Insert into seccion(num_estante,foto,id_piso) values ('" + strEstante + "','" + strFile + "','" + strPiso + "')";
                        var cmd = new SqlCommand(strSQL, sqlConn);

                        sqlConn.Open();
                        cmd.ExecuteNonQuery();
                        sqlConn.Close();

                        Response.Redirect("/Views/Libros/Seccion.aspx");
                    }
                    catch (Exception ex)
                    {
                        StatusLabel.Text = "Error al subir.";
                    }
                }
                else
                {
                    StatusLabel.Text = "Este tipo de archivos no esta permitido.";
                }
            }
        }
    }
}