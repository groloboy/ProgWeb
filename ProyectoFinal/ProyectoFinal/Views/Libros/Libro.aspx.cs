using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinal.Views.Admin.Libros
{
    public partial class Libro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCodigo.Attributes.Add("autocomplete", "off");
            txtTitulo.Attributes.Add("autocomplete", "off");
        }

        protected void Enviar_Click(object sender, EventArgs e)
        {
            var strTitulo = txtTitulo.Text;
            var strCodigo = txtCodigo.Text;
            var strEstante = DropDownListEstante.SelectedValue;
            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
            var strSQL = "Insert into libro(titulo,codigo,id_seccion) values ('" + strTitulo + "','" + strCodigo + "','" + strEstante + "')";
            var cmd = new SqlCommand(strSQL, sqlConn);

            sqlConn.Open();
            cmd.ExecuteNonQuery();
            sqlConn.Close();
            Response.Redirect("/Views/Libros/Libro.aspx");
        }
    }
}