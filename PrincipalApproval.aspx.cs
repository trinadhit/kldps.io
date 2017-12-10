using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
using System.IO;
using System.Data;

public partial class PrincipalApproval : System.Web.UI.Page
{
    EmployeeVOs objempvos = new EmployeeVOs();
    StudentVOs objstudent = new StudentVOs();
    StudentVOs.student student = new StudentVOs.student();
    string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["EMPUSER"] != null)
                {
                    objempvos = (EmployeeVOs)Session["EMPUSER"];
                    if (objempvos.ROLE_CODE == 1 || objempvos.ROLE_CODE == 4)
                    {

                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
                else
                {
                    Response.Redirect("EmpLogin.aspx");
                }
                //if (ddlstudentemp.Value.ToUpper() != "S")
                //{
                //    DataSet ds = new DataSet();
                //    string empstd = ddlstudentemp.Value;
                //    ViewState["empid"] = empstd;
                //    ds = objempvos.GetEmpstdDtls(empstd);
                //    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                //    {
                //        if (empstd.ToUpper() == "STD")
                //        {
                //            gvApproval.DataSource = ds;
                //            gvApproval.DataBind();
                //            trgvApproval.Visible = true;
                //            ViewState["DSGVSTUDENT"] = ds;

                //        }
                //        else
                //        {
                //            gvEmp.DataSource = ds;
                //            gvEmp.DataBind();
                //            trgvemp.Visible = true;
                //            ViewState["DSGVEMP"] = ds;
                //        }
                //    }
                //}
            }

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        // string output = "";
        lblmsg.Text = "";
        gvApproval.DataSource = null;
        gvApproval.DataBind();
        gvEmp.DataSource = null;
        gvEmp.DataBind();
        DataSet ds = new DataSet();
        int valid = 0;

        try
        {
            // string empstd = ddlstudentemp.SelectedValue;
            // string empstd = Request.Form["ddlstudentemp"];
            //  string empstd = Request["ddlstudentemp"];
            if (ddlstudentemp.Value.ToUpper() == "S")
            {
                lblmsg.Text = "Please Select Student/Employee";
                lblmsg.CssClass = "errormsg";
                valid = 1;
            }
            if (valid == 0)
            {
                string emporstd = ddlstudentemp.Value;
                ViewState["EMPorSTD"] = emporstd;
                ds = objempvos.GetEmpstdDtls(emporstd);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    if (emporstd.ToUpper() == "STD")
                    {
                        gvApproval.DataSource = ds;
                        gvApproval.DataBind();
                        trgvApproval.Visible = true;
                        ViewState["DSGVSTUDENT"] = ds;

                    }
                    else
                    {
                        gvEmp.DataSource = ds;
                        gvEmp.DataBind();
                        trgvemp.Visible = true;
                        ViewState["DSGVEMP"] = ds;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void gvApproval_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = (DataSet)ViewState["gvApproval"];
            gvApproval.DataSource = ds;
            gvApproval.PageIndex = e.NewPageIndex;
            gvApproval.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }

    protected void gvApproval_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        DataSet ds = new DataSet();
        try
        {

            if (e.CommandName.ToUpper() == "VIEW")
            {
                GridViewRow gvr = (GridViewRow)(((WebControl)e.CommandSource).NamingContainer);
                int row = gvr.RowIndex;
                Label lblusrname = (Label)gvApproval.Rows[row].FindControl("lblusername");
                Label lblonlineno = (Label)gvApproval.Rows[row].FindControl("lblstudentonlineno");
                username = lblusrname.Text;
                string studentonlineno = lblonlineno.Text.Trim();
                //string empstd = ddlstudentemp.SelectedValue;
                // string empstd = Request.Form["ddlstudentemp"];
                string emporstd = ViewState["EMPorSTD"].ToString();
                if (emporstd.ToUpper() == "STD")
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('PricipalStudentapprove.aspx?studentonlineno=" + studentonlineno + "&Empstd=" + emporstd + "','null','height=600,width=850,scroll=auto,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');</Script>", false);
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('PricipalStudentapprove.aspx?Username=" + username + "&Empstd=" + empstd + "&Dob=" + dob1 + "','null','height=600,width=850,scroll=auto,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');</Script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('PricipalEmpapprove.aspx?studentonlineno=" + studentonlineno + "&Empstd=" + emporstd + "','null','height=600,width=850,scroll=auto,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');</Script>", false);
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('PricipalEmpapprove.aspx?Username=" + username + "&Empstd=" + emporstd + "&Dob=" + dob1 + "','null','height=600,width=850,scroll=auto,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');</Script>", false);
                    //  ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "Popup_PrintReceipt('Pricipalapprove.aspx?Username=" + username + "&Empstd=" + empstd + "&Dob=" + dob1 + "');", true);
                }
            }
            if (e.CommandName.ToUpper() == "REJECT")
            {
                string output = string.Empty;
                GridViewRow gvr = (GridViewRow)(((WebControl)e.CommandSource).NamingContainer);
                int row = gvr.RowIndex;
                Label lblusrname = (Label)gvApproval.Rows[row].FindControl("lblusername");
                Label admno = (Label)gvApproval.Rows[row].FindControl("lbladmissionno");
                Label studentonlineno = (Label)gvApproval.Rows[row].FindControl("lblstudentonlineno");
                string username = studentonlineno.Text.Trim();
                //string empstd = ddlstudentemp.SelectedValue;
                string empstd = ddlstudentemp.Value;
                string admissionno = admno.Text.Trim();

                output = student.ApproveStdRegform(username, "S", "R");
                if (output == "R")
                {
                    btnsubmit_Click(sender, e);
                    lblmsg.Text = "Rejected Successfully";
                    lblmsg.CssClass = "success";

                }
            }
            if (e.CommandName.ToUpper() == "APPROVE")
            {
                string output = string.Empty;
                GridViewRow gvr = (GridViewRow)(((WebControl)e.CommandSource).NamingContainer);
                int row = gvr.RowIndex;
                Label studentonlineno = (Label)gvApproval.Rows[row].FindControl("lblstudentonlineno");
                string studentonlineno1 = studentonlineno.Text;
                output = student.ApproveStdRegform(studentonlineno1, "S", "A");
                if (output == "Y")
                {
                    btnsubmit_Click(sender, e);
                    lblmsg.Text = "Approved Successfully";
                    lblmsg.CssClass = "success";

                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void gvApproval_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void gvApproval_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }
    protected void gvApproval_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void gvApproval_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
    protected void gvApproval_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void gvEmp_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        DataSet ds = new DataSet();
        try
        {

            if (e.CommandName.ToUpper() == "VIEW")
            {
                GridViewRow gvr = (GridViewRow)(((WebControl)e.CommandSource).NamingContainer);
                int row = gvr.RowIndex;
                Label lblusrname = (Label)gvEmp.Rows[row].FindControl("lblusername");
                Label lbldob = (Label)gvEmp.Rows[row].FindControl("lblDOB");
                Label lblempid = (Label)gvEmp.Rows[row].FindControl("lblempid");
                string username = lblusrname.Text;
                string empstd = ddlstudentemp.Value;
                string empid = lblempid.Text.Trim();
                // string empstd = Request.Form["ddlstudentemp"];
                string[] dob = lbldob.Text.Split('/');
                string mm = dob[1];
                string dd = dob[0];
                string yyyy = dob[2];
                string dob1 = mm + "/" + dd + "/" + yyyy;
                //int iIndex = Convert.ToInt32(e.CommandArgument);
                //string strApplicationNo;
                //GridViewRow row = GVData.Rows[iIndex];
                /* strApplicationNo = row.Cells[1].Text;*/   //get Application Number   
                if (empstd.ToUpper() == "E")
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('PricipalEmpapprove.aspx?empid=" + empid + "&Empstd=" + empstd + "','null','height=600,width=850,scroll=auto,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');</Script>", false);
                    //  ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "Popup_PrintReceipt('Pricipalapprove.aspx?Username=" + username + "&Empstd=" + empstd + "&Dob=" + dob1 + "');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('PricipalStudentapprove.aspx?empid=" + empid + "&Empstd=" + empstd + "','null','height=600,width=850,scroll=auto,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');</Script>", false);
                }
            }
            if (e.CommandName.ToUpper() == "REJECT")
            {
                string output = string.Empty;
                GridViewRow gvr = (GridViewRow)(((WebControl)e.CommandSource).NamingContainer);
                int row = gvr.RowIndex;
                //Label lblusrname = (Label)gvEmp.Rows[row].FindControl("lblusername");
                //Label lbldob = (Label)gvEmp.Rows[row].FindControl("lblDOB");
                Label lblempid = (Label)gvEmp.Rows[row].FindControl("lblempid");
                string empstd = Request.Form["ddlstudentemp"];
                string empid = lblempid.Text.Trim();
                output = student.ApproveStdRegform(empid, "E", "R");
                if (output == "R")
                {
                    btnsubmit_Click(sender, e);
                    lblmsg.Text = "Reject Done Successfully";
                    lblmsg.CssClass = "success";
                }
            }
            if (e.CommandName.ToUpper() == "APPROVE")
            {
                string output = string.Empty;
                GridViewRow gvr = (GridViewRow)(((WebControl)e.CommandSource).NamingContainer);
                int row = gvr.RowIndex;
                // Label lblusrname = (Label)gvEmp.Rows[row].FindControl("lblusername");
                // Label lbldob = (Label)gvEmp.Rows[row].FindControl("lblDOB");
                Label lblempid = (Label)gvEmp.Rows[row].FindControl("lblempid");
                string empstd = Request.Form["ddlstudentemp"];
                string empid = lblempid.Text.Trim();
                output = student.ApproveStdRegform(empid, "E", "A");
                if (output == "Y")
                {
                    btnsubmit_Click(sender, e);
                    lblmsg.Text = "Approved Done Successfully";
                    lblmsg.CssClass = "success";

                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void gvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = (DataSet)ViewState["DSGVEMP"];
            gvEmp.DataSource = ds;
            gvEmp.PageIndex = e.NewPageIndex;
            gvEmp.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void gvEmp_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("studentregnform.aspx");

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.Text = "errormsg";
        }
    }
}