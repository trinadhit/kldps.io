<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PricipalEmpapprove.aspx.cs" Inherits="PricipalEmpapprove" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/loginstyle2.css" />
    <link rel="stylesheet" href="css/loginstyle2.css" />
    <script src="js/index.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
    <script type="text/javascript" src="js/CFSTCommon.js"></script>
    <link href="css/buttoncss.css" rel="stylesheet" />
    <script src="js/index.js"></script>
    <script type="text/javascript" src="js/CFSTCommon.js"></script>
    <style type="text/css">
        
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
                <tr>
                    <td style="text-align: center">
                        <asp:Label runat="server" ID="lblmsg"></asp:Label>
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
                        <asp:Image runat="server" ID="imglogo" ImageUrl="~/images/school logo.jpg" Width="90px" Height="75px" />
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" style="height: 21px; text-align: center;">
                        <b>
                            <asp:Label ID="lbltitle2" runat="server" Text="EMPLOYEE DETAILS" Font-Size="12pt"></asp:Label></b><br />
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
                                <td align="left" style="height: 25px">Employee Id</td>
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
                    <td align="left" style="text-align: left;" colspan="2">
                        <br />
                        <asp:Label ID="lblfirstname" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lbllastname" runat="server" Visible="false"></asp:Label>
                          <asp:Label ID="lblstudentoremp" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" style="height: 21px">
                        <br />
                    </td>
                </tr>
               <%-- <tr>
                    <td align="center">
                        <table align="center">
                            <tr>
                                <td colspan="8" align="center">
                                    <input type="submit" runat="server" id="btnApprove" value="Approve" onserverclick="btnApprove_Click" />
                                    <input id="btnClose" type="button" value="Close" onclick="javascript: self.close(); return false;" class="btn" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>--%>
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
