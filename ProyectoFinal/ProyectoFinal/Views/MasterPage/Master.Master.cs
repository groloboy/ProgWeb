using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class index : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["log"] != null)
            {
                Boolean i = (bool)Session["log"];
                if (i)
                {
                    Mostrar();
                }
                else
                {
                    Ocultar();
                }
            }
            else
            {
                Session["log"] = false;
                Ocultar();
            }
            
            
        }
        public void Mostrar()
        {
            GestionB.Visible = true;
            GestionS.Visible = true;
            GestionT.Visible = true;
            GestionL.Visible = true;
            GestionC.Visible = true;
            log.Visible = true;
            off.Visible = true;
        }
        public void Ocultar()
        {
            GestionB.Visible = false;
            GestionS.Visible = false;
            GestionT.Visible = false;
            GestionL.Visible = false;
            GestionC.Visible = false;
            log.Visible = true;
            off.Visible = false;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            
        }
    }
}