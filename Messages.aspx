<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="css/buttoncss.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
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
    <div align="center">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
    <div align="center">
        <select id="ddlstandard" name="ddlstandard" runat="server" class="select" style="width: 150px;">
            <option value="S">Select</option>
            <option value="A">All</option>
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


    </div>
    <br />
    <div align="center">
        <textarea id="txtmsg" runat="server" name="txtmsg" rows="6" cols="6" style="height: 200px; width: 500px"></textarea>
        <%--<textarea maxlength="1000" name="txtaddress" required="required" id="idtxtaddress" style="height: 50px; width: 200px" runat="server"></textarea>--%>
        <div>
            <br />
            <%--<input type="submit" runat="server" id="btnsendmsg" name="btnsendmsg" class="btn btn-success" value="Send Message" />--%>

            <input type="submit" id="btnsendmsg" name="btnsendmsg" runat="server" value="Send Message" class="btn btn-success" style="width: 150px"
                onserverclick="btnsendmsg_Click" onclick="return dropdownvalidation();" />
            <input type="submit" id="btnclear1" name="btnclear1" runat="server" value="Clear" class="btn btn-success" onserverclick="btnclear_Click" />
        </div>
    </div>
</asp:Content>

