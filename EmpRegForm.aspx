<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="EmpRegForm.aspx.cs" Inherits="EmpRegForm" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8" />
        <title>Emp Registration Form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <link href="css/buttoncss.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            .div {
                border-radius: 10px;
                /*border: 2px solid #ccc;*/
                background-color: #f8f8f8;
                padding: 20px;
            }

            .auto-style1 {
                width: 37px;
            }

            .auto-style2 {
                display: block;
                width: 257px;
                height: 72px;
                font-size: 14px;
                line-height: 1.42857143;
                color: #555;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
                -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
                border: 1px solid #ccc;
                padding: 6px 12px;
                background-color: #fff;
                background-image: none;
            }

            .auto-style3 {
                height: 30PX;
                width: 28%;
            }
        </style>
        <script type="text/javascript">
            function ValidateForm() {
                //var ddlqly = document.getElementById("ddlqly");
                //var ddldes = document.getElementById("ddldesignationname");
                //var names = document.forms["myForm"]["ddlqly"].value;
                //var month = document.forms["myForm"]["ddldesignationname"].value;
                //if (ddlqly.value == "S") {
                //    alert("Select Qualification"); //<-- here was lert()
                //    return false;
                //}
                //if (ddldes.value == "S") {
                //    alert("Select Designation");
                //    return false;
                //}
                var ddlqly1 = document.getElementById("<%=ddlqly.ClientID %>");
                var ddldes = document.getElementById("<%=ddldesignationname.ClientID%>")
                if (ddlqly1.value == "S") {
                    alert("Select Qualification"); //<-- here was lert()
                    return false;
                }
                if (ddldes.value == "S") {
                    alert("Select Designation");
                    return false;
                }
            }


            function dropdownvalidation() {
                //var ddlqly = document.getElementById("ddlqly");
                //var ddldes = document.getElementById("ddldesignationname");
                //if (ddlqly.value == "S") {
                //    //If the "Please Select" option is selected display error.
                //    // alert("Please select an option!");
                //    document.getElementById("name_error").innerHTML = "Please Select Qualification";
                //    return false;
                //}
                //else {
                //    document.getElementById("name_error").innerHTML = "";
                //    return true;
                //}
                var ddlqly = document.getElementById("ddlqly");
                var ddldes = document.getElementById("ddldesignationname");
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

            //         Validates that an entered number is Verhoeff compliant.

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
                    document.getElementById("<%=txtidaadhar1.ClientID %>").focus;
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
        </script>
    </head>
    <body>
        <form method="post" action="EmpRegForm.aspx" id="myForm">
            <div>
                 <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                <table align="center" style="width: 70%;">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <p id="error" runat="server"></p>
                        </td>
                    </tr>
                    <%-- <tr>
                        <td align="center">
                            <asp:Label ID="lblschoolname" CssClass="lblschoolname" Text="KALIDINDI E.M HIGH SCHOOL" runat="server"></asp:Label>
                        </td>

                    </tr>--%>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblform" CssClass="lblsformname" runat="server"><strong>E</strong>mployee <strong>R</strong>egistration <strong>F</strong>orm</asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <%--   <fieldset class="fieldset">
                                <legend class="legend" align="center">Employee Registration Form</legend>--%>
                            <table align="center" class="div">
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="center" style="height: 30PX; width: 30%; color: cadetblue">User Name</td>
                                    <td class="auto-style1"><span style="color: red">*</span></td>
                                    <td style="height: 30PX; width: 40%">
                                        <input type="text" required="required" name="txtusername" placeholder="Enter User Name" style="width: 200px" runat="server" id="txtusername" class="form-control text1" />
                                    </td>
                                    <td align="right" valign="center" style="color: cadetblue" class="auto-style3">First Name</td>
                                    <td style="width: 20px"><span style="color: red">*</span></td>
                                    <td style="height: 30PX; width: 40%">
                                        <input type="text" required name="txtname" placeholder="Enter Name" runat="server" style="width: 183px" id="txtname" class="form-control text1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="center" style="height: 30PX; width: 30%; color: cadetblue">Last Name</td>
                                    <td class="auto-style1"><span style="color: red">*</span></td>
                                    <td style="height: 30PX; width: 40%">
                                        <input type="text" required name="txtsurname" placeholder="Enter Surname" style="width: 200px" runat="server" id="txtsurname" class="form-control text1" />
                                    </td>
                                    <td align="right" valign="center" style="color: cadetblue" class="auto-style3">Father's/Husband's Name</td>
                                    <td style="width: 20px"><span style="color: red">*</span></td>
                                    <td style="height: 30PX; width: 40%">
                                        <input type="text" required name="txtfather" style="width: 180px" placeholder="Enter Father/Husband Name" runat="server" id="txtfather1" class="form-control text1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="center" style="height: 30PX; width: 30%; color: cadetblue">Gender</td>
                                    <td class="auto-style1"><span style="color: red">*</span></td>
                                    <td style="height: 30PX; width: 40%">
                                        <input type="radio" name="gender" value="M" checked="checked" id="mgender" />
                                        Male
                                            <input type="radio" name="gender" value="F" id="fgender" />
                                        Female
                                    </td>
                                    <td align="right" valign="center" style="color: cadetblue" class="auto-style3">Date Of Birth</td>
                                    <td style="width: 20px"><span style="color: red">*</span></td>
                                    <td>
                                        <input type="text" id="txtdd" name="txtdd" required="required" maxlength="2" style="width: 25px" placeholder="DD" runat="server" onkeypress="return isNumber(event)" />
                                        <input type="text" id="txtmm" name="txtmm" required="required" maxlength="2" style="width: 25px" placeholder="MM" runat="server" onkeypress="return isNumber(event)" />
                                        <input type="text" id="txtyyyy" name="txtyyyy" required="required" maxlength="4" style="width: 40px" placeholder="YYYY" runat="server" onkeypress="return isNumber(event)" />

                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="center" style="height: 30PX; width: 30%; color: cadetblue">Qualification</td>
                                    <td class="auto-style1"><span style="color: red">*</span></td>
                                    <td style="height: 30PX; width: 40%">
                                        <select id="ddlqly" name="ddlqlyname" class="select" runat="server" style="width:200px">
                                            <option value="S">Select</option>
                                            <option value="10">10th Class</option>
                                            <option value="I">Inter</option>
                                            <option value="G">Graduate</option>
                                            <option value="PG">Post Graduate</option>
                                        </select><span style="color: red"><div id="name_error"></div>
                                        </span>
                                    </td>
                                    <td align="right" valign="center" style="color: cadetblue" class="auto-style3">Designation</td>
                                    <td style="width: 20px"><span style="color: red">*</span></td>
                                    <td style="height: 30PX; width: 40%">
                                        <select id="ddldesignationname" name="ddldesignationname1" class="select" runat="server" style="width:200px">
                                            <%-- <option value="S">Select</option>--%>
                                            <option value="T" selected="selected">Teacher</option>
                                            <%-- <option value="PT">Physics Teacher</option>
                                            <option value="MT">Maths Teacher</option>
                                            <option value="TCT">Tenth Class Teacher</option>--%>
                                        </select>
                                        <div id="designation_error"></div>

                                    </td>
                                    <%--<td width="57%">
                                            <asp:DropDownList ID="ddlqualication" runat="server">
                                                <asp:ListItem Text="Select" Value="SELECT"></asp:ListItem>
                                                <asp:ListItem Text="10th Class" Value="S"></asp:ListItem>
                                                <asp:ListItem Text="Inter" Value="M"></asp:ListItem>
                                                <asp:ListItem Text="Graduate" Value="M"></asp:ListItem>
                                                <asp:ListItem Text="Post Graduate" Value="M"></asp:ListItem>
                                            </asp:DropDownList></td>--%>
                                </tr>
                                <tr>
                                    <td align="right" valign="center" style="height: 30PX; width: 30%; color: cadetblue">Address</td>
                                    <td class="auto-style1"><span style="color: red">*</span></td>

                                    <td style="height: 30PX; width: 40%">
                                        <textarea maxlength="1000" name="txtaddress" required="required" id="txtaddress" runat="server" class="auto-style2"></textarea></td>
                                    <td align="right" valign="middle" style="color: cadetblue" class="auto-style3">Contact No.</td>
                                    <td style="width: 20px"><span style="color: red">*</span></td>

                                    <td style="height: 30PX; width: 40%">
                                        <input type="text" name="txtcontactno" required="required" id="txtcontactno" maxlength="10" placeholder="Enter Contact NO." onkeypress="return isNumber(event)" runat="server" class="form-control text1" style="width: 89%" /></td>
                                </tr>
                                <tr>
                                    <td align="right" valign="center" style="height: 30PX; width: 30%; color: cadetblue">Emergency Contact No.</td>
                                    <td class="auto-style1"><span style="color: red">*</span></td>

                                    <td style="height: 30PX; width: 40%">
                                        <input type="text" name="txtemergencycontactno" maxlength="10" required="required" id="txtemergencycontactno" placeholder="Enter Emergency No." onkeypress="return isNumber(event)" runat="server" class="form-control text1" style="width: 71%" /></td>
                                    <%--<td align="right" valign="center" style="color: cadetblue" class="auto-style3">Email</td>--%>
                                    <%--  <td style="width:20px"><span style="color: red">*</span></td>--%>
                                    <%-- <td style="height: 30PX; width: 40%">
                                        <input type="email" name="txtemail" runat="server" required="required" style="width:183px" id="txtemail" placeholder="Enter Email" onkeyup="email_validate(this.value);" class="form-control" />
                                        <span style="color: red">
                                            <div id="status"></div>
                                        </span></td>--%>
                                    <td align="right" valign="center" style="height: 30PX; width: 30%; color: cadetblue">&nbsp;Aadhar No.</td>
                                    <td class="auto-style1"><span style="color: red">*</span></td>
                                    <td valign="center" style="height: 30PX; width: 40%">
                                        <input type="text" id="txtidaadhar1" name="txtaadhar1" required="required" maxlength="4" style="width: 40px" runat="server" onkeypress="return isNumber(event)" />
                                        <input type="text" id="txtidaadhar2" name="txtaadhar2" required="required" maxlength="4" style="width: 40px" runat="server" onkeypress="return isNumber(event)" />
                                        <input type="text" id="txtidaadhar3" name="txtaadhar3" required="required" maxlength="4" style="width: 40px" runat="server" onkeypress="return isNumber(event)" onblur="validateVerhoeff()" />
                                    </td>
                                </tr>
                                <tr>

                                    <td align="right" valign="center" style="color: cadetblue" class="auto-style3">Student Photo 
                                    </td>
                                    <td style="width: 20px"><span style="color: red">*</span></td>
                                    <td style="height: 30PX; width: 40%">
                                        <asp:FileUpload runat="server" ID="imageupload" Width="200px" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                        <br />

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" align="center">
                                        <table>
                                            <tr>
                                             <td align="center">
                                                    <input type="submit" id="btnsubmit" name="Save" class="btn btn-success" onserverclick="btnsubmit_Click" value="SAVE" runat="server" onclick="return ValidateForm()" />
                                                   
                                              
                                                    <input type="submit" id="btnclear" name="btnclear" runat="server" class="btn btn-success" value="CLEAR" onserverclick="btnclear_Click" />
                                              
                                                    <a href="#" class="btn btn-success btn-lg" runat="server" id="btnprint" value="PRINT" onserverclick="btnprint_Click" visible="false" style="width: 80px">
                                                        <span class="glyphicon glyphicon-print"></span>Print
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="auto-style1"></td>
                                </tr>

                            </table>
                            <%-- </fieldset>--%>
                        </td>
                    </tr>
                </table>
                <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>
            </div>
        </form>
    </body>
    </html>
</asp:Content>

