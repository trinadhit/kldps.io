<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="PrincipalApproval.aspx.cs" Inherits="PrincipalApproval" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8" />
        <title>Principa lAppoval</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <link href="css/buttoncss.css" rel="stylesheet" type="text/css" />
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
        <script type="text/javascript">
        </script>
    </head>
    <body>

        <form method="post" action="EmpRegForm.aspx" id="myForm">
            <table align="center" id="tblapproval" runat="server">
                <tr>
                    <td colspan="3">
                        <table align="center">
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Label ID="lblmsg" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="text-align: right; font-weight: bold">Employee/Student <span style="color: red">*</span></td>
                    <td>
                        <select id="ddlstudentemp" name="ddlstudentemp" class="select" style="width: 150px" runat="server">
                            <option value="S">Select</option>
                            <option value="STD">STUDENT</option>
                            <option value="E">EMPLOYEE</option>
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
                                    <input type="submit" id="btnsubmit" name="Save" value="GET DETAILS" runat="server" onserverclick="btnsubmit_Click" class="btn btn-success" style="width: 120px" onclick="return ValidateForm()" />
                               <%-- </td>
                                <td style="width:200px">--%>
                                    <input type="button" id="btnclear" name="btnclear" value="CLEAR" class="btn btn-success" style="width: 100px" runat="server" onserverclick="btnclear_Click" />
                                </td>

                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table>
                            <tr runat="server" visible="false" id="trgvApproval">
                                <td>
                                    <asp:GridView runat="server" ID="gvApproval" AutoGenerateColumns="false" HeaderStyle-BackColor="#66ccff" HeaderStyle-Height="30px" AllowPaging="True"
                                        OnPageIndexChanging="gvApproval_PageIndexChanging" OnRowCommand="gvApproval_RowCommand" OnRowDataBound="gvApproval_RowDataBound"
                                        OnRowDeleted="gvApproval_RowDeleted" OnRowEditing="gvApproval_RowEditing" OnRowUpdated="gvApproval_RowUpdated"
                                        HeaderStyle-HorizontalAlign="Center" CellPadding="1" CellSpacing="1" HorizontalAlign="Center" OnRowDeleting="gvApproval_RowDeleting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL_NO">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblslno" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblusername" Visible="false" Text='<%# Eval("user_name") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="lbladmissionno" Visible="false" Text='<%# Eval("ADMISSION_NO") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblstudentonlineno" Visible="false" Text='<%# Eval("STUDENT_ONLINE_NO") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="NAME">
                                                <ItemTemplate>

                                                    <asp:Label runat="server" ID="lblname" Text='<%# Eval("NAME") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FATHER NAME">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblfathername" Text='<%# Eval("FATHER_NAME") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GENDER">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblGENDER" Text='<%# Eval("GENDER") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DOB">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblDOB" Text='<%# Eval("DOB") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CLASS">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblCLASS" Text='<%# Eval("CLASS") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ENTRY DATE">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblENTRY_DATE" Text='<%# Eval("ENTRY_DATE") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                            <%--<asp:BoundField HeaderText="NAME" DataField="NAME" />
                                                <asp:BoundField HeaderText="FATHER NAME" DataField="FATHER_NAME" />
                                                <asp:BoundField HeaderText="GENDER" DataField="GENDER" />
                                                <asp:BoundField HeaderText="DOB" DataField="DOB" />
                                                <asp:BoundField HeaderText="CLASS" DataField="CLASS" />
                                                <asp:BoundField HeaderText="ENTRY DATE" DataField="ENTRY_DATE" />--%>
                                            <%--  <asp:TemplateField HeaderText="STUDENT_PHOTO">
                                                    <ItemTemplate>
                                                     
                                                       <table runat="server" id="tblphoto">
                                                           <tr>
                                                               <td>
                                                                  <img id="imgPhoto" runat="server" />
                                                               </td>
                                                           </tr>
                                                       </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="VIEW">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" Width="50px" CssClass="buttonview" CommandName="VIEW" ID="btnview" />
                                                    <%--<asp:ImageButton runat="server" ImageUrl="~/images/delete round.png"  />--%>
                                                    <%-- <input type="button" runat="server" value="View" style="background-image:url('~/images/deletejpg.jpg')" />--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="EDIT">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Width="70px" CssClass="buttonedit" CommandName="EDIT" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="REJECT">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" Width="70px" CssClass="buttondelete" CommandName="REJECT" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="APPROVE">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" Width="70px" CssClass="buttonapprove" CommandName="APPROVE" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr runat="server" visible="false" id="trgvemp">
                                <td>
                                    <asp:GridView runat="server" ID="gvEmp" AutoGenerateColumns="false" HeaderStyle-BackColor="#66ccff" HeaderStyle-Height="30px" AllowPaging="True"
                                        HeaderStyle-HorizontalAlign="Center" CellPadding="1" CellSpacing="1" HorizontalAlign="Center" OnPageIndexChanging="gvEmp_PageIndexChanging" OnRowCommand="gvEmp_RowCommand" OnRowDataBound="gvEmp_RowDataBound" OnRowDeleting="gvEmp_RowDeleting" OnRowUpdating="gvEmp_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL_NO">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblslno" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblusername" Visible="false" Text='<%# Eval("user_name") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblempid" Visible="false" Text='<%# Eval("EMP_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="NAME">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblname" Text='<%# Eval("NAME") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FATHER NAME">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblfathername" Text='<%# Eval("FATHER_NAME") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GENDER">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblGENDER" Text='<%# Eval("GENDER") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DOB">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblDOB" Text='<%# Eval("DOB") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="QUALIFICATION">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblQUALIFICATION" Text='<%# Eval("QUALIFICATION") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DESIGNATION">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblDESIGNATION" Text='<%# Eval("DESIGNATION") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="VIEW">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" Width="50px" CssClass="buttonview" CommandName="VIEW" ID="btnview" />
                                                    <%--<asp:ImageButton runat="server" ImageUrl="~/images/delete round.png"  />--%>
                                                    <%-- <input type="button" runat="server" value="View" style="background-image:url('~/images/deletejpg.jpg')" />--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="REJECT">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" Width="70px" CssClass="buttondelete" CommandName="REJECT" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="APPROVE">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" Width="70px" CssClass="buttonapprove" CommandName="APPROVE" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </form>

    </body>
    </html>
</asp:Content>

