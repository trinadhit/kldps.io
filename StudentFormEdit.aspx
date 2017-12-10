<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="StudentFormEdit.aspx.cs" Inherits="StudentFormEdit" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="UTF-8" />
        <title>Student Registration Form Edit</title>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <link href="css/buttoncss.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            .div {
                border-radius: 10px;
                border: 2px solid #ccc;
                background-color: #f8f8f8;
                padding: 20px;
            }

            body {
                margin: 0;
                padding: 0;
                font-family: Arial;
            }

            .modal {
                position: fixed;
                z-index: 999;
                height: 100%;
                width: 100%;
                top: 0;
                background-color: Black;
                filter: alpha(opacity=60);
                opacity: 0.6;
                -moz-opacity: 0.8;
            }

            .center {
                z-index: 1000;
                margin: 300px auto;
                padding: 10px;
                width: 130px;
                background-color: White;
                border-radius: 10px;
                filter: alpha(opacity=100);
                opacity: 1;
                -moz-opacity: 1;
            }

                .center img {
                    height: 128px;
                    width: 128px;
                }
        </style>
        <script type="text/javascript">

            var d = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
                [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
                [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
                [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
                [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
                [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
                [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
                [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
                [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]];
            // The permutation table
            var p = [
                [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
                [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
                [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
                [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
                [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
                [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
                [7, 0, 4, 6, 9, 1, 3, 2, 5, 8]];
            // The inverse table
            var inv = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9];
            //  For a given number generates a Verhoeff digit
            //  Validates that an entered number is Verhoeff compliant.

            function validateVerhoeff() {
                //document.getElementById('txtadhar1'+'txtadhar2'+'txtadhar3').value

                var num = document.getElementById("<%=txtidaadhar1.ClientID %>").value + document.getElementById("<%=txtidaadhar2.ClientID %>").value + document.getElementById("<%=txtidaadhar3.ClientID %>").value;
                //alert(num);
                //alert('hi');
                var num;
                var cc;
                var c = 0;
                var myArray = StringToReversedIntArray(num);
                for (var i = 0; i < myArray.length; i++) {
                    c = d[c][p[(i % 8)][myArray[i]]];
                }
                cc = c;
                if (cc == 0) {
                    //alert("Valid UID");
                }
                else {
                    alert("This is not Valid Aadhar Number");
                    document.getElementById("<%=txtidaadhar1.ClientID %>").value = "";
                    document.getElementById("<%=txtidaadhar2.ClientID %>").value = "";
                    document.getElementById("<%=txtidaadhar3.ClientID %>").value = "";
                }
            }
            /*
            * Converts a string to a reversed integer array.
            */
            function StringToReversedIntArray(num) {

                var myArray = [num.length];

                for (var i = 0; i < num.length; i++) {

                    myArray[i] = (num.substring(i, i + 1));

                }

                myArray = Reverse(myArray);


                return myArray;
            }

            /*
             * Reverses an int array
             */
            function Reverse(myArray) {

                var reversed = [myArray.length];

                for (var i = 0; i < myArray.length ; i++) {
                    reversed[i] = myArray[myArray.length - (i + 1)];

                }
                return reversed;
            }
            function ValidateForm() {
                // var ddlclass = document.getElementById("idddlclass");
                //if (ddlclass.value == "S") {
                //     alert("Select Class"); //<-- here was lert()
                //     return false;
                // }
                var ddlqly1 = document.getElementById("<%=idddlclass.ClientID %>");
                if (ddlqly1.value == "S") {
                    alert("Select Class"); //<-- here was Alert()
                    return false;
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
            function Finelafee() {
                //var totalfee = document.getElementById("txttotalfee").value;
                //var exemptedfee = document.getElementById("txtexemptedfee").value;
                //var needtopay = totalfee - exemptedfee;
                //document.getElementById("txtneedtopay").value = needtopay;

                var totalfee = document.getElementById('<%=txttotalfee.ClientID%>').value;
                var exemptedfee = document.getElementById('<%=txtexemptedfee.ClientID%>').value;
                var needtopay = totalfee - exemptedfee;
                document.getElementById('<%=txtneedtopay.ClientID%>').value = needtopay;

            }
        </script>
    </head>
    <body>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
        <%--<asp:UpdatePanel ID="upd1" runat="server">
                <ContentTemplate>--%>
        <form id="studentregnformedit" method="post" action="StudentFormEdit.aspx">
            <div>
                <table align="center">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblform" CssClass="lblsformname" runat="server"><strong>E</strong>dit <strong>S</strong>tudent <strong>A</strong>dmission <strong>F</strong>orm</asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" class="div" style="width: 800px">
                                <tr>
                                    <td colspan="4">
                                        <table>
                                            <tr>
                                                <td colspan="4" style="color: cadetblue; font-weight: bold" align="center">Enter Student Online No.<span style="color: red"> *</span>
                                                    <%-- <td align="center">--%>

                                                    <input type="text" runat="server" required="required" class="text1" id="txtenterolno" style="width: 300px;" name="txtenterolno" />
                                                    <%-- </td>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <table>
                                                        <tr>
                                                            <td colspan="4" align="center" style="text-align: center">
                                                                <input type="button" id="btngetddetails" runat="server" name="btngetddetails" style="width: 150PX"
                                                                    class="btn btn-success" value="GET DETAILS"
                                                                    onserverclick="btngetddetails_Click" />

                                                                <input type="button" id="btnclear" name="btnclear" runat="server" class="btn btn-success" value="CLEAR" onserverclick="btnclear_Click" />

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>

                                            </tr>
                                        </table>
                                        <br />

                                    </td>
                                </tr>

                                <tr id="trstddata" runat="server" visible="false">
                                    <td>
                                        <table>
                                            <tr>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Admission Number<span style="color: red; vertical-align: middle"> *</span></td>
                                                <td valign="center" align="left">
                                                    <input type="text" runat="server" id="txtAdmissionno" required placeholder="Enter Admission No." class="text1" />
                                                    <%-- <div for="txtAdmissionno" class="errormsg">Enter Admission Number</div>--%>
                                                </td>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">User Name<span style="color: red"> *</span></td>
                                                <td valign="center">
                                                    <input type="text" runat="server" id="idusername" required placeholder="User Name" class="text1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Student First Name<span style="color: red"> *</span></td>
                                                <td valign="center" align="left">
                                                    <input type="text" runat="server" id="idtxtfirstname" required placeholder="Enter First Name" class="text1" />
                                                </td>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Student Last Name<span style="color: red"> *</span></td>
                                                <td valign="center">
                                                    <input type="text" runat="server" id="idtxtlname" required placeholder="Enter Last Name" class="text1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Student DOB<span style="color: red"></span></td>
                                                <td valign="center" align="left">
                                                    <input type="text" id="idtxtdd" name="txtdd" maxlength="2" style="width: 20px" placeholder="DD" runat="server" onkeypress="return isNumber(event)" />
                                                    <input type="text" id="idtxtmm" name="txtmm" maxlength="2" style="width: 20px" placeholder="MM" runat="server" onkeypress="return isNumber(event)" />
                                                    <input type="text" id="idtxtyyyy" name="txtyyyy" maxlength="4" style="width: 40px" placeholder="YYYY" runat="server" onkeypress="return isNumber(event)" />
                                                </td>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Student Gender<span style="color: red"> *</span></td>
                                                <td align="left">
                                                    <input type="radio" name="gender" value="M" checked="checked" id="idmgender" />
                                                    Male
                                            <input type="radio" name="gender" value="F" id="idfgender" />
                                                    Female
                                                </td>
                                                <%--</tr>
                                    <tr>--%>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Class <span style="color: red">*</span></td>
                                                <%-- <td align="right" valign="center" style="height: 30PX; width: 41px; color: cadetblue;text-align:right;">Class<span style="color: red">*</span></td>--%>
                                                <td valign="center">
                                                    <select id="idddlclass" name="ddlclassname" class="select" runat="server">
                                                        <option value="S">Select</option>
                                                        <option value="L">LKG </option>
                                                        <option value="U">UKG </option>
                                                        <option value="1">1st Class</option>
                                                        <option value="2">2nd Class</option>
                                                        <option value="3">3rd Class</option>
                                                        <option value="4">4th Class</option>
                                                        <option value="5">5th Class</option>
                                                        <option value="6">6th Class</option>
                                                        <option value="7">7th Class</option>
                                                        <option value="8">8th Class</option>
                                                        <option value="9">9th Class</option>
                                                        <option value="10">10th Class</option>
                                                    </select>
                                                </td>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Student Father Name<span style="color: red"> *</span></td>
                                                <td valign="center">
                                                    <input type="text" runat="server" id="idtxtfathername" required placeholder="Enter Father Name" class="text1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Student Mother Name<span style="color: red"> *</span></td>
                                                <td valign="center">
                                                    <input type="text" runat="server" id="idtxtmothername" required="required" placeholder="Enter Mother Name" class="text1" />
                                                    <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Bother/Sister Name<span style="color: red">*</span></td>
                                                    <td valign="center">
                                                        <input type="text" runat="server" id="txtbrosisname" required="required" placeholder="Enter Bother/Sister Name" class="text1" />
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Caste<span style="color: red"> *</span></td>
                                                <td valign="center">
                                                    <input type="text" runat="server" id="txtcaste" required="required" placeholder="Enter Caste" class="text1" />
                                                </td>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Occupation Of Parents<span style="color: red"> *</span></td>
                                                <td>
                                                    <input type="text" valign="center" runat="server" id="txtParentsOccupation" required="required" placeholder="Parents Occupation" class="text1" />
                                                </td>
                                            </tr>
                                            <%-- <tr>
                                        <td align="left" valign="center" width="41%">Student Contact No.<span style="color: red">*</span></td>
                                        <td>
                                            <input type="text" runat="server" id="idtxtfno" required placeholder="Student Cont. No." maxlength="10" onkeypress="return isNumber(event)" />
                                        </td>
                                    </tr>--%>
                                            <%-- <tr>
                                        <td align="left" valign="center" width="41%">Mother No.<span style="color: red">*</span></td>
                                        <td>
                                            <input type="text" runat="server" id="idtxtmno" required placeholder="Enter Mother Cont. No." maxlength="10" onkeypress="return isNumber(event)" />
                                        </td>
                                    </tr>--%>
                                            <tr>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Address<span style="color: red"> *</span></td>
                                                <td>
                                                    <textarea maxlength="1000" name="txtaddress" required="required" id="idtxtaddress" style="height: 50px; width: 200px" runat="server"></textarea>
                                                </td>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Contact No.<span style="color: red">*</span></td>
                                                <td valign="center">
                                                    <input type="text" runat="server" id="txtidcontactno" required="required" placeholder="Enter Contact No." maxlength="10" onkeypress="return isNumber(event)" class="text1" />
                                                </td>
                                            </tr>
                                            <%-- <tr>
                                        <td align="left" valign="center" width="41%">Pincode<span style="color: red">*</span></td>
                                        <td>

                                            <input type="text" runat="server" id="idtxtpincode" required placeholder="Enter Pincode" maxlength="6" onkeypress="return isNumber(event)" />
                                        </td>
                                    </tr>--%>
                                            <tr>
                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Student Aadhar No.<span style="color: red"></span></td>
                                                <td valign="center">
                                                    <input type="text" id="txtidaadhar1" name="txtaadhar1" maxlength="4" style="width: 40px" runat="server" onkeypress="return isNumber(event)" />
                                                    <input type="text" id="txtidaadhar2" name="txtaadhar2" maxlength="4" style="width: 40px" runat="server" onkeypress="return isNumber(event)" />
                                                    <input type="text" id="txtidaadhar3" name="txtaadhar3" maxlength="4" style="width: 40px" runat="server" onkeypress="return isNumber(event)" onblur="validateVerhoeff()" />
                                                </td>

                                                <td align="right" valign="center" style="height: 30PX; width: 41%; color: cadetblue">Student Photo <span style="color: red">*</span>
                                                </td>
                                                <td>
                                                    <asp:FileUpload runat="server" ID="imageupload" Width="200px" CssClass="text1" />
                                                    <%--<asp:FileUpload runat="server" ID="FileUpload1" Width="200px" class="text1" />--%>

                                                    <%--<br />
                                            <input type="button" id="btnupload" runat="server" value="Upload" />--%>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                        <td align="text" valign="center" width="41%">Email<span style="color: red">*</span></td>

                                        <td width="57%" valign="center">
                                            <input type="email" name="txtemail" runat="server" required id="txtemail" placeholder="Enter Student Email" onkeyup="email_validate(this.value);" />
                                            <span style="color: red">
                                                <div id="status"></div></td>
                                    </tr>--%>
                                            <tr>
                                                <td align="center" colspan="4">
                                                    <table>
                                                        <tr>
                                                            <td align="right" valign="center" style="height: 30PX; color: cadetblue">Total Fee<span style="color: red">*</span></td>
                                                            <td valign="center">
                                                                <input type="text" id="txttotalfee" name="txttotalfee" style="width: 80px;" runat="server" required="required" class="text1" onkeypress="return isNumber(event)" />
                                                            </td>
                                                            <td align="right" valign="center" style="height: 30PX; color: cadetblue">Exempted Amount<span style="color: red">*</span></td>
                                                            <td>
                                                                <input type="text" runat="server" valign="center" id="txtexemptedfee" style="width: 80px;" name="txtexemptedfee" required="required" class="text1" onkeypress="return isNumber(event)" onchange="Finelafee()" />
                                                            </td>
                                                            <td align="right" valign="center" style="height: 30PX; color: cadetblue">Need To Pay Fee<span style="color: red"> *</span></td>
                                                            <td>
                                                                <%-- <input type="text" valign="center" runat="server" id="txtneedtopay" class="text1"  onchange="txtneedtopay_TextChanged" />--%>

                                                                <input type="text" runat="server" id="txtneedtopay" name="txtneedtopay" style="width: 80px;" required="required" class="text1" readonly="readonly" />
                                                            </td>

                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%--<tr>--%>
                                <tr id="trupdate" runat="server" visible="false">

                                    <td align="center">
                                        <table>
                                            <tr>
                                                <td align="center" colspan="4">
                                                    <table>
                                                        <tr align="center">
                                                            <td align="center" style="width: 100px">
                                                                <input type="submit" runat="server" id="btnupdate" name="btnupdate" value="UPDATE" onserverclick="btnupdate_Click"
                                                                    onclick="return ValidateForm()" style="width: 80px" class="btn btn-success" />
                                                                <%-- </td>

                                                            <td align="center" style="width: 100px">
                                                                <input type="button" runat="server" id="btnprint" value="Print" onserverclick="btnprint_Click" visible="false" style="width: 80px" class="submit" />--%>


                                                                <a href="#" class="btn btn-success btn-lg" runat="server" id="btnprint" value="Print" onserverclick="btnprint_Click" visible="false">
                                                                    <span class="glyphicon glyphicon-print" style="height: 20px"></span>PRINT
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
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </body>
    </html>
</asp:Content>

