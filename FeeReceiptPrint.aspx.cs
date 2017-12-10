using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class FeeReceiptPrint : System.Web.UI.Page
{
    StudentVOs objstudent = new StudentVOs();
    StudentVOs.student student = new StudentVOs.student();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SENDFEEMSG"] != null)
        {
            if (!IsPostBack)
            {

                objstudent = (StudentVOs)Session["SENDFEEMSG"];
                objstudent.student_online_no = ((StudentVOs)(Session["SENDFEEMSG"])).student_online_no;
                BindDetails(objstudent.student_online_no,null);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<Script>window.close();</Script>", false);
        }
    }
    private void BindDetails(string student_online_no,string receipt)
    {
        DataSet ds = new DataSet();
        try
        {
            ds = student.GetStudentDtlsforPrint(student_online_no,null);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                lblAdmissionno.Text = ds.Tables[0].Rows[0]["ADMISSION_NO"].ToString();
                lblonlineno.Text = ds.Tables[0].Rows[0]["STUDENT_ONLINE_NO"].ToString();
                lblfirstname.Text = ds.Tables[0].Rows[0]["FIRST_NAME"].ToString();
                lbllastname.Text = ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
                lblname.Text = lblfirstname.Text + ' ' + lbllastname.Text;
               // lblDob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
               // lblGender.Text = ds.Tables[0].Rows[0]["GENDER"].ToString();
                lblClass.Text = ds.Tables[0].Rows[0]["CLASS"].ToString();
                lblFathername.Text = ds.Tables[0].Rows[0]["FATHER_NAME"].ToString();
               // lblMothername.Text = ds.Tables[0].Rows[0]["MOTHER_NAME"].ToString();
                //lblContactNo.Text = ds.Tables[0].Rows[0]["FATHER_CONTACT_NO"].ToString();
                lbltotalamount.Text = ds.Tables[0].Rows[0]["NEED_TO_PAYFEE"].ToString();
                lblpaidamount.Text = ds.Tables[0].Rows[0]["THIS_TIME_COLLCTED_FEE"].ToString();
                lblasofnowtotalcollectedfee.Text = ds.Tables[0].Rows[0]["TOTAL_COLLECTED_FEE"].ToString(); 
                lblremainingamount.Text = ds.Tables[0].Rows[0]["TOTAL_PENDING_FEE"].ToString();
                lblcollectedtd.Text = DateTime.Now.Date.ToString("dd-MM-yyyy");
                //byte[] photoByte;
                //photoByte = ((byte[])ds.Tables[0].Rows[0]["STUDENT_IMAGE"]);
                //// photoByte = ((byte[])ds1.Tables[0].Rows[0]["PHOTOIMAGE"]);
                //HtmlImage imgPhoto = (HtmlImage)tblphoto.FindControl("imgPhoto");
                //string photoImageName = lblname.Text + "_photo.jpg";
                //displayImage(photoByte, photoImageName, imgPhoto);
            }
        }
        catch (Exception ex)
        {
            
        }
    }
    //public static void displayImage(byte[] photoByte, string strFileName, System.Web.UI.HtmlControls.HtmlImage imgBox)
    //{
    //    if (photoByte != null && photoByte.Length > 1)
    //    {
    //        System.Drawing.Image imgPhoto;
    //        string temp_Folder = "~/Temporary_Photos";
    //        string temp_PathForSaveImg = System.Web.HttpContext.Current.Server.MapPath(temp_Folder);
    //        using (MemoryStream stream = new MemoryStream(photoByte))
    //        {
    //            FileInfo file = new FileInfo(temp_PathForSaveImg + "\\" + strFileName);
    //            imgPhoto = System.Drawing.Image.FromStream(stream);
    //            if (file.Exists)
    //            {
    //                file.Delete();
    //            }
    //            imgPhoto.Save(temp_PathForSaveImg + "\\" + strFileName);

    //            imgBox.Attributes.Add("src", temp_Folder + "/" + strFileName);
    //        }
    //    }
    //}
}