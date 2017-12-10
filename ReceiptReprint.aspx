<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="ReceiptReprint.aspx.cs" Inherits="ReceiptReprint_aspx" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #imgPhoto {
            height: 105px;
            width: 115px;
        }
    </style>
</head>
<body>
    <form id="form1">
        <div>
            <table width="700" style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid; font-size: 10pt; font-family: Verdana;"
                align="center" id="tblphoto" runat="server">
                <%--<tr align="center">
                    <td colspan="2" style="height: 21px">
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>--%>
                <tr align="center">
                    <td colspan="2" style="height: 21px">
                        <strong style="font-size: 14pt">KALIDINDI E.M HIGH SCHOOL
                            <br />
                            PAYMENT PAID RECEIPT
                        </strong></td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 21px; text-align: center;"></td>
                </tr>
                <%-- <tr align="center">
                    <td colspan="2" style="height: 21px; text-align: center;">
                        <b>
                            <asp:Label ID="lbltitle2" runat="server" Text="STUDENT DETAILS" Font-Size="12pt"></asp:Label></b><br />
                        <br />
                    </td>
                </tr>--%>
                <tr align="center">
                    <td colspan="2">
                        <table style="width: 500px; height: 147px">
                            <tr>
                                <td align="left" style="height: 25px">Admission Number</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblAdmissionno" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">Student Online No.</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblonlineno" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <%-- <tr>
                                <td align="left" style="height: 25px">User Name</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblUsername" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>--%>
                            <tr>
                                <td align="left" style="height: 25px">Name</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblname" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <%-- <tr>
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
                            </tr>--%>

                            <tr>
                                <td align="left" style="height: 25px">Father Name</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblFathername" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">Class</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblClass" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <%-- <tr>
                                <td align="left" style="height: 25px">Mother Name</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblMothername" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>--%>

                            <%-- <tr>
                                <td align="left" style="height: 25px">Contact No.</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblContactNo" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>--%>


                            <tr>
                                <td align="left" style="height: 25px">Annual Fee</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lbltotalamount" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">This Time Paid Fee</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblpaidamount" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="height: 25px">As Of Now Total
                                    <br />
                                    Paid Fee</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblasofnowtotalcollectedfee" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>


                            <tr>
                                <td align="left" style="height: 25px">Pending Fee</td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblremainingamount" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>

                            <%--<tr>
                                <td align="left" style="height: 25px">Student Photo </td>
                                <td>:</td>
                                <td style="text-align: left">
                                    <img id="imgPhoto" runat="server" /></td>
                            </tr>--%>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="text-align: left; height: 40px; font-weight: bold; vertical-align: bottom">Signature of the Principal</td>
                    <td align="right" style="text-align: right; font-weight: bold; height: 40px; vertical-align: bottom;">Fee Collector Signature.<br />

                    </td>

                </tr>
                <tr>
                    <td align="left" style="text-align: left;" colspan="2">Date Of Payment:
                    <asp:Label runat="server" ID="lblcollectedtd"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblfirstname" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lbllastname" runat="server" Visible="false" Font-Bold="true"></asp:Label>
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


