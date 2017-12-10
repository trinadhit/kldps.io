<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="FeeEODReport.aspx.cs" Inherits="FeeEODReport" EnableEventValidation="false" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Eod Fee Report</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <link href="css/buttoncss.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" language="javascript">
            function isNumber(evt) {
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
                    return false;
                }
                return true;
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
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </div>
        <div align="center">
            <asp:Label ID="lblform" CssClass="lblsformname" runat="server"><strong>C</strong>ollected <strong>F</strong>ees <strong>R</strong>eport </asp:Label>
        </div>
        <div align="center" style="width: 100%">
            <form>
                <%--runat="server" id="fromeod" method="post"--%>
                <%--  <div style="height: 30px">
                    Select Class
                   
                    <asp:DropDownList ID="idddlclass" runat="server" class="select" AutoPostBack="True" OnSelectedIndexChanged="idddlclass_SelectedIndexChanged">
                        <asp:ListItem Text="Select" Value="S"></asp:ListItem>
                        <asp:ListItem Text="LKG" Value="L"></asp:ListItem>
                        <asp:ListItem Text="UKG" Value="U"></asp:ListItem>
                        <asp:ListItem Text="1st Class" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2nd Class" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3rd Class" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4th Class" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5th Class" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6th Class" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7th Class" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8th Class" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9th Class" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10th Class" Value="10"></asp:ListItem>
                    </asp:DropDownList>
                    Select Student OL No.
                    <asp:DropDownList ID="ddlolno" runat="server" class="select">
                    </asp:DropDownList>
                    <br />
                    <br />
                </div>--%>
                <%-- <table style="width: 80%">
                    <tr>
                        <td>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 100%" colspan="4"><span style="font-weight: bold">Enter From Date: </span><span class="errormsg">*</span>
                                        <input type="text" id="txtfdd" name="txtfdd" required="required" maxlength="2" placeholder="DD" runat="server" style="width: 50px" onkeypress="return isNumber(event)" class="form-control" />
                                        <input type="text" id="txtfmm" name="txtfmm" required="required" maxlength="2" placeholder="MM" runat="server" style="width: 50px" onkeypress="return isNumber(event)" class="form-control" />
                                        <input type="text" id="txtfyyyy" name="txtfyyyy" required="required" maxlength="4" placeholder="YYYY" runat="server" style="width: 60px" onkeypress="return isNumber(event)" class="form-control" /></td>
                                </tr>
                                <tr>
                                    <td><span style="font-weight: bold">Enter To Date: </span><span class="errormsg">*</span>
                                        <input type="text" id="txttdd" name="txttdd" required="required" maxlength="2" style="width: 50px" placeholder="DD" runat="server" onkeypress="return isNumber(event)" class="form-control" />
                                        <input type="text" id="txttmm" name="txttmm" required="required" maxlength="2" style="width: 50px" placeholder="MM" runat="server" onkeypress="return isNumber(event)" class="form-control" />
                                        <input type="text" id="txttyyyy" name="txttyyyy" required="required" maxlength="4" style="width: 60px" placeholder="YYYY" runat="server" onkeypress="return isNumber(event)" class="form-control" /></td>
                                </tr>
                            </table>
                        </td>

                    </tr>
                </table>--%>
                <div>
                    <span style="font-weight: bold">Enter From Date: </span><span class="errormsg">*</span>
                    <input type="text" id="txtfdd" name="txtfdd" required="required" maxlength="2" placeholder="DD" runat="server" style="width: 35px" onkeypress="return isNumber(event)" class="text" />
                    <input type="text" id="txtfmm" name="txtfmm" required="required" maxlength="2" placeholder="MM" runat="server" style="width: 35px" onkeypress="return isNumber(event)" class="text" />
                    <input type="text" id="txtfyyyy" name="txtfyyyy" required="required" maxlength="4" placeholder="YYYY" runat="server" style="width: 50px" onkeypress="return isNumber(event)" class="text" />
                    <span style="font-weight: bold">Enter To Date: </span><span class="errormsg">*</span>
                    <input type="text" id="txttdd" name="txttdd" required="required" maxlength="2" style="width: 35px" placeholder="DD" runat="server" onkeypress="return isNumber(event)" class="text" />
                    <input type="text" id="txttmm" name="txttmm" required="required" maxlength="2" style="width: 35px" placeholder="MM" runat="server" onkeypress="return isNumber(event)" class="text" />
                    <input type="text" id="txttyyyy" name="txttyyyy" required="required" maxlength="4" style="width: 50px" placeholder="YYYY" runat="server" onkeypress="return isNumber(event)" class="text" />
                    <br />
                    <br />
                </div>
                <div align="center">
                    <input type="submit" id="BtnGetDtls" name="BtnGetDtls" runat="server" value="Get Details" class="btn btn-success" style="width: 120px"
                        onserverclick="BtnGetDtls_Click" />
                    <input type="button" id="btnclear" name="btnclear" value="Clear" runat="server" class="btn btn-success" onserverclick="btnclear_Click" />
                </div>
                <br />
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
                    <div id="diveod" runat="server" visible="false">
                        <asp:GridView runat="server" ID="gvStudentstrength" AutoGenerateColumns="false" CssClass="mt5 mb10" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#ffffcc"
                            CellPadding="4" HorizontalAlign="Center" OnRowCommand="gvStudentstrength_RowCommand" OnRowDataBound="gvStudentstrength_RowDataBound" HeaderStyle-Height="30px" FooterStyle-Height="30px" Width="90%">
                            <RowStyle CssClass="scroll_td" />
                            <AlternatingRowStyle BackColor="#BFE4FF" />
                            <Columns>
                                <asp:TemplateField HeaderText="SL_NO">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblslno" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                        <%--<asp:Label runat="server" ID="lblusername" Visible="false" Text='<%# Eval("user_name") %>'></asp:Label>
                                    <asp:Label runat="server" ID="lblempid" Visible="false" Text='<%# Eval("EMP_ID") %>'></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ONLINE_NO">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblonlineno" Text='<%# Eval("STUDENT_ONLINE_NO") %>'></asp:Label>
                                        <asp:Label runat="server" ID="lblfeereceiptno" Text='<%# Eval("RECEIPT_NO") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NAME">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblname" Text='<%# Eval("NAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FATHER_NAME">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblfathername" Text='<%# Eval("FATHER_NAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CLASS">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblclass" Text='<%# Eval("CLASS") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:TemplateField HeaderText="ANNUAL_FEE">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblannualfee" Text='<%# Eval("ANNUAL_FEE") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="COLLECTED_FEE">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblcollectedfee" Text='<%# Eval("COLLECTED_FEE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="COLLECTED_DATE">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblcollecteddt" Text='<%# Eval("CRTDDT") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--  <asp:TemplateField HeaderText="REPRINT">
                                <ItemTemplate>
                                    <asp:Image runat="server" ImageUrl="~/images/print.jpg" ID="imgreprint"/>
                                </ItemTemplate>
                            </asp:TemplateField>--%>

                                <asp:TemplateField HeaderText="REPRINT">
                                    <ItemTemplate>
                                        <%--<asp:Button runat="server" Width="70px" CommandName="REPRINT" />--%>
                                        <asp:Button runat="server" Width="95px" Height="35px" CssClass="buttonprint" ID="btnprint" CommandName="REPRINT" BackColor="White" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <br />
                    </div>
                </div>
            </form>
        </div>
    </body>
    </html>
</asp:Content>
