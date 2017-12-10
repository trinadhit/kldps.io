using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
using System.Data;


public partial class FeeEODReport : System.Web.UI.Page
{
    EmployeeVOs objempvo = new EmployeeVOs();
    StudentVOs.student student = new StudentVOs.student();
    string fromdate = ""; string todate = "";
    //protected void Page_Load(object sender, EventArgs e)
    //{

    //}

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["EMPUSER"] != null)
                {
                    txtfdd.Value = DateTime.Now.Day.ToString();
                    txtfmm.Value = DateTime.Now.Month.ToString();
                    txtfyyyy.Value = DateTime.Now.Year.ToString();
                    txttdd.Value = DateTime.Now.Day.ToString();
                    txttmm.Value = DateTime.Now.Month.ToString();
                    txttyyyy.Value = DateTime.Now.Year.ToString();
                    objempvo = (EmployeeVOs)Session["EMPUSER"];
                    BtnGetDtls_Click(sender, e);
                }
                else
                {
                    Response.Redirect("EmpLogin.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.Text = "errormsg";
        }
    }
    protected void BtnGetDtls_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        DataSet ds = new DataSet();
        try
        {
            fromdate = txtfmm.Value + "/" + txtfdd.Value + "/" + txtfyyyy.Value;
            todate = txttmm.Value + "/" + txttdd.Value + "/" + txttyyyy.Value;
            ds = student.GetEodReport(fromdate, todate);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 1)
            {
                gvStudentstrength.DataSource = ds;
                gvStudentstrength.DataBind();
                diveod.Visible = true;
                foreach (GridViewRow gvr in gvStudentstrength.Rows)
                {
                    Label lbltotal = (Label)gvr.FindControl("lblonlineno");
                    Button btnprint = (Button)gvr.FindControl("btnprint");
                    if (lbltotal.Text.ToUpper() == "TOTAL")
                    {
                        btnprint.Visible = false;
                        gvr.Cells[0].Text = "";
                        gvr.Style.Add("font-weight", "bold");
                        gvr.Style.Add("Height", "30px");
                    }
                }
                ibtnExportToExcel.Visible = true;
                ibtnPrint.Visible = true;
            }
            else
            {
                lblmsg.Text = "NO Records Found";
                lblmsg.CssClass = "errormsg";
                diveod.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }

    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        Response.Redirect("FeeEODReport.aspx");
    }
    //protected void idddlclass_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    lblmsg.Text = "";
    //    try
    //    {
    //        string stdclass = idddlclass.Value;
    //        string stdonlineno = ddlolno.SelectedValue;
    //        DataSet ds = new DataSet();
    //        ds = student.GetStudentOnlineNoclasswise(stdclass,stdonlineno);
    //        if(ds!=null && ds.Tables.Count>0 && ds.Tables[0].Rows.Count>0)
    //        {
    //            ddlolno.DataSource = ds;
    //            ddlolno.DataTextField = "STUDENT_ONLINE_NO";
    //            ddlolno.DataValueField = "CLASS";
    //            ddlolno.DataBind();
    //        }

    //    }
    //    catch(Exception ex)
    //    {

    //    }
    //}



    //protected void idddlclass_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    lblmsg.Text = "";
    //    try
    //    {
    //        string stdclass = idddlclass.SelectedValue;
    //        //string stdonlineno = ddlolno.SelectedValue;
    //        DataSet ds = new DataSet();
    //        ds = student.GetStudentOnlineNoclasswise(stdclass);
    //        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
    //        {
    //            ddlolno.DataSource = ds;
    //            ddlolno.DataTextField = "STUDENT_ONLINE_NO";
    //            ddlolno.DataValueField = "CLASS";
    //            ddlolno.DataBind();
    //            Select(ddlolno);
    //        }

    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}
    //protected void Select(DropDownList ddl)
    //{
    //    ListItem li = new ListItem();
    //    li.Text = "ALL";
    //    li.Value = "A";
    //    ddl.Items.Add(li);
    //}
    protected void gvStudentstrength_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DataSet ds = new DataSet();
        try
        {

            if (e.CommandName.ToUpper() == "REPRINT")
            {
                GridViewRow gvr = (GridViewRow)(((WebControl)e.CommandSource).NamingContainer);
                int rowno = gvr.RowIndex;
                Label lblonlineno = (Label)gvStudentstrength.Rows[rowno].FindControl("lblonlineno");
                Label lblreceiptno = (Label)gvStudentstrength.Rows[rowno].FindControl("lblfeereceiptno");
                string onlineno = lblonlineno.Text.Trim();
                string receiptno = lblreceiptno.Text.Trim();
                Session["STDOLNO"] = onlineno;
                Session["RECEIPRNO"] = receiptno;
                //if (!String.IsNullOrEmpty(onlineno))
                //{
                //    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('FeeReceiptprint.aspx?studentonlineno=" + onlineno + "&ReceiprNo=" + receiptno + "','null','height=600,width=850,scroll=auto,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');</Script>", false);
                //    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('PricipalStudentapprove.aspx?Username=" + username + "&Empstd=" + empstd + "&Dob=" + dob1 + "','null','height=600,width=850,scroll=auto,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes');</Script>", false);
                //}
                if (!String.IsNullOrEmpty(onlineno))
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('ReceiptReprint.aspx','null','height=600,width=900,scrollbars=1,status=yes,toolbar=no,menubar=1,location=no');</Script>", false);
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void gvStudentstrength_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[1].Text.ToUpper().Contains("TOTAL"))
                {
                    e.Row.Style.Add("font-weight", "bold");
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void ibtnExportToExcel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Response.ClearContent();

            Response.AppendHeader("content-disposition", "attachment; filename=Fee Report.xls");

            Response.ContentType = "application/excel";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            if (gvStudentstrength.Visible)
            {
                gvStudentstrength.HeaderRow.Style.Add("background-color", "#FFFFFF");
                foreach (TableCell tableCell in gvStudentstrength.HeaderRow.Cells)
                {
                    tableCell.Style["background-color"] = "#A55129";
                }
                foreach (GridViewRow gridViewRow in gvStudentstrength.Rows)
                {
                    gridViewRow.BackColor = System.Drawing.Color.White;
                    foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                    {
                        gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                    }
                }
                gvStudentstrength.RenderControl(htw);
            }
            Response.Write(stringWriter.ToString());
            Response.End();
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
            lblmsg.Visible = true;
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
}