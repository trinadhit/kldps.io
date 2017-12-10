using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using KLDSCHOOL_BL;
using System.Web.UI.HtmlControls;
public partial class EnterStudentMarks : System.Web.UI.Page
{
    EmployeeVOs empvo = new EmployeeVOs();
    StudentVOs studentvo = new StudentVOs();
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
                    Response.Redirect("Login.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    //protected void txtonlineno_TextChanged1(object sender, EventArgs e)
    //{
    //    DataSet ds = new DataSet();
    //    try
    //    {
    //        string studentonlineno = txtonlineno.Text;
    //        ds = student.GetStudentDtlsForEnterMarks(studentonlineno);

    //    }
    //    catch (Exception ex)
    //    {
    //        //lblmsg.Text = ex.Message;
    //    }
    //}
    protected void btngetdetails_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        try
        {
            string studentonlineno = idtxtonlineno.Value;
            ds = student.GetStudentDtlsForEnterMarks(studentonlineno);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                gvEnterStudentMarks.DataSource = ds;
                gvEnterStudentMarks.DataBind();
                lblonlineno.Text = ds.Tables[0].Rows[0]["USER_NAME"].ToString();
                lblname.Text = ds.Tables[0].Rows[0]["NAME"].ToString();
                lblfathername.Text = ds.Tables[0].Rows[0]["FATHER_NAME"].ToString();
                lbldob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                lblgender.Text = ds.Tables[0].Rows[0]["GENDER"].ToString();
                tbldata.Visible = true;
                trsave.Visible = true;
                btngetdetails.Disabled = true;
                ViewState["dsstudentdata"] = ds;
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
    //protected void txtonlineno_TextChanged1(object sender, EventArgs e)
    //{
    //    DataSet ds = new DataSet();
    //    try
    //    {
    //        string studentonlineno = txtonlineno.Text;
    //        ds = student.GetStudentDtlsForEnterMarks(studentonlineno);
    //        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
    //        {
    //            gvEnterStudentMarks.DataSource = ds;
    //            gvEnterStudentMarks.DataBind();
    //            trgvEnterStudentMarks.Visible = true;
    //            trsave.Visible = true;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        lblmsg.Text = ex.Message;
    //        trgvEnterStudentMarks.Visible = false;
    //    }
    //}
    protected void gvEnterStudentMarks_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {

        }
    }

    protected void gvEnterStudentMarks_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //GridViewRow gvrow = (GridViewRow)gvEnterStudentMarks.FindControl("txtMARKS");
                //// gvrow.Attributes.Add();
                ////amount.Attributes.Add("onKeyPress", "javascript:return ValidateNumberWithoutSpace();");
                //gvrow.Attributes.Add("onKeyPress", "javascript:return isNumber(event);");
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void idsubmit_Click(object sender, EventArgs e)
    {
        decimal marks = 0;
        try
        {
            List<StudentVOs> listudentmarks = new List<StudentVOs>();
            if (trgvEnterStudentMarks.Visible == true)
            {

                foreach (GridViewRow gvrow in gvEnterStudentMarks.Rows)
                {
                    int i = gvrow.RowIndex;
                    StudentVOs objstudent = new StudentVOs();
                   // TextBox txt1 = (TextBox)gvEnterStudentMarks.Rows[i].FindControl("txtMARKS");
                    string  txt1 = ((HtmlInputText)gvEnterStudentMarks.Rows[i].FindControl("txtMARKS")).Value;
                    //string subject = gvEnterStudentMarks.Rows[i].FindControl("txtMARKS").ToString();
                    string subject = gvEnterStudentMarks.Rows[i].Cells[2].Text;
                    objstudent.subjectname = subject;
                    if (subject.ToUpper() == "CHEMISTRY")
                    {
                        marks = Convert.ToDecimal(txt1);
                        objstudent.marks = marks;
                    }
                    if (subject.ToUpper() == "ENGLISH")
                    {
                        marks = Convert.ToDecimal(txt1);
                        objstudent.marks = marks;
                    }
                    if (subject.ToUpper() == "HINDHI")
                    {
                        marks = Convert.ToDecimal(txt1);
                        objstudent.marks = marks;
                    }

                    if (subject.ToUpper() == "MATHEMATICS")
                    {
                        marks = Convert.ToDecimal(txt1);
                        objstudent.marks = marks;
                    }
                    if (subject.ToUpper() == "PHYSICS")
                    {
                        marks = Convert.ToDecimal(txt1);
                        objstudent.marks = marks;
                    }
                    if (subject.ToUpper() == "PHYSICS")
                    {
                        marks = Convert.ToDecimal(txt1);
                        objstudent.marks = marks;
                    }
                    if (subject.ToUpper() == "TELUGU")
                    {
                        marks = Convert.ToDecimal(txt1);
                        objstudent.marks = marks;
                    }
                    objstudent.student_USER_NAME = lblonlineno.Text.ToUpper();
                    listudentmarks.Add(objstudent);
                }
                string output = student.InsertStudentMarks(listudentmarks);
                if(output=="Y")
                {
                    lblmsg.Text = "Saved Successfully";
                    lblmsg.CssClass = "textcolor";
                }
                else
                {
                    lblmsg.Text = "Data Not Saved Successfully";
                    lblmsg.CssClass = "errormsg";
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
    protected void idclear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("EnterStudentMarks.aspx");
        }
        catch (Exception ex)
        {

        }
    }



    protected void gvEnterStudentMarks_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds1 = new DataSet();
            ds1 = (DataSet)ViewState["dsstudentdata"];
            gvEnterStudentMarks.DataSource = ds1;
            gvEnterStudentMarks.PageIndex = e.NewPageIndex;
            gvEnterStudentMarks.DataBind();

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }

    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        try
        {
            idtxtonlineno.Value = "";
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            lblmsg.CssClass = "errormsg";
        }
    }
}