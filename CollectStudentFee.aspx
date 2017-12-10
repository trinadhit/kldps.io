<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="CollectStudentFee.aspx.cs" Inherits="CollectStudentFee" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8" />
        <title>Collect Student Fee</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <link href="css/buttoncss.css" rel="stylesheet" type="text/css" />
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
        <div class="table-responsive">
            <form method="get" action="" id="myForm">
                <table align="center" style="width: 80%">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <fieldset style="border-color: cadetblue; border-bottom-width: thick">
                                <legend align="center" style="vertical-align: central; font-family: 'Comic Sans MS'; font-size: 18pt; color: cadetblue"><strong>C</strong>ollect 
                                    <strong>S</strong>tudent <strong>Fee</strong> </legend>
                                <table align="center" style="width: 80%">
                                    <tr>
                                        <td align="right" style="font-weight: bold; vertical-align: central;">Enter Student Online Number<span style="color: red">*</span>
                                        </td>
                                        <td style="text-align: left">
                                            <input type="text" runat="server" id="idtxtonlineno" style="vertical-align: central; margin-top: 25px" name="txtonlineno" required="required" class="form-control" />
                                            <%--onchange="idtxtonlineno_TextChanged"--%>
                                            <%--<asp:TextBox ID="txtonlineno" runat="server" OnTextChanged="txtonlineno_TextChanged1" AutoPostBack="true"></asp:TextBox>--%>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="height: 25px">
                                            <input type="submit" runat="server" id="btngetdetails" style="width: 100px" value="Get Details" 
                                                class="btn btn-success" onserverclick="btngetdetails_Click" />
                                            <input type="submit" runat="server" id="btnreset" value="Clear" class="btn btn-success" onserverclick="btnreset_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" runat="server" visible="false" id="tbldata" class="table" style="padding: 20px; width: 100%">
                                <tr>
                                    <td style="text-align: center">
                                        <fieldset style="border-color: cadetblue; border-bottom-width: thick">
                                            <legend align="center" style="vertical-align: central; font-family: 'Comic Sans MS'; font-size: 18pt; font-weight: bold; color: cadetblue">Student Fee Details</legend>

                                            <table class="table table-striped table-bordered table-hover" align="center">
                                                <tr style="padding: 8px; border: solid 1px">
                                                    <td style="padding: 8px; border: solid 1px; text-align: right">Student Online Number</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <asp:Label runat="server" ID="lblonlineno" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>
                                                <%--<tr style="padding: 8px; border: solid 1px">
                                                    <td style="padding: 8px; border: solid 1px">Student Admission Number</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <asp:Label runat="server" ID="lbladmissionno" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>--%>
                                                <tr style="padding: 8px; border: solid 1px">
                                                    <td style="padding: 8px; border: solid 1px; text-align: right">Name</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <asp:Label runat="server" ID="lblname" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="padding: 8px; border: solid 1px">
                                                    <td style="padding: 8px; border: solid 1px; text-align: right">Father Name</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <asp:Label runat="server" ID="lblfathername" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="padding: 8px; border: solid 1px">
                                                    <td style="padding: 8px; border: solid 1px; text-align: right">Gender</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <asp:Label runat="server" ID="lblgender" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="padding: 8px; border: solid 1px">
                                                    <td style="padding: 8px; border: solid 1px; text-align: right">DOB
                                                    </td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <asp:Label runat="server" ID="lbldob" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="padding: 8px; border: solid 1px">
                                                    <td style="padding: 8px; border: solid 1px; text-align: right">Class</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <asp:Label runat="server" ID="lblclass" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="padding: 8px; border: solid 1px; text-align: right">Annual Fee</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <%--<input type="text" runat="server" id="txtanualfee" name="txtanualfee" required="required" style="width: 80px" readonly onkeypress="return isNumber(event)" />--%>
                                                        <asp:Label runat="server" ID="lblannualfee" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>
                                                <%-- <tr>
                                                    <td style="padding: 8px; border: solid 1px">Remaing Fee</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <input type="text" runat="server" id="txtremainingfee" name="txtremainingfee" required="required" style="width: 80px" readonly onkeypress="return isNumber(event)" />
                                                    </td>
                                                </tr>--%>
                                                <tr style="padding: 8px; border: solid 1px">
                                                    <td style="padding: 8px; border: solid 1px; text-align: right">Pending Total Fee</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <asp:Label runat="server" ID="lblpendingfee" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>



                                                <tr>
                                                    <td style="padding: 8px; border: solid 1px; text-align: right">Fee&nbsp; </td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <input type="text" runat="server" required="required" id="txtpaid" name="txtpaid" onchange="fee()" style="width: 80px" onkeypress="return isNumber(event)" />
                                                    </td>
                                                </tr>
                                                <tr id="trfatherno" runat="server" visible="false">
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <asp:Label runat="server" ID="lbladmissionno" CssClass="textcolor" Font-Bold="true"></asp:Label>
                                                    </td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <input type="text" runat="server" required="required" id="txtfatherno" name="txtfatherno" onchange="fee()" style="width: 60px" onkeypress="return isNumber(event)" />
                                                    </td>
                                                </tr>


                                                <%--<tr>
                                                    <td style="padding: 8px; border: solid 1px">Remaining Amount</td>
                                                    <td style="padding: 8px; border: solid 1px">
                                                        <input type="text" runat="server" required="required" id="txtremainingamount" style="width:60px" onkeypress="return isNumber(event)" />
                                                    </td>
                                                </tr>--%>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <table align="center">
                                            <tr id="STDFEE" runat="server">
                                                <td></td>
                                            </tr>
                                            <tr align="center" id="trsave" runat="server" visible="false">
                                                <td align="center">
                                                    <input type="submit" id="sbtnsave" runat="server" value="Save" class="btn btn-success" onserverclick="sbtnsave_Click" />
                                                    <input type="button" id="idclear" runat="server" value="Clear" class="btn btn-success" onserverclick="idclear_Click" />
                                                    <%--<input type="button" runat="server" id="btnprint" value="Print" onserverclick="btnprint_Click" visible="false" style="width: 80px" class="submit" />--%>
                                                    <a href="#" class="btn btn-success btn-lg" runat="server" id="btnprint" value="Print" onserverclick="btnprint_Click" visible="false" style="width: 80px">
                                                        <span class="glyphicon glyphicon-print"></span>Print
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>
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

