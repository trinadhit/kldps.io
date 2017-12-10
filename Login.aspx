<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Login</title>
         <link rel="stylesheet" href="css/loginstyle2.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/buttoncss.css" />
       
        <script src="js/index.js" type="text/javascript"></script>
        <style type="text/css">
       
    </style>
    </head>
    <body>
        <div class="container" style="width: 50%">
            <form action="" method="post" id="container">
                <section id="content">
                    <h1>Employee Login</h1>
                    <div>
                        <input type="text" placeholder="Username" required="required" maxlength="20" id="usrname" runat="server" name="usrname" class="username"
                            oninvalid="this.setCustomValidity('Enter User Name Here')" oninput="setCustomValidity('')" />
                    </div>
                    <div>
                        <ul>
                            <li></li>
                        </ul>
                    </div>
                    <div>
                        <input type="password" placeholder="Password" required="required" maxlength="20" id="pass" name="passwrd" runat="server" class="userpassword"
                            oninvalid="this.setCustomValidity('Enter Password Here')" oninput="setCustomValidity('')" />
                        <br />
                        <br />

                    </div>

                    <div>
                        <input type="submit" value="LOGIN" runat="server" id="btnlogin" onserverclick="btnlogin_Click" class="btn btn-success" />
                        <%-- <a href="ForgotPassword.aspx">Change Password</a>--%>
                        <%--<a href="SignUp.aspx">Register</a>--%>
                        <br />
                        <br />
                    </div>
                    <div class="alert alert-danger" id="divmsg" runat="server" visible="false">
                        <asp:Label runat="server" ID="lblmsg" Font-Bold="true"></asp:Label>
                    </div>

                    <!-- form -->
                    <%--<div class="button">
                    <a href="#">Download source file</a>
                </div>--%>
                    <!-- button -->
                </section>
                <!-- content -->
                <!-- container -->
            </form>
        </div>
        <div>
            <ul>
                <li></li>
            </ul>
        </div>
    </body>
    </html>

</asp:Content>

