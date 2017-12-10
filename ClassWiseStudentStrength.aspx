<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="ClassWiseStudentStrength.aspx.cs" 
    Inherits="ClassWiseStudentStrength" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div align="center">
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
    </div>
    <div align="center">
        <asp:Label ID="lblform" CssClass="lblsformname" runat="server"><strong>S</strong>tudents <strong>S</strong>trength </asp:Label>
        <br />
        <br />
    </div>
    <div>
        <div style="height: 35px" align="right" colspan="4" runat="server" visible="false" id="dvexcel">
            <asp:ImageButton ID="ibtnExportToExcel" OnClick="ibtnExportToExcel_Click" runat="server"
                Width="32px" ImageUrl="~/images/Excel-48.gif" ></asp:ImageButton><asp:ImageButton
                    ID="ibtnPrint" runat="server" Width="29px" ImageUrl="~/images/Print.gif" OnClientClick="javascript:CallPrint('divprint')"
                    ></asp:ImageButton>
            &nbsp;
        </div>
    </div>
    <div id="dvStrength" runat="server" visible="false">
        <asp:GridView runat="server" ID="gvStudentstrength" AutoGenerateColumns="false" CssClass="mt5 mb10" HeaderStyle-Font-Bold="true"
            HeaderStyle-BackColor="#ffffcc"
            CellPadding="4" HorizontalAlign="Center" HeaderStyle-Height="30px" FooterStyle-Height="30px" Width="30%"
            OnRowCommand="gvStudentstrength_RowCommand">
            <RowStyle CssClass="scroll_td" />
            <AlternatingRowStyle BackColor="#BFE4FF" />
            <Columns>
                <asp:TemplateField HeaderText="SL_NO">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblslno" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CLASS">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtn" runat="server" CommandArgument='<%#Eval("COUNT") %>' Text='<%# Eval("CLASS") %>'></asp:LinkButton>

                        <asp:Label runat="server" ID="lblstandard" Text='<%# Eval("STANDARD") %>' Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="STRENGTH">
                    <ItemTemplate>


                        <asp:Label runat="server" ID="lblclass" Text='<%# Eval("COUNT") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />

    </div>
    <div runat="server" id="divstd" visible="false">
        <asp:GridView ID="gvAttendanceRpt" runat="server" CssClass="mt5 mb10" AutoGenerateColumns="False"
            CellPadding="4" HorizontalAlign="Center" Width="80%">
            <RowStyle CssClass="scroll_td" />
            <AlternatingRowStyle BackColor="#BFE4FF" />
            <Columns>
                <asp:TemplateField HeaderText="SL.NO">
                    <ItemTemplate>
                        <asp:Label ID="lblSlno" Text='<%# Container.DataItemIndex + 1 %>' runat="server"></asp:Label>
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
                <asp:TemplateField HeaderText="STUDENT_ONLINE_NO">
                    <ItemTemplate>
                        <asp:Label ID="lblonlineno" Text='<%# Eval("STUDENT_ONLINE_NO") %>' runat="server"></asp:Label>
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
                <asp:TemplateField HeaderText="FATHER_CONTACT_NO">
                    <ItemTemplate>

                        <asp:Label ID="lblmobileno" Text='<%# Eval("FATHER_CONTACT_NO") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>

            </Columns>
            <HeaderStyle CssClass="scroll_th" />
        </asp:GridView>
        <br />
        <br />
    </div>
    
    <div align="center" runat="server" id="dvBack">
        <input type="submit" id="btnBack" name="btnBack" runat="server" value="Back" class="btn btn-success" style="width: 120px"
            onserverclick="btnBack_Click" />
       
    </div>
</asp:Content>

