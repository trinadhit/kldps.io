using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
using System.IO;
using System.Data;
public partial class CollectedFeeReport : System.Web.UI.Page
{
    EmployeeVOs objempvos = new EmployeeVOs();
    StudentVOs objstudent = new StudentVOs();
    StudentVOs.student student = new StudentVOs.student();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["EMPUSER"] != null)
                {
                    objempvos = (EmployeeVOs)Session["EMPUSER"];
                    if (objempvos.ROLE_CODE != 1)
                    {
                        DataSet ds = new DataSet();
                        ds = student.GetStudentOnlineNos();
                        ddlstudentemp.DataSource = ds;
                        ddlstudentemp.DataTextField = "STUDENT_ONLINE_NO";
                        ddlstudentemp.DataValueField = "ADMISSION_NO";
                        ddlstudentemp.DataBind();
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                        //lblmsg.Text = "You Are Not Authorized Person To Access This Page..";
                        //lblmsg.CssClass = "errormsg";
                        //tblapproval.Visible = false;
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        catch (Exception EX)
        {
            lblmsg.Text = EX.Message;
        }
    }
}