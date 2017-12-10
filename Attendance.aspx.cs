using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using KLDSCHOOL_BL;
using System.IO;
public partial class Attendance : System.Web.UI.Page
{
    EmployeeVOs empvo = new EmployeeVOs();
    StudentVOs objstudentvo = new StudentVOs();
    StudentVOs.student student = new StudentVOs.student();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["EMPUSER"] != null)
                {
                    empvo = (EmployeeVOs)Session["EMPUSER"];
                }
                else
                {
                    Response.Redirect("EmpLogin.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.CssClass = "errormsg";
        }
    }

    public void btngetdtls_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        ViewState["NORECORDS"] = null;
        try
        {
            DataSet ds = new DataSet();
            string standard = ddlstandard.Value;
            ds = student.GetStddtlsforAttendance(standard);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                gvStudentattendance.DataSource = ds;
                gvStudentattendance.DataBind();
                trgvStudentattendance.Visible = true;
                trSave.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Records Found";
                lblMsg.CssClass = "errormsg";
                trgvStudentattendance.Visible = false;
                trSave.Visible = false;
                if (ViewState["NORECORDS"] != null)
                {
                    string norecords = ViewState["NORECORDS"].ToString();
                    if (norecords == "Saved Successfully")
                    {
                        lblMsg.Text = "Saved Successfully";
                        lblMsg.CssClass = "success";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.CssClass = "errormsg";
        }
    }
    public void btnpresent_Click(object sender, EventArgs e)
    {
        empvo = (EmployeeVOs)Session["EMPUSER"];
        lblMsg.Text = "";
        string output = "";
        try
        {
            List<StudentVOs> listfile = new List<StudentVOs>();
            if (trgvStudentattendance.Visible == true)
            {
                foreach (GridViewRow gv in gvStudentattendance.Rows)
                {
                    CheckBox chk = (CheckBox)gv.FindControl("chksingle");
                    if (chk.Checked)
                    {
                        int i = gv.RowIndex;
                        Label lblonlineno = (Label)gvStudentattendance.Rows[i].FindControl("lblonlineno");
                        StudentVOs objfile = new StudentVOs();
                        objfile.student_online_no = lblonlineno.Text.ToUpper();

                        objfile.attandance = "P";
                        objfile.student_USER_NAME = empvo.USER_NAME; // LOGIN EMP USER NAME
                        listfile.Add(objfile);
                    }
                }
                if (listfile.Count > 0)
                {
                }
                else
                {
                    lblMsg.Text += "Select alteast one Details";
                    lblMsg.CssClass = "errormsg";
                    return;
                }
                output = student.InsertStdAttendance(listfile);
                if (output == "Y")
                {
                    lblMsg.Text = "Saved Successfully";
                    lblMsg.CssClass = "success";
                    ViewState["NORECORDS"] = lblMsg.Text;
                    btngetdtls_Click(sender, e);

                }
                else
                {
                    lblMsg.Text = "Try Again";
                    lblMsg.CssClass = "errormsg";
                }

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.CssClass = "errormsg";
        }
    }
    public void btnabsent_Click(object sender, EventArgs e)
    {
        empvo = (EmployeeVOs)Session["EMPUSER"];
        lblMsg.Text = "";
        string output = "";
        try
        {
            List<StudentVOs> listfile = new List<StudentVOs>();
            if (trgvStudentattendance.Visible == true)
            {
                foreach (GridViewRow gv in gvStudentattendance.Rows)
                {
                    CheckBox chk = (CheckBox)gv.FindControl("chksingle");
                    if (chk.Checked)
                    {
                        int i = gv.RowIndex;
                        Label lblonlineno = (Label)gvStudentattendance.Rows[i].FindControl("lblonlineno");
                        StudentVOs objfile = new StudentVOs();
                        objfile.student_online_no = lblonlineno.Text.ToUpper();

                        objfile.attandance = "A";
                        objfile.student_USER_NAME = empvo.USER_NAME; // LOGIN EMP USER NAME
                        listfile.Add(objfile);
                    }
                }
                if (listfile.Count > 0)
                {
                }
                else
                {
                    lblMsg.Text += "Select alteast one Details";
                    lblMsg.CssClass = "errormsg";
                    return;
                }
                output = student.InsertStdAttendance(listfile);
                if (output == "Y")
                {
                    lblMsg.Text = "Saved Successfully";
                    lblMsg.CssClass = "success";
                    lblMsg.Text = "Saved Successfully";
                    lblMsg.CssClass = "success";
                    btngetdtls_Click(sender, e);
                }
                else
                {
                    lblMsg.Text = "Try Again";
                    lblMsg.CssClass = "errormsg";
                }

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.CssClass = "errormsg";
        }
    }
    protected void btnclear1_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("StudentAbsentMsg.aspx");

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.Text = "errormsg";
        }
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("StudentAbsentMsg.aspx");

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.Text = "errormsg";
        }
    }
}