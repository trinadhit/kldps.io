using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Common;
using KLDSCHOOL_BL;

public partial class Login : System.Web.UI.Page
{
    //string cs = ConfigurationManager.ConnectionStrings["schoolstringtest"].ConnectionString;
    //SqlConnection con;
    //SqlCommand cmd;
    EmployeeVOs emovo = new EmployeeVOs();
    StudentVOs stdvo = new StudentVOs();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        divmsg.Visible = false;
        DataSet ds = new DataSet();
        try
        {
            string username = usrname.Value;
            string password = pass.Value;
            ds = emovo.GetEmplogin(username, password);

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["EMPSTD"].ToString().ToUpper() =="S")
                {
                    stdvo.student_USER_NAME = ds.Tables[0].Rows[0]["USER_NAME"].ToString();
                    stdvo.student_PASSWORD = ds.Tables[0].Rows[0]["PASSWORD"].ToString();
                    stdvo.student_FIRST_NAME = ds.Tables[0].Rows[0]["FIRST_NAME"].ToString();
                    stdvo.student_LAST_NAME = ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
                    stdvo.student_father_NAME = ds.Tables[0].Rows[0]["FATHER_NAME"].ToString();
                    stdvo.student_MOTHER_NAME = ds.Tables[0].Rows[0]["MOTHER_NAME"].ToString();
                    stdvo.STUDENT_GENDER = ds.Tables[0].Rows[0]["GENDER"].ToString();
                    if (ds.Tables[0].Rows[0]["DOB"].ToString() != null)
                    {
                        stdvo.STUDENT_dob = ds.Tables[0].Rows[0]["DOB"].ToString();
                    }
                    else
                    {
                        stdvo.STUDENT_dob = null;
                    }

                    stdvo.ACTIVE = ds.Tables[0].Rows[0]["CLASS"].ToString();

                    stdvo.STUDENT_FATHER_NO = ds.Tables[0].Rows[0]["FATHER_CONTACT_NO"].ToString();
                    stdvo.STUDENT_ADDRESS = ds.Tables[0].Rows[0]["ADDRESS"].ToString();
                    stdvo.STUDENT_ROLE_CODE = Convert.ToInt32(ds.Tables[0].Rows[0]["ROLE_CODE"]);
                    if (ds.Tables[0].Rows[0]["EMAIL"].ToString() != null)
                    {
                        stdvo.STUDENT_email = ds.Tables[0].Rows[0]["EMAIL"].ToString();
                    }
                    else
                    {
                        stdvo.STUDENT_email = null;
                    }
                    stdvo.ACTIVE = ds.Tables[0].Rows[0]["ACTIVE"].ToString();
                    stdvo.caste = ds.Tables[0].Rows[0]["CAST"].ToString();
                    stdvo.parentsoccupation = ds.Tables[0].Rows[0]["FATHER_OCCUPATION"].ToString();

                    stdvo.brothersisnamr = ds.Tables[0].Rows[0]["BRO_SIS_NAME"].ToString();
                    stdvo.aadharno = ds.Tables[0].Rows[0]["AADHAR_NUMBER"].ToString();
                    stdvo.admissionno = ds.Tables[0].Rows[0]["ADMISSION_NO"].ToString();
                    stdvo.student_online_no = ds.Tables[0].Rows[0]["STUDENT_ONLINE_NO"].ToString();
                    stdvo.TOTAL_FEE = Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL_FEE"]);
                    stdvo.EXEMPTED_FEE = Convert.ToDecimal(ds.Tables[0].Rows[0]["EXEMPTED_FEE"]);
                    stdvo.NEED_TO_PAYFEE = Convert.ToDecimal(ds.Tables[0].Rows[0]["NEED_TO_PAYFEE"]);
                    Session["STUDENTUSER"] = stdvo;
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    emovo.USER_NAME = ds.Tables[0].Rows[0]["USER_NAME"].ToString();
                    emovo.PASSWORD = ds.Tables[0].Rows[0]["PASSWORD"].ToString();
                    emovo.FIRST_NAME = ds.Tables[0].Rows[0]["FIRST_NAME"].ToString();
                    emovo.LAST_NAME = ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
                    emovo.GENDER = ds.Tables[0].Rows[0]["GENDER"].ToString();
                    emovo.DEGIGNATION = ds.Tables[0].Rows[0]["DESIGNATION"].ToString();
                    emovo.ADDRESS = ds.Tables[0].Rows[0]["ADDRESS"].ToString();
                    emovo.MOBILE_NO = ds.Tables[0].Rows[0]["CONTACT_NO"].ToString();
                    emovo.ACTIVE = ds.Tables[0].Rows[0]["ACTIVE"].ToString();
                    emovo.ROLE_CODE =Convert.ToInt32(ds.Tables[0].Rows[0]["ROLE_CODE"].ToString());
                    Session["EMPUSER"] = emovo;
                    Response.Redirect("HomePage.aspx");
                }
            }
            else
            {

            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
            divmsg.Visible = true;
        }
    }

}