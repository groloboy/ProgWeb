using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinal.Views.Admin.Servicios
{
    public partial class ModificarServicio : System.Web.UI.Page
    {
        public static string txtImagen;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDescripcion.Attributes.Add("autocomplete", "off");
                txtTitulo.Attributes.Add("autocomplete", "off");
                txtUrl.Attributes.Add("autocomplete", "off");

                var strId = Session["Id"].ToString();

                var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
                var strSQL = "SELECT Nombre,Descripcion,urlimagen,urlservicio FROM Servicios WHERE id=" + strId;
                var cmd = new SqlCommand(strSQL, sqlConn);

                var ds = new DataSet();
                var da = new SqlDataAdapter(cmd);

                sqlConn.Open();
                da.Fill(ds, "Servicios");
                sqlConn.Close();

                var dt = ds.Tables[0];

                txtTitulo.Value = dt.Rows[0][0].ToString();
                txtDescripcion.Value = dt.Rows[0][1].ToString();
                txtImagen = dt.Rows[0][2].ToString();
                Cargar();
                txtUrl.Value = dt.Rows[0][3].ToString();
            }
            
        }
        protected void Cargar()
        {
            txtImg.Attributes.Add("src", txtImagen);
        }
        protected void Editar_Click(object sender, EventArgs e)
        {
            var strTitulo = txtTitulo.Value;
            var strDescripcion = txtDescripcion.Value;
            var strImagen = txtImagen;
            var strUrl = txtUrl.Value;
            var strId = Session["Id"].ToString();

            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
            var strSQL = "UPDATE [Servicios] SET Nombre='"+strTitulo+"',Descripcion='"+strDescripcion+"',urlimagen='"+strImagen+"',urlservicio='"+strUrl+"' WHERE id="+strId+" ";
            var cmd = new SqlCommand(strSQL, sqlConn);

            sqlConn.Open();
            cmd.ExecuteNonQuery();
            sqlConn.Close();

            Response.Redirect("~/Views/Admin/GestionServicios.aspx");
        }
        protected void Eliminar_Click(object sender, EventArgs e)
        {
            var strId = Session["Id"].ToString();

            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
            var strSQL = "DELETE from Servicios WHERE Id="+strId+"";
            var cmd = new SqlCommand(strSQL, sqlConn);

            sqlConn.Open();
            cmd.ExecuteNonQuery();
            sqlConn.Close();
            
            Response.Redirect("~/Views/Admin/GestionServicios.aspx");
        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            

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
                        txtImagen = "/Imagenes/Servicios/" + FileUploadSeccion.FileName;
                        lbl.InnerHtml = "Archivo Modificado"+txtImagen;
                        Cargar();
                    }
                    catch (Exception ex)
                    {
                        lbl.InnerHtml = "Error al subir.";
                    }
                }
                else
                {
                    lbl.InnerHtml = "Este tipo de archivos no esta permitido.";
                }
            }
        }
    }
}