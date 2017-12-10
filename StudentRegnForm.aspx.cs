using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
using System.IO;
public partial class StudentRegnForm : System.Web.UI.Page
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
                    txtidaadhar1.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    txtidaadhar2.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    txtidaadhar3.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    txtidaadhar1.Attributes.Add("onKeyUp", "javascript:return Adharcontrol(this,'" + txtidaadhar1.ClientID + "','" + txtidaadhar2.ClientID + "','" + txtidaadhar3.ClientID + "');");
                    txtidaadhar2.Attributes.Add("onKeyUp", "javascript:return Adharcontrol(this,'" + txtidaadhar1.ClientID + "','" + txtidaadhar2.ClientID + "','" + txtidaadhar3.ClientID + "');");

                    idtxtdd.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    idtxtmm.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    idtxtyyyy.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    idtxtdd.Attributes.Add("onKeyUp", "javascript:return Adharcontrol(this,'" + idtxtdd.ClientID + "','" + idtxtmm.ClientID + "','" + idtxtyyyy.ClientID + "');");
                    idtxtmm.Attributes.Add("onKeyUp", "javascript:return Adharcontrol(this,'" + idtxtdd.ClientID + "','" + idtxtmm.ClientID + "','" + idtxtyyyy.ClientID + "');");
                    idtxtdd.Attributes.Add("onblur", "Javascript:return validateDate('" + idtxtdd.ClientID + "','" + idtxtmm.ClientID + "','" + idtxtyyyy.ClientID + "');");
                    idtxtmm.Attributes.Add("onblur", "Javascript:return validateDate('" + idtxtdd.ClientID + "','" + idtxtmm.ClientID + "','" + idtxtyyyy.ClientID + "');");
                    idtxtyyyy.Attributes.Add("onblur", "Javascript:return validateDate('" + idtxtdd.ClientID + "','" + idtxtmm.ClientID + "','" + idtxtyyyy.ClientID + "');");
                   
                    
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

    protected void btnsumbit_Click(object sender, EventArgs e)
    {
        string output = "";       string userout = ""; string outstudentonlieno = "";
        lblmsg.Text = "";
        try
        {
            objstudentvo.admissionno = txtAdmissionno.Value;
            objstudentvo.student_USER_NAME = idusername.Value;
            objstudentvo.student_FIRST_NAME = idtxtfirstname.Value;
            objstudentvo.student_LAST_NAME = idtxtlname.Value;
            if (String.IsNullOrEmpty(idtxtmm.Value) && String.IsNullOrEmpty(idtxtdd.Value) && String.IsNullOrEmpty(idtxtyyyy.Value))
            {
                objstudentvo.STUDENT_dob = null;
            }
            else
            {
                objstudentvo.STUDENT_dob = idtxtmm.Value + "/" + idtxtdd.Value + "/" + idtxtyyyy.Value;
            }
            // objstudentvo.STUDENT_dob = idtxtmm.Value + "/" + idtxtdd.Value + "/" + idtxtyyyy.Value;
            objstudentvo.STUDENT_GENDER = Request.Form["gender"];
            //objstudentvo.STUDENT_CLASS = Request.Form["ddlclassname"];
            objstudentvo.STUDENT_CLASS = idddlclass.Value;
            objstudentvo.student_father_NAME = idtxtfathername.Value;
            objstudentvo.student_MOTHER_NAME = idtxtmothername.Value;
            objstudentvo.brothersisnamr = txtbrosisname.Value;
            objstudentvo.caste = txtcaste.Value;
            objstudentvo.parentsoccupation = txtParentsOccupation.Value;
            objstudentvo.STUDENT_ADDRESS = idtxtaddress.Value;
            objstudentvo.STUDENT_FATHER_NO = txtidcontactno.Value;
            // objstudentvo.aadharno = txtidaadhar1.Value +"-"+ txtidaadhar1.Value +"-"+ txtidaadhar3.Value;
            if (String.IsNullOrEmpty(txtidaadhar1.Value) && String.IsNullOrEmpty(txtidaadhar2.Value) && String.IsNullOrEmpty(txtidaadhar3.Value))
            {
                objstudentvo.aadharno = null;
            }
            else
            {
                objstudentvo.aadharno = txtidaadhar1.Value + "-" + txtidaadhar2.Value + "-" + txtidaadhar3.Value;
            }
            objstudentvo.TOTAL_FEE = Convert.ToDecimal(txttotalfee.Value);
            objstudentvo.lastyeardue = Convert.ToDecimal(txtlastyeardue.Value);
            objstudentvo.EXEMPTED_FEE = Convert.ToDecimal(txtexemptedfee.Value);
            objstudentvo.NEED_TO_PAYFEE = Convert.ToDecimal(txtneedtopay.Value);

            //objstudentvo.TOTAL_FEE = Convert.ToDecimal(Request.Form["txttotalfee"]);
            //objstudentvo.EXEMPTED_FEE =Convert.ToDecimal(Request.Form["txtexemptedfee"]);
            //objstudentvo.NEED_TO_PAYFEE = Convert.ToDecimal(Request.Form["txtneedtopay"]);

            //objstudentvo.STUDENT_CLASS = idddlclass.Value;
            //objstudentvo.STUDENT_FATHER_NO = idtxtfno.Value;
            //objstudentvo.STUDENT_MOTHER_NO = idtxtmno.Value;
            //objstudentvo.STUDENT_pincode = idtxtpincode.Value;
            //objstudentvo.STUDENT_email = txtemail.Value;
            //    if (imageupload.HasFile)
            //    {
            //        HttpPostedFile postedFile = imageupload.PostedFile;
            //        string filename = Path.GetFileName(postedFile.FileName);
            //        string fileExtension = Path.GetExtension(filename);
            //        int fileSize = postedFile.ContentLength;
            //        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
            //        {
            //            Stream stream = postedFile.InputStream;
            //            BinaryReader binaryReader = new BinaryReader(stream);
            //            objstudentvo.bytes = binaryReader.ReadBytes((int)stream.Length);

            //        }
            //        else
            //        {
            //            lblmsg.Text = "Upload Only Jpg,gif,png,bmp ";
            //            lblmsg.CssClass = "errormsg";
            //            return;
            //        }
            //        student.InsertStudentRegnForm(objstudentvo, out output, out userout,out outstudentonlieno);
            //        objstudentvo.student_online_no = outstudentonlieno;
            //        Session["STUDENT_ONLINE_NO"] = objstudentvo.student_online_no;
            //       // Session["studentdata"] = objstudentvo;
            //       // System.Threading.Thread.Sleep(5000);
            //        if (output == "Y")
            //        {
            //            lblmsg.Text += "Saved Successfully</br> ";
            //            lblmsg.Text += "Your User Name : " + userout +" And Online Student NO. "+ outstudentonlieno;
            //            lblmsg.CssClass = "success";
            //            btnprint.Visible = true;
            //            btnsumbit.Disabled = true;
            //        }
            //    }
            //    else
            //    {
            //        lblmsg.Text = "Please Upload Student Photo";
            //        lblmsg.CssClass = "errormsg";

            //    }
            //}
            string filename = ""; string fileExtension = "";
            HttpPostedFile postedFile = imageupload.PostedFile;
            if(!String.IsNullOrEmpty(postedFile.ToString()))
            {
                filename = Path.GetFileName(postedFile.FileName);
                fileExtension = Path.GetExtension(filename);
                int fileSize = postedFile.ContentLength;
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                objstudentvo.bytes = binaryReader.ReadBytes((int)stream.Length);
            }
            
            if (imageupload.HasFile)
            {
                if (fileExtension.ToLower() != ".jpg" || fileExtension.ToLower() != ".gif" || fileExtension.ToLower() != ".png" || fileExtension.ToLower() == ".bmp")
                {
                    lblmsg.Text = "Upload Only Jpg,gif,png,bmp ";
                    lblmsg.CssClass = "errormsg";
                    return;
                }
            }
            student.InsertStudentRegnForm(objstudentvo, out output, out userout, out outstudentonlieno);
            objstudentvo.student_online_no = outstudentonlieno;
            Session["STUDENT_ONLINE_NO"] = objstudentvo.student_online_no;
            // Session["studentdata"] = objstudentvo;
            // System.Threading.Thread.Sleep(5000);
            if (output == "Y")
            {
                lblmsg.Text += "Saved Successfully</br> ";
                lblmsg.Text += "Your User Name : " + userout + " And Online Student NO. " + outstudentonlieno;
                lblmsg.CssClass = "success";
                btnprint.Visible = true;
                btnsumbit.Disabled = true;
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void btnprint_Click(object sender, EventArgs e)
    {
        try
        {
            objstudentvo.student_online_no = Session["STUDENT_ONLINE_NO"].ToString();
           // objstudentvo = (StudentVOs)Session["studentdata"];
            if (!string.IsNullOrEmpty(objstudentvo.student_online_no))
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('StudentRegFormPrint.aspx','null','height=600,width=900,scrollbars=1,status=yes,toolbar=no,menubar=1,location=no');</Script>", false);
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.Text = "errormsg";
        }
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("studentregnform.aspx");
            btnprint.Visible = false;
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.Text = "errormsg";
        }
    }
}