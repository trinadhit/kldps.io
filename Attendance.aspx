<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8" />
        <title>Attendance</title>

        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <link href="css/buttoncss.css" rel="stylesheet" type="text/css" />

        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
        <style type="text/css">
            .div {
                border-radius: 10px;
                border: 2px solid #ccc;
                background-color: #f8f8f8;
                padding: 20px;
            }

            .auto-style2 {
                height: 20px;
            }
        </style>
        <script type="text/javascript">
            function dropdownvalidation() {
                var ddlqly = document.getElementById("<%=ddlstandard.ClientID %>");
                if (ddlqly.value == "S") {
                    alert("Please Select Student Class");
                    //If the "Please Select" option is selected display error.
                    // alert("Please select an option!");
                    //document.getElementById("name_error").innerHTML = "Please Select Qualification";
                    return false;
                }
                else {
                    //document.getElementById("name_error").innerHTML = "";
                    return true;
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


            function Check_Click(objRef) {
                //Get the Row based on checkbox
                var row = objRef.parentNode.parentNode;
                if (objRef.checked) {
                    //If checked change color to Aqua
                    row.style.backgroundColor = "aqua";
                }
                else {
                    //If not checked change back to original color
                    if (row.rowIndex % 2 == 0) {
                        //Alternating Row Color
                        row.style.backgroundColor = "#BFE4FF";
                    }
                    else {
                        row.style.backgroundColor = "white";
                    }
                }
                //Get the reference of GridView
                var GridView = row.parentNode;
                //Get all input elements in Gridview
                var inputList = GridView.getElementsByTagName("input");
                for (var i = 0; i < inputList.length; i++) {
                    //The First element is the Header Checkbox
                    var headerCheckBox = inputList[0];
                    //Based on all or none checkboxes
                    //are checked check/uncheck Header Checkbox
                    var checked = true;
                    if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                        if (!inputList[i].checked) {
                            checked = false;
                            break;
                        }
                    }
                }
                headerCheckBox.checked = checked;
            }

            function checkAll(objRef) {

                var GridView = objRef.parentNode.parentNode.parentNode;
                var inputList = GridView.getElementsByTagName("input");
                for (var i = 0; i < inputList.length; i++) {
                    //Get the Cell To find out ColumnIndex
                    var row = inputList[i].parentNode.parentNode;
                    if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                        if (objRef.checked) {
                            //If the header checkbox is checked
                            //check all checkboxes
                            //and highlight all rows
                            // row.style.backgroundColor = "aqua";
                            inputList[i].checked = true;
                        }
                        else {
                            //                //If the header checkbox is checked
                            //                //uncheck all checkboxes
                            //                //and change rowcolor back to original
                            //                if(row.rowIndex % 2 == 0)
                            //                {
                            //                   //Alternating Row Color
                            //                   row.style.backgroundColor = "#C2D69B";
                            //                }
                            //                else
                            //                {
                            //                   row.style.backgroundColor = "white";
                            //                }
                            inputList[i].checked = false;
                        }
                    }
                }
            }



            function selectGridChkAll(chkAll) {
                var gvEncl = chkAll.parentElement.parentElement.parentElement.parentElement
                if (gvEncl != null) {
                    if (chkAll.checked == true) {
                        for (i = 0; i < gvEncl.rows.length; i++) {
                            if (gvEncl.rows[i].cells[0].children[0] != null) {
                                gvEncl.rows[i].cells[0].children[0].checked = true;
                            }
                        }
                    }
                    else {
                        for (i = 0; i < gvEncl.rows.length; i++) {
                            if (gvEncl.rows[i].cells[0].children[0] != null) {
                                gvEncl.rows[i].cells[0].children[0].checked = false;
                            }
                        }
                    }
                }
            }
        </script>
    </head>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <img style="width: 250px; height: 50px" src="images/loading.gif" alt="loading" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <%--  <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>--%>
    <%--<Triggers>
            <asp:PostBackTrigger ControlID="ibtnExprtExcel" />
        </Triggers>--%>
    <div style="width: 100%; text-align: center">
        <div style="width: 100%; text-align: center">
            <table style="width: 100%; text-align: center">
                <%--<tbody>--%>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblMsg" runat="server"></asp:Label></td>
                </tr>
                <%--  <tr>
                        <td style="height: 16px">
                            <asp:Label ID="lblMsg1" runat="server"></asp:Label></td>
                    </tr>--%>
                <%-- </tbody>--%>
            </table>
            <br />
            <div style="width: 100%; text-align: center">
                <table style="width: 100%; text-align: center">
                    <tbody>
                        <%-- <tr>
                            <td>
                                <asp:Label ID="lblHeading" runat="server" Width="100%" Font-Bold="True" Font-Size="Medium"
                                    ForeColor="#000040" Text="SEND STUDENT ABSENT MESSAGES TO PARENTS"></asp:Label></td>
                        </tr>--%>
                        <tr>
                            <td align="center">
                                <asp:Label ID="lblstudentattendance" CssClass="lblschoolname" Text="STUDENT ATTENDANCE" runat="server"></asp:Label>
                                <br />
                                <br />
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div>
            <table style="width: 100%;">

                <tr>
                    <td align="right" valign="middle" style="height: 30PX; width: 41%; color: cadetblue">
                        <%-- <td style="width: 200px; height=30px; color:cadetblue"  valign="center" align="right">--%>
                        <strong>Select Student CLass <span class="errormsg">*</span></strong>
                    </td>
                    <td style="width: 200px; text-align: left; height: 2px">
                        <select id="ddlstandard" name="ddlstandard" runat="server" class="select" style="width: 150px;">
                            <option value="S">Select</option>
                            <option value="L">LKG </option>
                            <option value="U">UKG </option>
                            <option value="1">1 CLass </option>
                            <option value="2">2 Class </option>
                            <option value="3">3 Class </option>
                            <option value="4">4 Class </option>
                            <option value="5">5 Class </option>
                            <option value="6">6 Class </option>
                            <option value="7">7 Class </option>
                            <option value="8">8 Class </option>
                            <option value="9">9 Class </option>
                            <option value="10">10 Class </option>
                        </select>

                    </td>
                </tr>
                <%-- <tr>
                    <td align="right">From Date:</td>
                    <td align="left">
                        <input type="text" id="txtfdd" name="txtfdd" required="required" maxlength="2" style="width: 30px" placeholder="DD" runat="server" onkeypress="return isNumber(event)" class="text" />
                        <input type="text" id="txtfmm" name="txtfmm" required="required" maxlength="2" style="width: 30px" placeholder="MM" runat="server" onkeypress="return isNumber(event)" class="text" />
                        <input type="text" id="txtfyyyy" name="txtfyyyy" required="required" maxlength="4" style="width: 50px" placeholder="YYYY" runat="server" onkeypress="return isNumber(event)" class="text" /></td>
                    <td align="left" style="width: 55px">To Date:</td>
                    <td align="left">
                        <input type="text" id="txttdd" name="txttdd" required="required" maxlength="2" style="width: 30px" placeholder="DD" runat="server" onkeypress="return isNumber(event)" class="text" />
                        <input type="text" id="txttmm" name="txttmm" required="required" maxlength="2" style="width: 30px" placeholder="MM" runat="server" onkeypress="return isNumber(event)" class="text" />
                        <input type="text" id="txttyyyy" name="txttyyyy" required="required" maxlength="4" style="width: 50px" placeholder="YYYY" runat="server" onkeypress="return isNumber(event)" class="text" />
                    </td>
                </tr>--%>
                <tr>
                    <td colspan="4" align="center">
                        <table>
                            <tr>
                                <td colspan="4" align="center">
                                    <input type="submit" id="btngetdtls" name="btngetdtls" runat="server" value="Get Details" class="btn btn-success" style="width: 100px"
                                        onserverclick="btngetdtls_Click" onclick="return dropdownvalidation();" />
                                    <input type="submit" runat="server" value="Clear" class="btn btn-success" style="width: 60px" onserverclick="btnclear1_Click" />
                                   
                                </td>
                            </tr>
                        </table>
                         <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <table>
                            <tr runat="server" visible="false" id="trgvStudentattendance">
                                <td>
                                    <asp:GridView ID="gvStudentattendance" runat="server" CssClass="mt5 mb10" AutoGenerateColumns="False"
                                        CellPadding="4" HorizontalAlign="Center">
                                        <RowStyle CssClass="scroll_td" />
                                        <AlternatingRowStyle BackColor="#BFE4FF" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL.NO">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSlno" Text='<%# Container.DataItemIndex + 1 %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ADMISSION NO.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbladmissionno" Text='<%# Eval("ADMISSION_NO") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="NAME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblname" Text='<%# Eval("NAME") %>' runat="server"></asp:Label>
                                                    <asp:Label ID="lblonlineno" Text='<%# Eval("STUDENT_ONLINE_NO") %>' runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="lblusername" Text='<%# Eval("USER_NAME") %>' runat="server" Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FATHER NAME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblfathername" Text='<%# Eval("FATHER_NAME") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CLASS">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblclass" Text='<%# Eval("CLASS") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldob" Text='<%# Eval("DOB") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <%-- <asp:TemplateField HeaderText="DOB">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldob" Text='<%# Eval("DOB") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ADDRESS">
                                        <ItemTemplate>
                                            <asp:Label ID="lbladdress" Text='<%# Eval("ADDRESS") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>--%>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="checkAll" Text="Select All" runat="server" onclick="checkAll(this);" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chksingle" runat="server" onclick="Check_Click(this)" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="scroll_th" />
                                    </asp:GridView>
                                    <br />
                                  
                                </td>
                            </tr>

                        </table>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <%-- <tr>
                    <td></td>
                </tr>--%>
                <tr runat="server" visible="false" id="trSave">
                    <td colspan="4" align="center">
                        <table>
                            <tr>
                                <td align="center" colspan="3">
                                    <input type="submit" id="btnpresent" name="btnpresent" runat="server" value="Present" class="btn btn-success" style="width: 80px"
                                        onserverclick="btnpresent_Click" />
                                    <input type="submit" id="btnabsent" name="btnabsent" runat="server" value="Absent" class="btn btn-success" style="width: 80px"
                                        onserverclick="btnabsent_Click" />
                                    <input type="submit" id="btnclear" name="" runat="server" value="Clear" class="btn btn-success" style="width: 60px" onserverclick="btnclear_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>
    </div>
    </html>
</asp:Content>

