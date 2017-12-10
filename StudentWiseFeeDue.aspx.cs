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
public partial class StudentWiseFeeDue : System.Web.UI.Page
{
    #region members
    EmployeeVOs empvo = new EmployeeVOs();
    StudentVOs objstudentvo = new StudentVOs();
    StudentVOs.student student = new StudentVOs.student();
    #endregion
    #region events
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
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        lblmsg.Text = "";
        try
        {
            ds = student.GetClassWiseStudentDtls(standard);

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                // byte[] photoByte;
                // System.Drawing.Image imgPhoto;
                // DataTable dt1 = new DataTable();
                // dt1.Columns.Add("STUDENT_IMAGE", typeof(Image));
                // // Image img =((Image) dt.Rows[0]["STUDENT_IMAGE"]);
                // photoByte = ((byte[])dt.Rows[0]["STUDENT_IMAGE"]);
                // HtmlImage imgPhoto1 = (HtmlImage)tblphoto.FindControl("image");
                // MemoryStream stream = new MemoryStream(photoByte);
                // imgPhoto = System.Drawing.Image.FromStream(stream);
                // DataRow dr = dt.NewRow();
                //// dr["STUDENT_IMAGE"] = byteArrayToImage(photoByte);
                // dt.Rows.Add(dr);


                //DataTable dt = new DataTable();
                //dt.Columns.Add("NAME");
                //dt.Columns.Add("FATHER_NAME");
                //dt.Columns.Add("GENDER");
                //dt.Columns.Add("CLASS");
                //dt.Columns.Add("DOB");
                //dt.Columns.Add("STUDENT_IMAGE");
                //DataRow dr = dt.NewRow();
                //dr["NAME"] = ds.Tables[0].Rows[0]["NAME"];
                //dr["FATHER_NAME"] = ds.Tables[0].Rows[0]["FATHER_NAME"];
                //dr["GENDER"] = ds.Tables[0].Rows[0]["GENDER"];
                //dr["CLASS"] = ds.Tables[0].Rows[0]["CLASS"];
                //dr["DOB"] = ds.Tables[0].Rows[0]["DOB"];
                //dr["DOB"] = ds.Tables[0].Rows[0]["ADMISSION_NO"];
                //byte[] photoByte;
                //photoByte = ((byte[])ds.Tables[0].Rows[0]["STUDENT_IMAGE"]);
                //// photoByte = ((byte[])ds1.Tables[0].Rows[0]["PHOTOIMAGE"]);
                //HtmlImage imgPhoto = (HtmlImage)tblphoto.FindControl("imgPhoto");
                //string photoImageName = lblname.Text + "_photo.jpg";
                //displayImage(photoByte, photoImageName, imgPhoto);
                //dr["STUDENT_IMAGE"] = photoByte;
                //dt.Rows.Add(dr);


                gvAttendanceRpt.DataSource = ds;
                gvAttendanceRpt.DataBind();
                gvAttendanceRpt.Visible = true;
                divstd.Visible = true;
                ibtnExportToExcel.Visible = true;
                ibtnPrint.Visible = true;
            }
            else
            {
                lblmsg.Text = "No Records Found";
                lblmsg.CssClass = "errormsg";
                //gvAttendanceRpt.Visible = false;
                divstd.Visible = false;
            }

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    public System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
    {
        MemoryStream ms = new MemoryStream(byteArrayIn);
        System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
        return returnImage;
    }
    public static void displayImage(byte[] photoByte, string strFileName, System.Web.UI.HtmlControls.HtmlImage imgBox)
    {
        if (photoByte != null && photoByte.Length > 1)
        {
            System.Drawing.Image imgPhoto;
            string temp_Folder = "~/Temporary_Photos";
            string temp_PathForSaveImg = System.Web.HttpContext.Current.Server.MapPath(temp_Folder);
            using (MemoryStream stream = new MemoryStream(photoByte))
            {
                FileInfo file = new FileInfo(temp_PathForSaveImg + "\\" + strFileName);
                imgPhoto = System.Drawing.Image.FromStream(stream);
                if (file.Exists)
                {
                    file.Delete();
                }
                imgPhoto.Save(temp_PathForSaveImg + "\\" + strFileName);

                imgBox.Attributes.Add("src", temp_Folder + "/" + strFileName);
            }
        }
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("ClassWiseStudentDtls.aspx");

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.Text = "errormsg";
        }
    }
    protected void ibtnExportToExcel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Response.ClearContent();

            Response.AppendHeader("content-disposition", "attachment; filename=ClassWiseStudentReport.xls");

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
    #endregion
}