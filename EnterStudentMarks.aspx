<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="EnterStudentMarks.aspx.cs" Inherits="EnterStudentMarks" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8" />
        <title>Login form using HTML5 and CSS3</title>
        <link rel="stylesheet" href="css/loginstyle2.css" />
        <script src="js/index.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
        <link href="Content/StyleSheet.css" rel="stylesheet" />
        <script type="text/javascript" src="js/CFSTCommon.js"></script>
        <link href="css/buttoncss.css" rel="stylesheet" />
        <script type="text/javascript">
            function ValidateForm() {
                var ddlqly = document.getElementById("ddlqly");
                var ddldes = document.getElementById("ddldesignationname");
                //var names = document.forms["myForm"]["ddlqly"].value;
                //var month = document.forms["myForm"]["ddldesignationname"].value;

                if (ddlqly.value == "S") {
                    alert("Select Qualification"); //<-- here was lert()
                    return false;
                }
                if (ddldes.value == "S") {
                    alert("Select Designation");
                    return false;
                }
                //if (year == null || year == "") {
                //    alert("year must be selected");
                //    return false;
                //}
            }
            function dropdownvalidation() {
                var ddlqly = document.getElementById("ddlqly");
                var ddldes = document.getElementById("ddldesignationname");
                if (ddlqly.value == "S") {
                    //If the "Please Select" option is selected display error.
                    // alert("Please select an option!");
                    document.getElementById("name_error").innerHTML = "Please Select Qualification";
                    return false;
                }
                else {
                    document.getElementById("name_error").innerHTML = "";
                    return true;
                }

                if (ddldes.value == "S") {
                    //If the "Please Select" option is selected display error.
                    // alert("Please select an option!");
                    document.getElementById("designation_error").innerHTML = "Please Select Designation";
                    return false;
                }
                else {
                    document.getElementById("name_error").innerHTML = "";
                    return true;
                }

            }
            function email_validate(email) {
                var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
                if (regMail.test(email) == false) {
                    document.getElementById("status").innerHTML = "Email address is not valid yet.";
                }
                else {
                    document.getElementById("status").innerHTML = "";
                }
            }
            function isNumber(evt) {
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
                    return false;
                }
                return true;
            }
            //$(".number").keydown(function (event) {
            //    if (event.keyCode == 46 || event.keyCode == 8) {
            //    } else {
            //        if (event.keyCode < 95) {
            //            if (event.keyCode < 48 || event.keyCode > 57) {
            //                event.preventDefault();
            //            }
            //        } else {
            //            if (event.keyCode < 96 || event.keyCode > 105) {
            //                event.preventDefault();
            //            }
            //        }
            //    }
            //});
        </script>
    </head>
    <body>
        <div>
            <form method="get" action="" id="myForm">
                <table align="center" style="width: 500px">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-weight: bold; vertical-align: central">Enter Student Online Number:
                        </td>
                        <td>
                            <input type="text" runat="server" id="idtxtonlineno" name="txtonlineno"  required="required" /> <%--onchange="idtxtonlineno_TextChanged"--%>
                            <%--<asp:TextBox ID="txtonlineno" runat="server" OnTextChanged="txtonlineno_TextChanged1" AutoPostBack="true"></asp:TextBox>--%>

                            <br />
                            <br />
                        </td>

                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 25px">
                            <input type="submit" runat="server" id="btngetdetails" value="Get Details" style="border-radius: 25px" onserverclick="btngetdetails_Click" />
                            <input type="reset" runat="server" id="btnreset" value="Reset All" style="border-radius: 25px" onserverclick="btnreset_Click" />
                        </td>
                    </tr>

                </table>
                <table align="CENTER" runat="server" visible="false" id="tbldata">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>Student OL Number:
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lblonlineno" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                    </td>
                                    <td>Name:
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lblname" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Father Name:
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lblfathername" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                    </td>
                                    <td>Gender:
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lblgender" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>


                                <tr>
                                    <td>DOB
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbldob" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                    </td>
                                    <td>Class:
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lblclass" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr id="trgvEnterStudentMarks" runat="server">
                                    <td>
                                        <asp:GridView ID="gvEnterStudentMarks" runat="server" AutoGenerateColumns="false" OnRowCommand="gvEnterStudentMarks_RowCommand"
                                            OnRowDataBound="gvEnterStudentMarks_RowDataBound" OnPageIndexChanging="gvEnterStudentMarks_PageIndexChanging1" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
                                            <%-- HeaderStyle-BackColor="#3AC0F2"
                                HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                                RowStyle-ForeColor="#3A3A3A"--%>
                                            <Columns>
                                                <asp:TemplateField HeaderText="SLNO">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblslno" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:BoundField HeaderText="Name" DataField="NAME" />
                                    <asp:BoundField HeaderText="FATHER NAME" DataField="FATHER_NAME" />
                                    <asp:BoundField HeaderText="GENDER" DataField="GENDER" />--%>
                                                <asp:BoundField HeaderText="CLASS" DataField="CLASS_DESC" />
                                                <asp:BoundField HeaderText="SUBJECT" DataField="SUBJECT_NAME" />
                                                <asp:TemplateField HeaderText="MARKS">
                                                    <ItemTemplate>
                                                        <%--<asp:TextBox runat="server" ID="txtMARKS" onkeypress="return isNumber(event)"></asp:TextBox>--%>
                                                        <input type="text" runat="server" id="txtMARKS" required placeholder="Enter Marks" onkeypress="return isNumber(event)" />
                                                        <%--<asp:TextBox runat="server" ID="txtMARKS" onkeypress="return isNumber(event)"></asp:TextBox>--%>
                                                        <%--<asp:CompareValidator ID="valQtyNumeric" runat="server" ControlToValidate="txtMARKS" Display="Dynamic" SetFocusOnError="true"
                                                Text="" ErrorMessage="Marks must be a number!" Operator="DataTypeCheck" Type="Integer" >        </asp:CompareValidator>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr align="center" id="trsave" runat="server" visible="false">
                                    <td align="center">
                                        <input type="submit" id="idsubmit" runat="server" value="Save" onserverclick="idsubmit_Click" />
                                        <input type="button" id="idclear" runat="server" value="Clear" onserverclick="idclear_Click" />
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

