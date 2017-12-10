<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmpRegFormPrint.aspx.cs" Inherits="EmpRegFormPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 322px;
        }

        #imgPhoto {
            height: 105px;
            width: 115px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="700" style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid; font-size: 10pt; font-family: Verdana;"
                align="center" id="tblphoto" runat="server">
                <tr align="center">
                    <td colspan="2" style="height: 21px">
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" style="height: 21px">
                        <strong style="font-size: 16pt">KALIDINDI E.M HIGH SCHOOL
                            <br />
                            EMPLOYEE REGISTRATION FORM</strong></td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 21px; text-align: center;">
                        <asp:Image runat="server" ID="imglogo" ImageUrl="~/images/school logo.jpg" Width="100px" Height="100px" />
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" style="height: 21px; text-align: center;">
                        <b>
                            <asp:Label ID="lbltitle2" runat="server" Text="EMPLOYEE DETAILS" Font-Size="12pt"></asp:Label></b><br />
                        <br />
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <table style="width: 500px; height: 147px">
                            <%-- <tr>
                                <td align="left" style="height: 25px">Admission Number</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblAdmissionno" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>--%>
                            <tr>
                                <td align="left" style="height: 25px">User Name</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblUsername" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                              <tr>
                                <td align="left" style="height: 25px">Emp Online Id</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblempid" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">Name</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblname" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">DOB</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblDob" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">Gender</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblGender" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">Qualification</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblQualification" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">Designation</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblDesignation" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">S/o,W/o,D/o Name</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblSO" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <%-- <tr>
                                <td align="left" style="height: 25px">Brother/Sister Name</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblBrosisname" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>--%>                           <%-- <tr>
                                <td align="left" style="height: 25px">Caste</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblCaste" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>--%>                           <%-- <tr>
                                <td align="left" style="height: 25px">Occupation Of Parents</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblOccupation" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>--%>
                            <tr>
                                <td align="left" style="height: 25px">Address</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblAddress" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">Contact No.</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblContactNo" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">&nbsp;Aadhar No.</td>
                                <td>&nbsp;</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblAadharno" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <%-- <tr>
                                <td align="left" style="height:25px">&nbsp;</td>
                                <td>:</td>
                                <td style="text-align: left">&nbsp;</td>

                            </tr>--%>
                            <tr>
                                <td align="left" style="height: 25px">Student Photo </td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <img id="imgPhoto" runat="server" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="CENTER" colspan="2">
                        <br />
                        <asp:Label runat="server" Text="DECLARATION" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label><br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I Promise to abide by the rules and regulation laid down by the management 
                        <br />
                        from time to time and be resposible for the regular attendance and descipline of my son/daughter/ward
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: auto; text-align: left; font-weight: bold;">Signature of the Principal</td>
                    <td align="right" style="text-align: right; font-weight: bold;" class="auto-style1">
                        <br />
                        Signature of Employee<br />
                        <br />
                    </td>

                </tr>
                <tr>
                    <td align="left" style="text-align: left;" colspan="2">Date Of Registration:
                    <br />
                        <br />
                        <asp:Label ID="lblfirstname" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lbllastname" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" style="height: 21px">
                        <br />


                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
