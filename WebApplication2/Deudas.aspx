<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deudas.aspx.cs" Inherits="WebApplication2.Deudas" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Deudas por Proveedor</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/menu.aspx">BACK</asp:HyperLink>
            <br />
            <h2>Acreedores Cargados</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id">
                <Columns>
                    
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:CommandField DeleteText="Eliminar Acreedor" ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:conexion %>"
                SelectCommand="SELECT * FROM [Acreedores]" DeleteCommand="DELETE FROM [Acreedores] WHERE [id] = @id" InsertCommand="INSERT INTO [Acreedores] ([apellido], [nombre]) VALUES (@apellido, @nombre)" UpdateCommand="UPDATE [Acreedores] SET [apellido] = @apellido, [nombre] = @nombre WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="apellido" Type="String"></asp:Parameter>
                    <asp:Parameter Name="nombre" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="apellido" Type="String"></asp:Parameter>
                    <asp:Parameter Name="nombre" Type="String"></asp:Parameter>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />
            
            <h2>Cargar Deuda</h2>
            <br />
            Seleccionar Acreedor: 
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="apellido" DataValueField="id"></asp:DropDownList>
            <br />
            Fecha de Deuda: 
            <asp:TextBox ID="TextBoxFecha" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            Monto: 
            <asp:TextBox ID="TextBoxMonto" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonDeuda" runat="server" Text="Cargar Deuda" OnClick="ButtonDeuda_Click" />
            <br />
            <asp:Label ID="LabelDeuda" runat="server" Text="....."></asp:Label>

            <asp:SqlDataSource ID="SqlDataSourceDeudas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:conexion %>" 
                InsertCommand="INSERT INTO Deudas (idCliente, fecha, monto) VALUES (@idCliente, @fecha, @monto)">
                <InsertParameters>
                    <asp:Parameter Name="idCliente" Type="Int32" />
                    <asp:Parameter Name="fecha" Type="DateTime" />
                    <asp:Parameter Name="monto" Type="Decimal" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>


