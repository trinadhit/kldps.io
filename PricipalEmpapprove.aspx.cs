using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using KLDSCHOOL_BL;
using System.IO;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class PricipalEmpapprove : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    EmployeeVOs objempvos = new EmployeeVOs();
    StudentVOs objstudent = new StudentVOs();
    StudentVOs.student student = new StudentVOs.student();
    protected void Page_Load(object sender, EventArgs e)
    {
        string empid = Request.QueryString["empid"];
        string Emporstd = Request.QueryString["Empstd"];
        // string Dob = Request.QueryString["Dob"];
        // BindDetails(username, Empstd, Dob);
        BindDetails(empid, Emporstd);
    }
    private void BindDetails(string empid, string emporstd)
    {
        DataSet ds = new DataSet();
        try
        {
            ds = student.GetEmpStudentDtlsforApproval(empid, emporstd);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                lblempid.Text = ds.Tables[0].Rows[0]["EMP_ID"].ToString();
                lblUsername.Text = ds.Tables[0].Rows[0]["USER_NAME"].ToString();
                lblfirstname.Text = ds.Tables[0].Rows[0]["FIRST_NAME"].ToString();
                lbllastname.Text = ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
                lblname.Text = lblfirstname.Text + ' ' + lbllastname.Text;
                lblDob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                lblGender.Text = ds.Tables[0].Rows[0]["GENDER"].ToString();
                lblQualification.Text = ds.Tables[0].Rows[0]["QUALIFICATION"].ToString();
                lblDesignation.Text = ds.Tables[0].Rows[0]["DESIGNATION"].ToString();
                lblSO.Text = ds.Tables[0].Rows[0]["FATHER_NAME"].ToString();
                lblAddress.Text = ds.Tables[0].Rows[0]["ADDRESS"].ToString();
                lblContactNo.Text = ds.Tables[0].Rows[0]["CONTACT_NO"].ToString();
                lblAadharno.Text = ds.Tables[0].Rows[0]["AADHAR_NUMBER"].ToString();
                byte[] photoByte;
                photoByte = ((byte[])ds.Tables[0].Rows[0]["EMP_PHOTO"]);
                // photoByte = ((byte[])ds1.Tables[0].Rows[0]["PHOTOIMAGE"]);
                HtmlImage imgPhoto = (HtmlImage)tblphoto.FindControl("imgPhoto");
                string photoImageName = lblname.Text + "_photo.jpg";
                displayImage(photoByte, photoImageName, imgPhoto);
            }
        }
        catch (Exception ex)
        {

        }
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
    //public void btnApprove_Click(object sender, EventArgs e)
    //{
    //    string output = "";
    //    try
    //    {
    //        string username = lblUsername.Text.Trim();
    //        string empid = lblempid.Text.Trim();

    //        output = student.ApproveStdRegform(username, empid, "E", "A");
    //        if (output == "Y")
    //        {
    //            lblmsg.Text = "Approved Done Successfully";
    //            lblmsg.CssClass = "success";
    //        }
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //    finally
    //    {

    //    }

    //}
}