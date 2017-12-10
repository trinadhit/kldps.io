<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eNCRYPT.aspx.cs" Inherits="eNCRYPT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<table align="center">
<tr>
<td colspan="2">
<b>Encryption and Decryption of Password</b>
</td>
</tr>
<tr>
<td>
UserName
</td>
<td>
<asp:TextBox ID="txtname" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Password
</td>
<td>
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
</td>
</tr>
<tr>
<td>
FirstName
</td>
<td>
<asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
LastName
</td>
<td>
<asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
</td>
<td>
<asp:Button ID="btnSubmit" runat="server" Text="Submit"
onclick="btnSubmit_Click" />
</td>
</tr>
</table>
</div>
<div>
<table align="center">
<tr>
<td>
<b>Encryption of Password Details</b>
</td>
</tr>
<tr>
<td>
<asp:GridView ID="gvUsers" runat="server" CellPadding="4" BackColor="White"
BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
<RowStyle BackColor="White" ForeColor="#330099" />
<FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
<PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"
HorizontalAlign="Left"/>
</asp:GridView>
</td>
</tr>
</table>
</div>
<div>
<table align="center">
<tr>
<td>
<b>Decryption of Password Details</b>
</td>
</tr>
<tr>
<td>
<asp:GridView ID="gvdecryption" runat="server" BackColor="White"
BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4"
onrowdatabound="gvdecryption_RowDataBound">
<RowStyle BackColor="White" ForeColor="#330099" />
<FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
<PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
</asp:GridView>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>
