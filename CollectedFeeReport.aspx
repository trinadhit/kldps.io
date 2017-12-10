<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="CollectedFeeReport.aspx.cs" Inherits="CollectedFeeReport" %>


   <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
       <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8" />
        <title>Login form using HTML5 and CSS3</title>
        <link rel="stylesheet" href="css/loginstyle2.css" />
        <link rel="stylesheet" href="css/loginstyle2.css" />
        <script src="js/index.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
        <link href="Content/StyleSheet.css" rel="stylesheet" />
        <script type="text/javascript" src="js/CFSTCommon.js"></script>
        <link href="css/buttoncss.css" rel="stylesheet" />
        <script src="js/index.js"></script>
        <script type="text/javascript" src="js/CFSTCommon.js"></script>
        <script type="text/javascript">
            function ValidateForm() {
                var ddlqly = document.getElementById("ddlstudentemp");

                //var names = document.forms["myForm"]["ddlqly"].value;
                //var month = document.forms["myForm"]["ddldesignationname"].value;

                if (ddlqly.value == "S") {
                    alert("Select Student/Employee"); //<-- here was lert()
                    return false;
                }
            }
        </script>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <script type="text/javascript">
            

        </script>
    </head>
    <body>
        <div>
            <form method="post" action="EmpRegForm.aspx" id="myForm">
                <table align="center" id="tblapproval" runat="server">
                    <tr>
                        <td colspan="3">
                            <table align="center">
                                <tr>
                                    <td colspan="3">
                                        <asp:Label ID="lblmsg" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="text-align: right; font-weight: bold">Student CLass <span style="color: red">*</span></td>
                        <td>
                            <select id="Select1" name="ddlstudentemp" class="select" style="width:150px"  runat="server">
                                <option value="S">Select</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                            </select><span style="color: red"><div id="name_error"></div>
                            </span>
                            <%--  <asp:DropDownList ID="ddlstudentemp" runat="server">
                                <asp:ListItem Text="Select" Value="SELECT"></asp:ListItem>
                                <asp:ListItem Text="Student" Value="S"></asp:ListItem>
                                <asp:ListItem Text="Employee" Value="E"></asp:ListItem>
                            </asp:DropDownList>--%></td>
                    </tr>


                    <tr>
                        <td align="right" style="text-align: right; font-weight: bold">Student Online No. <span style="color: red">*</span></td>
                        <td>
                            <select id="ddlstudentemp" name="ddlstudentemp" class="select" style="width:150px"  runat="server">
                               <%-- <option value="S">Select</option>
                                <option value="STD">STUDENT</option>
                                <option value="E">EMPLOYEE</option>--%>
                            </select><span style="color: red"><div id="name_error"></div>
                            </span>
                            <%--  <asp:DropDownList ID="ddlstudentemp" runat="server">
                                <asp:ListItem Text="Select" Value="SELECT"></asp:ListItem>
                                <asp:ListItem Text="Student" Value="S"></asp:ListItem>
                                <asp:ListItem Text="Employee" Value="E"></asp:ListItem>
                            </asp:DropDownList>--%></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <table>
                                <tr>
                                    <td align="center">
                                        <input type="submit" id="btnsubmit" name="Save" value="GET DETAILS" runat="server"  class="submit" style="width: 150px" onclick="return ValidateForm()" />
                                    </td>
                                    <td>
                                        <input type="reset" id="btnreset" name="reset" value="RESET" class="submit" style="width: 100px" />
                                    </td>

                                </tr>
                            </table>
                        </td>
                    </tr>
                  
                </table>
            </form>
        </div>
    </body>
    </html>
</asp:Content>

