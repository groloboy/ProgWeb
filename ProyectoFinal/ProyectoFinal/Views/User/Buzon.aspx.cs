using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Views.User
{
    public partial class Buzon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var strSugerencia = txtSugerencia.Text;
            var strTipo = lTipos.SelectedValue;
            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
            var strSQL = "Insert into Sugerencias(sugerencia,tipo) values ('" + strSugerencia +"','"+strTipo+"')";
            var cmd = new SqlCommand(strSQL, sqlConn);

            sqlConn.Open();
            cmd.ExecuteNonQuery();
            sqlConn.Close();

            Response.Redirect("/Views/User/Buzon.aspx");
        }
    }
}