using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Acreedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string apellido = TextBox1.Text.Trim();
            string nombre = TextBox2.Text.Trim();

            if (string.IsNullOrEmpty(apellido) || string.IsNullOrEmpty(nombre))
            {
                Label1.Text = "Rellene todos los campos";
                return;
            }

            SqlDataSource1.InsertParameters["apellido"].DefaultValue = TextBox1.Text;
            SqlDataSource1.InsertParameters["nombre"].DefaultValue = TextBox2.Text;

            SqlDataSource1.Insert();
            Label1.Text = "Acreedor agregado correctamente.";
        }
    }
}