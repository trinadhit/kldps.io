using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
using System.IO;

public partial class EmpRegForm : System.Web.UI.Page
{
    EmployeeVOs objempvos = new EmployeeVOs();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["EMPUSER"] != null)
                {
                    objempvos = (EmployeeVOs)Session["EMPUSER"];
                    txtidaadhar1.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    txtidaadhar2.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    txtidaadhar3.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    txtidaadhar1.Attributes.Add("onKeyUp", "javascript:return Adharcontrol(this,'" + txtidaadhar1.ClientID + "','" + txtidaadhar2.ClientID + "','" + txtidaadhar3.ClientID + "');");
                    txtidaadhar2.Attributes.Add("onKeyUp", "javascript:return Adharcontrol(this,'" + txtidaadhar1.ClientID + "','" + txtidaadhar2.ClientID + "','" + txtidaadhar3.ClientID + "');");

                    txtdd.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    txtmm.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    txtyyyy.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                    txtdd.Attributes.Add("onKeyUp", "javascript:return Adharcontrol(this,'" + txtdd.ClientID + "','" + txtmm.ClientID + "','" + txtyyyy.ClientID + "');");
                    txtmm.Attributes.Add("onKeyUp", "javascript:return Adharcontrol(this,'" + txtdd.ClientID + "','" + txtmm.ClientID + "','" + txtyyyy.ClientID + "');");
                    txtdd.Attributes.Add("onblur", "Javascript:return validateDate('" + txtdd.ClientID + "','" + txtmm.ClientID + "','" + txtyyyy.ClientID + "');");
                    txtmm.Attributes.Add("onblur", "Javascript:return validateDate('" + txtdd.ClientID + "','" + txtmm.ClientID + "','" + txtyyyy.ClientID + "');");
                    txtyyyy.Attributes.Add("onblur", "Javascript:return validateDate('" + txtdd.ClientID + "','" + txtmm.ClientID + "','" + txtyyyy.ClientID + "');");
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string output = ""; string usernameout = ""; string empid = ""; int fileSize = 0;
        try
        {
            int valid = 0;
            if (valid == 0)
            {
                objempvos.USER_NAME = txtusername.Value;
                objempvos.FIRST_NAME = txtname.Value;
                objempvos.LAST_NAME = txtsurname.Value;
                objempvos.fatherorhusname = txtfather1.Value;
                objempvos.GENDER = Request.Form["gender"];
                objempvos.dob = txtmm.Value + "/" + txtdd.Value + "/" + txtyyyy.Value;
                //objempvos.qualification = Request.Form["ddlqlyname"];
                //objempvos.DEGIGNATION = Request.Form["ddldesignationname1"];
                objempvos.qualification = ddlqly.Value;
                objempvos.DEGIGNATION = ddldesignationname.Value;
                if (objempvos.DEGIGNATION.ToUpper() == "P")
                {
                    objempvos.ROLE_CODE = 1;
                }
                else
                {
                    objempvos.ROLE_CODE = 2;
                }
                objempvos.ADDRESS = txtaddress.Value;
                objempvos.MOBILE_NO = txtcontactno.Value;
                objempvos.emergencymobileno = txtemergencycontactno.Value;
               //objempvos.email = txtemail.Value;
                objempvos.AADHARNUMBER = txtidaadhar1.Value + "-" + txtidaadhar2.Value + "-" + txtidaadhar3.Value;
                if (imageupload.HasFile)
                {
                    HttpPostedFile postedFile = imageupload.PostedFile;
                    string filename = Path.GetFileName(postedFile.FileName);
                    string fileExtension = Path.GetExtension(filename);
                    fileSize = postedFile.ContentLength;
                    if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                    {
                        if (fileSize >= 1048576)
                        {
                            lblmsg.Text = "Your file was not uploaded because " + "it exceeds the 2 MB size limit." + "</br>";
                            lblmsg.Text += "Your Uploaded File Size was - " + fileSize;
                            lblmsg.CssClass = "error";
                        }
                        else
                        {
                            Stream stream = postedFile.InputStream;
                            BinaryReader binaryReader = new BinaryReader(stream);
                            objempvos.bytes = binaryReader.ReadBytes((int)stream.Length);
                        }

                    }
                    else
                    {
                        lblmsg.Text = "Please Upload .Jpg or .gif or .png or .bmp format file";
                        lblmsg.CssClass = "errormsg";
                        return;
                    }
                }
                else
                {
                    lblmsg.Text = "Please Upload Student Photo";
                    lblmsg.CssClass = "errormsg";
                    return;
                }
                //Session["EMPUSER"] = objempvos;
                output = objempvos.InsertEmpUserForm(objempvos, out output, out usernameout, out empid);
                objempvos.empid = empid;
                Session["EMP_ID"] = objempvos.empid;
                if (output == "Y")
                {
                    lblmsg.Text = "Saved Successfully" + "</br>";
                    lblmsg.Text += "User Name " + usernameout + " And Your Online Employee Id No." + empid;
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    btnprint.Visible = true;
                    btnsubmit.Disabled = true;
                }
                else
                {

                    lblmsg.Text = "User Id Already Exists";
                    lblmsg.ForeColor = System.Drawing.Color.Green;

                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("EmpRegForm.aspx");
            btnprint.Visible = false;
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.Text = "errormsg";
        }
    }
    protected void btnprint_Click(object sender, EventArgs e)
    {
        try
        {
            objempvos.empid = Session["EMP_ID"].ToString();
            if (!String.IsNullOrEmpty(objempvos.empid))
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.open('EmpRegFormPrint.aspx','null','height=800,width=1200,scrollbars=1,status=yes,toolbar=no,menubar=1,location=no');</Script>", false);
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.Text = "errormsg";
        }
    }
}