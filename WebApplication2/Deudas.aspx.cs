using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class Deudas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataBind();
                GridView1.DataBind();
            }
        }

        protected void ButtonDeuda_Click(object sender, EventArgs e)
        {
            string fecha = TextBoxFecha.Text.Trim();
            string monto = TextBoxMonto.Text.Trim();

            if (string.IsNullOrEmpty(fecha) || string.IsNullOrEmpty(monto))
            {
                LabelDeuda.Text = "Rellene todos los campos";
                return;
            }

            SqlDataSourceDeudas.InsertParameters["idCliente"].DefaultValue = DropDownList1.SelectedValue;
            SqlDataSourceDeudas.InsertParameters["fecha"].DefaultValue = TextBoxFecha.Text;
            SqlDataSourceDeudas.InsertParameters["monto"].DefaultValue = TextBoxMonto.Text;
            SqlDataSourceDeudas.Insert();
            LabelDeuda.Text = "Deuda cargada correctamente.";
        }
    }
}

