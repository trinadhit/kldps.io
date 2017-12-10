using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
using System.IO;
using System.Text;
using System.Net;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Imaging;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.UI.WebControls;

public partial class StudentAttendanceReport : System.Web.UI.Page
{
    #region members
    EmployeeVOs empvo = new EmployeeVOs();
    StudentVOs objstudentvo = new StudentVOs();
    StudentVOs.student student = new StudentVOs.student();
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            objstudentvo = (StudentVOs)Session["STUDENTUSER"];
            empvo = (EmployeeVOs)Session["EMPUSER"];
            if (!IsPostBack)
            {
                if (Session["EMPUSER"] != null || Session["STUDENTUSER"] != null)
                {
                    txtfdd.Value = DateTime.Now.Day.ToString();
                    txtfmm.Value = DateTime.Now.Month.ToString();
                    txtfyyyy.Value = DateTime.Now.Year.ToString();

                    txttdd.Value = DateTime.Now.Day.ToString();
                    txttmm.Value = DateTime.Now.Month.ToString();
                    txttyyyy.Value = DateTime.Now.Year.ToString();
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
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void BtnGetDtls_Click(object sender, EventArgs e)
    {
        string standard = ddlstandard.Value;
        string attendance = ddlattendance.Value;
        string fromdate = ""; string todate = "";
        fromdate = txtfmm.Value + "/" + txtfdd.Value + "/" + txtfyyyy.Value;
        todate = txttmm.Value + "/" + txttdd.Value + "/" + txttyyyy.Value;
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        lblmsg.Text = "";
        try
        {
            ds = student.GetAttendancedtlsRpt(standard, attendance, fromdate, todate);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                gvAttendanceRpt.DataSource = ds;
                gvAttendanceRpt.DataBind();
                divstd.Visible = true;
                ibtnExportToExcel.Visible = true;
                ibtnPrint.Visible = true;
            }
            else
            {
                lblmsg.Text = "No Records Found";
                lblmsg.CssClass = "errormsg";
                divstd.Visible = false;
                ibtnExportToExcel.Visible = false;
                ibtnPrint.Visible = false;
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

            Response.AppendHeader("content-disposition", "attachment; filename=Attendance Report.xls");

            Response.ContentType = "application/excel";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            if (gvAttendanceRpt.Visible)
            {
                gvAttendanceRpt.HeaderRow.Style.Add("background-color", "#FFFFFF");
                foreach (TableCell tableCell in gvAttendanceRpt.HeaderRow.Cells)
                {
                    tableCell.Style["background-color"] = "#A55129";
                }
                foreach (GridViewRow gridViewRow in gvAttendanceRpt.Rows)
                {
                    gridViewRow.BackColor = System.Drawing.Color.White;
                    foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                    {
                        gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                    }
                }

                gvAttendanceRpt.RenderControl(htw);
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
    protected void btnclear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("StudentAttendanceReport.aspx");
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
}