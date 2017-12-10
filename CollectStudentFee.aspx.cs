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

public partial class CollectStudentFee : System.Web.UI.Page
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
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void btngetdetails_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        try
        {
            string studentonlineno = idtxtonlineno.Value;
            dt = student.GetStudentDtlsForEnterMarks1(studentonlineno);
            ds.Tables.Add(dt);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                lblonlineno.Text = ds.Tables[0].Rows[0]["STUDENT_ONLINE_NO"].ToString();
                objstudentvo.student_online_no = lblonlineno.Text;
                lblname.Text = ds.Tables[0].Rows[0]["NAME"].ToString();
                objstudentvo.student_FIRST_NAME = lblname.Text;
                lblfathername.Text = ds.Tables[0].Rows[0]["FATHER_NAME"].ToString();
                objstudentvo.STUDENT_FATHER_NO = lblfathername.Text;
                lblgender.Text = ds.Tables[0].Rows[0]["GENDER"].ToString();
                objstudentvo.STUDENT_GENDER = lblgender.Text;
                lbldob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                objstudentvo.STUDENT_dob = lbldob.Text;
                lblclass.Text = ds.Tables[0].Rows[0]["CLASS"].ToString();
                objstudentvo.STUDENT_CLASS = lblclass.Text;
                 lbladmissionno.Text = ds.Tables[0].Rows[0]["ADMISSION_NO"].ToString();
                objstudentvo.admissionno = lbladmissionno.Text;
                lblannualfee.Text = ds.Tables[0].Rows[0]["NEED_TO_PAYFEE"].ToString();
                objstudentvo.TOTAL_FEE = Convert.ToDecimal(lblannualfee.Text);
                // lblpendingfee.Text = ds.Tables[0].Rows[0]["REMAINING_FEE"].ToString();
                lblpendingfee.Text = ds.Tables[0].Rows[0]["REMAINING_FEE"].ToString();
                objstudentvo.NEED_TO_PAYFEE = Convert.ToDecimal(lblpendingfee.Text);
                txtfatherno.Value = ds.Tables[0].Rows[0]["FATHER_CONTACT_NO"].ToString();
                objstudentvo.STUDENT_FATHER_NO = txtfatherno.Value;
               // lblasofnowtotalcollected.Text = ds.Tables[0].Rows[0]["TOTAL_COLLECTED_FEE"].ToString();
               // objstudentvo.ASOFNO_TOTAL_COLLECTED_FEE =Convert.ToDecimal(lblasofnowtotalcollected.Text);
                tbldata.Visible = true;
                trsave.Visible = true;
                btngetdetails.Disabled = true;
                
                Session["SENDFEEMSG"] = objstudentvo;
                //lblre.Value = ds.Tables[0].Rows[0]["NEED_TO_PAYFEE"].ToString();
                //lblpendingfee.Text = ds.Tables[0].Rows[0]["REMAINING_FEE"].ToString();
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
            tbldata.Visible = false;
            trsave.Visible = false;
        }
    }
    protected void sbtnsave_Click(object sender, EventArgs e)
    {
        int valid = 0;
        try
        {
            decimal rem = Convert.ToDecimal(lblpendingfee.Text);
            decimal paid = Convert.ToDecimal(txtpaid.Value);
            if (rem < paid)
            {
                lblmsg.Text = "Entered Amount Should Not Be Greater Than Pending Amount";
                lblmsg.CssClass = "errormsg";
                valid = 1;
            }
            if (valid == 0)
            {
                objstudentvo.student_online_no = lblonlineno.Text.ToUpper();
                objstudentvo.admissionno = lbladmissionno.Text;
                objstudentvo.COLLECTED_FEE = Convert.ToDecimal(txtpaid.Value);
                string output = student.InsertStudentFeedtls(objstudentvo);
                if (output == "Y")
                {
                    string username = ""; string password = ""; string senderid = ""; string mobileNo = ""; string gender = "";
                    string message = ""; string SrvcUrl = "";
                    string studentname = ""; string fathername = ""; string studentclass = "";
                    string paidamt = "";
                    username = "kpsschool";
                    password = "j1227";
                    senderid = "KPSKEM";
                    SrvcUrl = "http://onlinesmslogin.com/quicksms/api.php?";
                    //Session["SENDFEEMSG"];
                    studentname = lblname.Text.ToUpper();
                    fathername = lblfathername.Text.ToUpper();
                    studentclass = lblclass.Text.ToUpper();
                    gender = lblgender.Text.ToUpper();
                    if (gender.ToUpper() == "MALE")
                    {
                        gender = "Son";
                    }
                    else
                    {
                        gender = "Daughter";
                    }
                    mobileNo = txtfatherno.Value;
                    message = "Dear Parents, Your " + gender + " Name " + studentname + " Father Name " + fathername +
                                  " Studying " + studentclass + " is Paid Amount Rs: " + paid + " On " + DateTime.Now;
                    string URL = "http://onlinesmslogin.com/quicksms/api.php?" + "username=" + username + "&password=" + password + "&to=" + mobileNo + "&from=" + senderid + "&message=" + message;
                    //String result = GetPageContent("http://onlinesmslogin.com/quicksms/api.php?username=kpsschool&password=9347712208&to=mobileNo&from=xxxxxxxx&message=xxxxxxxxxxxx");
                    String result = GetPageContent(URL);
                    lblmsg.Text = "Saved Successfully";
                    lblmsg.CssClass = "success";
                    trsave.Visible = true;
                    btnprint.Visible = true;

                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }
    protected void idclear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("CollectStudentFee");
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
        finally
        {

        }
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("CollectStudentFee");
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
        finally
        {

        }
    }
    protected void btnprint_Click(object sender, EventArgs e)
    {
        try
        {
            objstudentvo = (StudentVOs)Session["SENDFEEMSG"];
            if (!String.IsNullOrEmpty(objstudentvo.student_online_no))
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('FeeReceiptPrint.aspx','null','height=600,width=900,scrollbars=1,status=yes,toolbar=no,menubar=1,location=no');</Script>", false);
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.Text = "errormsg";
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
#endregion