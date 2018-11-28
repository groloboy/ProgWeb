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
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            var strEmail = txtEmail.Text;
            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
            var strSQL = "Insert into Correos(email) values ('" + strEmail + "')";
            var cmd = new SqlCommand(strSQL, sqlConn);

            sqlConn.Open();
            cmd.ExecuteNonQuery();
            sqlConn.Close();
        }
    }
}