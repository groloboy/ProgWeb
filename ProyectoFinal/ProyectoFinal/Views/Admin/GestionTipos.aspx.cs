using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinal.Views.Admin.Servicios
{
    public partial class GestionTipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtTipo.Attributes.Add("autocomplete", "off");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            var strTipo = txtTipo.Text;
            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
            var strSQL = "Insert into tipos(tipo) values ('"+strTipo + "')";
            var cmd = new SqlCommand(strSQL, sqlConn);

            sqlConn.Open();
            cmd.ExecuteNonQuery();
            sqlConn.Close();
            Response.Redirect("~/Views/Admin/GestionTipos.aspx");
        }
    }
}