using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Muestreo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (GridViewMuestreo.Rows.Count == 0)
                {
                    Label1.Visible = true;
                    Label1.Text = "No hay deudas registradas";
                }
            }
        }

        protected void GridViewMuestreo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlDataSourceMuestreo.DeleteParameters["id"].DefaultValue = GridViewMuestreo.DataKeys[e.RowIndex].Value.ToString();
            SqlDataSourceMuestreo.Delete();
            GridViewMuestreo.DataBind();
        }

        protected void ButtonFiltrar1_Click(object sender, EventArgs e)
        {
            string fecha = DropDownListFecha.SelectedValue;

            if (!string.IsNullOrEmpty(fecha))
            {
                SqlDataSourceMuestreo.SelectCommand = @"SELECT a.apellido, a.nombre, d.fecha, d.monto, d.id 
                                                        FROM Acreedores a 
                                                        INNER JOIN Deudas d ON a.id = d.idCliente
                                                        WHERE CONVERT(VARCHAR(10), d.fecha, 103) = @fecha";
                SqlDataSourceMuestreo.SelectParameters.Clear();
                SqlDataSourceMuestreo.SelectParameters.Add("fecha", fecha);
                GridViewMuestreo.DataBind();
            }
        }

        protected void ButtonQuitarFiltro_Click(object sender, EventArgs e)
        {
            SqlDataSourceMuestreo.SelectCommand = @"SELECT a.apellido, a.nombre, d.fecha, d.monto, d.id 
                                                    FROM Acreedores a 
                                                    INNER JOIN Deudas d ON a.id = d.idCliente";
            SqlDataSourceMuestreo.SelectParameters.Clear();
            GridViewMuestreo.DataBind();
        }
    }
}

