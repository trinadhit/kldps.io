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

public partial class Messages : System.Web.UI.Page
{
    #region members
    EmployeeVOs empvo = new EmployeeVOs();
    StudentVOs objstudentvo = new StudentVOs();
    StudentVOs.student student = new StudentVOs.student();
    #endregion
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
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.CssClass = "errormsg";
        }
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
            ds = student.GetClassWiseStudentDtls(ddlstandard.Value);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {

                // foreach(DataSet ds1 in ds.Tables[0].Rows)
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mobileNo = ds.Tables[0].Rows[i]["FATHER_CONTACT_NO"].ToString();
                    username = "kpsschool";
                    password = "j1227";
                    senderid = "KPSKEM";
                    SrvcUrl = "http://onlinesmslogin.com/quicksms/api.php?";
                    // sms Method Calling Here
                    string date = DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString() + "/" + DateTime.Now.Year.ToString();
                    message = txtmsg.Value + " " + "Regards Kalidindi EM School. ";
                    string URL = "http://onlinesmslogin.com/quicksms/api.php?" + "username=" + username + "&password=" + password + "&to=" + mobileNo + "&from=" + senderid + "&message=" + message;
                    //String result = GetPageContent("http://onlinesmslogin.com/quicksms/api.php?username=kpsschool&password=9347712208&to=mobileNo&from=xxxxxxxx&message=xxxxxxxxxxxx");
                    String result = GetPageContent(URL);
                }
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
    private static string GetPageContent(string FullUri)
    {
        HttpWebRequest Request;
        StreamReader ResponseReader;
        Request = ((HttpWebRequest)(WebRequest.Create(FullUri)));
        ResponseReader = new StreamReader(Request.GetResponse().GetResponseStream());
        return ResponseReader.ReadToEnd();
    }

}