<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="StudentAttendanceReport.aspx.cs"
    Inherits="StudentAttendanceReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="UTF-8" />
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <link href="css/buttoncss.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            function ValidateForm() {
                var ddlstandard = document.getElementById("<%=ddlstandard.ClientID %>");
                var ddlattendance = document.getElementById("<%=ddlattendance.ClientID %>");
                if (ddlstandard.value == "S") {
                    //alert("Select Class"); //<-- here was Alert()
                    document.getElementById("errormsg").innerHTML = "Please Select Student Class";
                    //document.getElementById("errormsg").
                    return false;
                }
                else {
                    document.getElementById("errormsg").innerHTML = "";
                    return true;
                }
                if (ddlattendance.value == "S") {
                    //alert("Select Class"); //<-- here was Alert()
                    document.getElementById("errormsg1").innerHTML = "Please Select Attendance Type";
                    //document.getElementById("errormsg").
                    return false;
                }
                else {
                    document.getElementById("errormsg1").innerHTML = "";
                }
            }
        </script>
        <script type="text/javascript">
            function CallPrint(strid) {
                var prtContent = document.getElementById(strid);
                var WinPrint = window.open('', '', 'left=0,top=0,width=0,height=0,toolbar=0,scrollbars=1,status=0');
                var strOldOne = prtContent.innerHTML;
                WinPrint.document.write(prtContent.innerHTML);
                WinPrint.document.close();
                WinPrint.focus();
                WinPrint.print();
                WinPrint.close();
                prtContent.innerHTML = strOldOne;
            }
        </script>
    </head>
    <body>
        <div align="center">
            <asp:Label runat="server" ID="lblmsg"></asp:Label>
        </div>
        <div align="center">
            <p id="errormsg" class="errormsg"></p>
        </div>
        <div align="center">
            <p id="errormsg1" class="errormsg"></p>
        </div>
        <div align="center">
            <span style="font-weight: bold">Select Class</span> <span class="errormsg">*</span>
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

            <span style="font-weight: bold">Select Absent/Present </span><span class="errormsg">*</span>
            <select id="ddlattendance" name="ddlattendance" runat="server" class="select" style="width: 150px;">
                <option value="S">Select</option>
                <option value="P">Present </option>
                <option value="A">Absent </option>
                <option value="B">Both </option>

            </select>

        </div>
        <div align="center">
            <span style="font-weight: bold">Enter From Date: </span><span class="errormsg">*</span>
            <input type="text" id="txtfdd" name="txtfdd" required="required" maxlength="2" style="width: 20px" placeholder="DD" runat="server" onkeypress="return isNumber(event)" class="text" />
            <input type="text" id="txtfmm" name="txtfmm" required="required" maxlength="2" style="width: 20px" placeholder="MM" runat="server" onkeypress="return isNumber(event)" class="text" />
            <input type="text" id="txtfyyyy" name="txtfyyyy" required="required" maxlength="4" style="width: 40px" placeholder="YYYY" runat="server" onkeypress="return isNumber(event)" class="text" />

            <span style="font-weight: bold">Enter To Date: </span><span class="errormsg">*</span>
            <input type="text" id="txttdd" name="txttdd" required="required" maxlength="2" style="width: 20px" placeholder="DD" runat="server" onkeypress="return isNumber(event)" class="text" />
            <input type="text" id="txttmm" name="txttmm" required="required" maxlength="2" style="width: 20px" placeholder="MM" runat="server" onkeypress="return isNumber(event)" class="text" />
            <input type="text" id="txttyyyy" name="txttyyyy" required="required" maxlength="4" style="width: 40px" placeholder="YYYY" runat="server" onkeypress="return isNumber(event)" class="text" />
        </div>
        <div>
            <br />
        </div>
        <div align="center">
            <input type="submit" id="BtnGetDtls" name="BtnGetDtls" runat="server" value="Get Details" class="btn btn-success" style="width: 120px" onclick="return ValidateForm()"
                onserverclick="BtnGetDtls_Click" />
            <input type="button" id="btnclear" name="btnclear" value="Clear" runat="server" class="btn btn-success" onserverclick="btnclear_Click" />
        </div>
        <div>
            <div style="height: 35px" align="right" colspan="4">
                <asp:ImageButton ID="ibtnExportToExcel" OnClick="ibtnExportToExcel_Click" runat="server"
                    Width="32px" ImageUrl="~/images/Excel-48.gif" Visible="False"></asp:ImageButton><asp:ImageButton
                        ID="ibtnPrint" runat="server" Width="29px" ImageUrl="~/images/Print.gif" OnClientClick="javascript:CallPrint('divprint')"
                        Visible="False"></asp:ImageButton>
                &nbsp;
            </div>
        </div>
        <div id="divprint">
            <div runat="server" id="divstd" visible="false">
                <asp:GridView ID="gvAttendanceRpt" runat="server" CssClass="mt5 mb10" AutoGenerateColumns="False"
                    CellPadding="4" HorizontalAlign="Center" Width="90%">
                    <RowStyle CssClass="scroll_td" />
                    <AlternatingRowStyle BackColor="#BFE4FF" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL.NO">
                            <ItemTemplate>
                                <asp:Label ID="lblSlno" Text='<%# Container.DataItemIndex + 1 %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ONLINE NO">
                            <ItemTemplate>
                                <asp:Label ID="lblonlineno" Text='<%# Eval("STUDENT_ONLINE_NO") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NAME">
                            <ItemTemplate>
                                <asp:Label ID="lblname" Text='<%# Eval("NAME") %>' runat="server"></asp:Label>
                                <asp:Label ID="lblonlineno" Text='<%# Eval("STUDENT_ONLINE_NO") %>' runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblusername" Text='<%# Eval("USER_NAME") %>' runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblmobileno" Text='<%# Eval("FATHER_CONTACT_NO") %>' runat="server" Visible="false"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="FATHER NAME">
                            <ItemTemplate>
                                <asp:Label ID="lblfathername" Text='<%# Eval("FATHER_NAME") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="GENDER">
                            <ItemTemplate>
                                <asp:Label ID="lblgender" Text='<%# Eval("GENDER") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <%--  <asp:TemplateField HeaderText="GENDER">
                        <ItemTemplate>
                            <asp:Label ID="lblgender" Text='<%# Eval("GENDER") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>--%>
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
                        <asp:TemplateField HeaderText="ATTENDANCE">
                            <ItemTemplate>
                                <asp:Label ID="lblattendance" Text='<%# Eval("ATTENDANCE") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Attendance Date">
                            <ItemTemplate>
                                <asp:Label ID="lblattencedt" Text='<%# Eval("ATTENDANCEDT") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FATHER NO">
                            <ItemTemplate>

                                <asp:Label ID="lblmobileno" Text='<%# Eval("FATHER_CONTACT_NO") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <%-- <asp:TemplateField HeaderText="IMAGE">
                        <ItemTemplate>
        <asp:Image runat="server" ID="image" Height="100px" Width="100px" ImageUrl='<%#"data:Image/jpeg;base64, "+Convert.ToBase64String((byte[]) Eval("STUDENT_IMAGE")) %>' />
         <img src='<%#Eval("STUDENT_IMAGE") %>' runat="server" id="image" style="height: 100px; width: 100px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>--%>
                    </Columns>
                    <HeaderStyle CssClass="scroll_th" />
                </asp:GridView>
            </div>
        </div>
    </body>
    </html>
</asp:Content>

