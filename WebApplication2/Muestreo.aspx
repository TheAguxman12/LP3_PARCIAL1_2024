<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Muestreo.aspx.cs" Inherits="WebApplication2.Muestreo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Muestreo de Deudas</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/menu.aspx">BACK</asp:HyperLink>
            <br />
            <h2>Muestreo de Deudas</h2>
            <br />
            Filtro
            <br />
            <asp:DropDownList ID="DropDownListFecha" runat="server" DataSourceID="SqlDataSourceMuestreo2" DataTextField="fecha" DataValueField="fecha">
                <asp:ListItem Value="" Text="Seleccionar Fecha" />
            </asp:DropDownList>
            <asp:Button ID="ButtonFiltrar_Click1" runat="server" Text="FILTRAR" OnClick="ButtonFiltrar1_Click" />
            <asp:Button ID="ButtonQuitarFiltro" runat="server" Text="QUITAR FILTRO" OnClick="ButtonQuitarFiltro_Click" />
            <br />


            <asp:Label ID="Label1" runat="server" Text="NO HAY DEUDAS VIGENTES" Visible="false"></asp:Label>
            <asp:GridView ID="GridViewMuestreo" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceMuestreo" AllowSorting="True" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="monto" HeaderText="Monto" SortExpression="monto" DataFormatString="{0:C}" />
                    <asp:CommandField DeleteText="Eliminar Deuda" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceMuestreo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:conexion %>" 
                SelectCommand="SELECT a.apellido, a.nombre, d.fecha, d.monto, d.id 
                               FROM Acreedores a 
                               INNER JOIN Deudas d ON a.id = d.idCliente"
                DeleteCommand="DELETE FROM Deudas WHERE id = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>




            <asp:SqlDataSource ID="SqlDataSourceMuestreo2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:conexion %>" 
                SelectCommand="SELECT DISTINCT CONVERT(VARCHAR(10), fecha, 103) AS fecha FROM Deudas">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

