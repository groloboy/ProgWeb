using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Views.User
{
    public partial class Localizar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCodigo.Attributes.Add("autocomplete", "off");
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            string strCodigo = txtCodigo.Text;
            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString);
            var strSQL = "SELECT codigo,titulo,texto,foto,num_estante " +
                "FROM libro l " +
                "JOIN seccion s ON l.id_seccion = s.id_seccion " +
                "JOIN piso p ON p.id_piso = s.id_piso " +
                "WHERE l.codigo = '"+strCodigo+"' OR l.titulo LIKE '%"+strCodigo+"%'";
            var cmd = new SqlCommand(strSQL, sqlConn);
            try
            {
                sqlConn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    TableRow row = new TableRow();
                    TableCell cellTexto = new TableCell();
                    TableCell cellFoto = new TableCell();
                    TableCell cellEstante = new TableCell();
                    TableCell cellCodigo = new TableCell();

                    cellCodigo.Text = reader["titulo"].ToString()+"<br/>"+reader["codigo"].ToString();
                    cellTexto.Text = reader["texto"].ToString();

                    String est = reader["num_estante"].ToString();
                    String sec ="";
                    String col = "";
                    String fil = "";
                    if (est != null & est != "")
                    {
                        int tam_var = est.Length;
                        col = est.Substring((tam_var - 2), 1);
                        fil = est.Substring((tam_var - 1), 1);
                        sec = est.Remove((tam_var - 2), 2);
                    }
                    cellEstante.Text = "Su libro se en cuentra en la seccion "+sec+" columna "+col+" y fila "+fil;
                    
                    string url = reader["foto"].ToString();

                    Image ubicacion = new Image();
                    ubicacion.ImageUrl = url;
                    ubicacion.Width = 500;
                    ubicacion.Height = 500;

                    cellFoto.Controls.Add(ubicacion);

                    row.Cells.Add(cellTexto);
                    row.Cells.Add(cellFoto);
                    row.Cells.Add(cellEstante);
                    row.Cells.Add(cellCodigo);

                    tblLibro.Rows.Add(row);
                }
            }
            catch (Exception)
            {

                throw;
            }

            sqlConn.Close();
        }
    }
}