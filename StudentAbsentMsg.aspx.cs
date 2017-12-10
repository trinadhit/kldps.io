using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
using System.IO;
using System.Text;
using System.Net;
using System.Data.SqlClient;
using System.Data;
public partial class StudentAbsentMsg : System.Web.UI.Page
{
    #region members
    EmployeeVOs empvo = new EmployeeVOs();
    StudentVOs objstudentvo = new StudentVOs();
    StudentVOs.student student = new StudentVOs.student();
    #endregion
    #region events
    protected void Page_Load(object sender, EventArgs e)
    {
        // string fdd = ""; string fmm = ""; string fyyyy = ""; string tdd = ""; string tmm = ""; string tyyyy = "";
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
            txtfdd.Value = DateTime.Now.Day.ToString();
            txtfmm.Value = DateTime.Now.Month.ToString();
            txtfyyyy.Value = DateTime.Now.Year.ToString();

            txttdd.Value = DateTime.Now.Day.ToString();
            txttmm.Value = DateTime.Now.Month.ToString();
            txttyyyy.Value = DateTime.Now.Year.ToString();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.CssClass = "errormsg";
        }
    }
    public void btngetdtls_Click(object sender, EventArgs e)
    {
        string standard = ddlstandard.Value;
        DataSet ds = new DataSet();
        lblMsg.Text = "";
        try
        {
            ds = student.GetAttendancedtls(standard);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                gvStudentattendance.DataSource = ds.Tables[0];
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
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.CssClass = "errormsg";
        }
    }
    private static string GetPageContent(string FullUri)
    {
        HttpWebRequest Request;
        StreamReader ResponseReader;
        Request = ((HttpWebRequest)(WebRequest.Create(FullUri)));
        ResponseReader = new StreamReader(Request.GetResponse().GetResponseStream());
        return ResponseReader.ReadToEnd();
    }
    protected void btnsendmsg_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            string username = ""; string password = ""; string senderid = ""; string mobileNo = "";
            string message = ""; string SrvcUrl = "";
            string studentname = ""; string fathername = ""; string studentclass = ""; string gender = "";
            DataSet ds = new DataSet();
            DataSet dsregnodtls = new DataSet();
            username = "kpsschool";
            password = "j1227";
            senderid = "KPSKEM";
            SrvcUrl = "http://onlinesmslogin.com/quicksms/api.php?";

            // sms Method Calling Here
            string date = DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString() + "/" + DateTime.Now.Year.ToString();
            // dsregnodtls = student.GetAbsentStudentDtls(date, "GET", null, null);

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
                        Label lblname = (Label)gvStudentattendance.Rows[i].FindControl("lblname");
                        Label lblfathername = (Label)gvStudentattendance.Rows[i].FindControl("lblfathername");
                        Label lblclass = (Label)gvStudentattendance.Rows[i].FindControl("lblclass");
                        Label lblattendance = (Label)gvStudentattendance.Rows[i].FindControl("lblattendance");
                        Label lblmobno = (Label)gvStudentattendance.Rows[i].FindControl("lblmobileno");
                        Label lblgender = (Label)gvStudentattendance.Rows[i].FindControl("lblgender");
                        StudentVOs objfile = new StudentVOs();

                        objfile.student_FIRST_NAME = lblname.Text.ToUpper();
                        objfile.student_father_NAME = lblfathername.Text.ToUpper();
                        objfile.STUDENT_CLASS = lblclass.Text.ToUpper();
                        objfile.attandance = lblattendance.Text.ToUpper();
                        objfile.STUDENT_FATHER_NO = lblmobno.Text;
                        objfile.STUDENT_GENDER = lblgender.Text;
                        listfile.Add(objfile);
                        int count = listfile.Count;
                        for (int j = 0; j < count; j++)
                        {
                            studentname = objfile.student_FIRST_NAME;
                            fathername = objfile.student_father_NAME;
                            studentclass = objfile.STUDENT_CLASS;
                            mobileNo = objfile.STUDENT_FATHER_NO;
                            gender = objfile.STUDENT_GENDER;
                            if (gender.ToUpper() == "MALE")
                            {
                                gender = "Son";
                            }
                            else
                            {
                                gender = "Female";
                            }
                        }
                        message = "Dear Parents, Your " + gender + " Name " + studentname + " Father Name " + fathername +
                                   " Of " + studentclass + " is absent today. Regards Kalidindi EM School. ";
                        string URL = "http://onlinesmslogin.com/quicksms/api.php?" + "username=" + username + "&password=" + password + "&to=" + mobileNo + "&from=" + senderid + "&message=" + message;
                        //String result = GetPageContent("http://onlinesmslogin.com/quicksms/api.php?username=kpsschool&password=9347712208&to=mobileNo&from=xxxxxxxx&message=xxxxxxxxxxxx");
                        String result = GetPageContent(URL);
                    }
                }
            }
            if (listfile.Count > 0)
            {
            }
            else
            {
                lblMsg.Text += "Select alteast one Student";
                lblMsg.CssClass = "errormsg";
                return;
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.CssClass = "errormsg";
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
    #endregion
}