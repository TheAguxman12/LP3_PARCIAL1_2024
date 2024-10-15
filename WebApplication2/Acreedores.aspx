<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acreedores.aspx.cs" Inherits="WebApplication2.Acreedores" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Acreedores</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/menu.aspx">BACK</asp:HyperLink>
            <br />
            <h2>Cargar Acreedor</h2>
            <br />
            Nombre: 
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            Apellido: 
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Cargar" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="....."></asp:Label>
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:conexion %>" 
                SelectCommand="SELECT * FROM Acreedores" 
                InsertCommand="INSERT INTO Acreedores (apellido, nombre) VALUES (@apellido, @nombre)" 
                UpdateCommand="UPDATE Acreedores SET apellido = @apellido, nombre = @nombre WHERE id = @id"
                DeleteCommand="DELETE FROM Acreedores WHERE id = @id">
                <InsertParameters>
                    <asp:Parameter Name="apellido" Type="String" />
                    <asp:Parameter Name="nombre" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="apellido" Type="String" />
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

