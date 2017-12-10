<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Decrypt.aspx.cs" Inherits="Decrypt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Enter Password:
    </div>
        <div><asp:TextBox runat="server" ID="txtpassword"></asp:TextBox></div>
        <div><asp:Label ID="lbl" runat="server"></asp:Label></div>
        <div><asp:Button  runat="server" Text="Submit" OnClick="Unnamed1_Click"/></div>
    </form>
</body>
</html>
