using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1;


namespace WebApplication1.Views.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["log"]=false;
            txtUser.Attributes.Add("autocomplete", "off");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text;
            string contra = txtPass.Text;
            try
            {
                var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
                var strSQL = "SELECT contra FROM admin WHERE usuario ='" + user + "'";
                var cmd = new SqlCommand(strSQL, sqlConn);

                var ds = new DataSet();
                var da = new SqlDataAdapter(cmd);

                sqlConn.Open();
                da.Fill(ds, "admin");
                sqlConn.Close();

                var dt = ds.Tables[0];
                if (dt.Rows[0][0].ToString() == contra && contra != "")
                {
                    Session["log"] = true;                   
                    Response.Redirect("~/Views/Admin/GestionServicios.aspx");
                }
                else
                {
                    Msg.Text = "Error en la contraseña";
                }
                
            }
            catch (Exception ex)
            {
                Msg.Text = "El usuario no existe";
            }
        }
    }
}