using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
using System.Data;

public partial class ClassWiseStudentStrength : System.Web.UI.Page
{
    EmployeeVOs objempvo = new EmployeeVOs();
    StudentVOs.student student = new StudentVOs.student();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        DataSet ds = new DataSet();
        try
        {
            if (!IsPostBack)
            {
                if (Session["EMPUSER"] != null)
                {
                    ds = student.GetStudentStrength();
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 1)
                    {
                        gvStudentstrength.DataSource = ds;
                        gvStudentstrength.DataBind();
                        dvStrength.Visible = true;
                        divstd.Visible = false;
                        dvexcel.Visible = true;
                    }
                   
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
            dvStrength.Visible = false;
            divstd.Visible = false;
        }
    }

    protected void gvStudentstrength_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string standard = "";
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        lblmsg.Text = "";
        try
        {
            GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            int i = gvr.RowIndex;

            Label lblstandard = (Label)gvStudentstrength.Rows[i].FindControl("lblstandard");
            standard = lblstandard.Text;
            ds = student.GetClassWiseStudentDtls(standard);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                gvAttendanceRpt.DataSource = ds;
                gvAttendanceRpt.DataBind();
                gvAttendanceRpt.Visible = true;
                divstd.Visible = true;
                ibtnExportToExcel.Visible = true;
                ibtnPrint.Visible = true;
                dvStrength.Visible = false;
                dvBack.Visible = true;
                dvexcel.Visible = true;
            }
            else
            {
                lblmsg.Text = "No Records Found";
                lblmsg.CssClass = "errormsg";
                divstd.Visible = false;
                dvStrength.Visible = false;
                dvexcel.Visible = false;
            }

        }

        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
            dvStrength.Visible = false;
            divstd.Visible = false;
            dvexcel.Visible = false;
        }
    }
    protected void ibtnExportToExcel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Response.ClearContent();

            Response.AppendHeader("content-disposition", "attachment; filename=Student Strength.xls");

            Response.ContentType = "application/excel";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            if (dvStrength.Visible)
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
            else
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
    protected void btnBack_Click(object sender, EventArgs e)
    {
        try
        {
            if (divstd.Visible == true)
            {
                divstd.Visible = false;
                dvStrength.Visible = true;
            }
            else
            {
                divstd.Visible = false;
                dvStrength.Visible = true;
            }

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.Text = "errormsg";
        }
    }
}