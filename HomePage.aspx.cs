using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KLDSCHOOL_BL;
public partial class HomePage : System.Web.UI.Page
{
    EmployeeVOs empvos = new EmployeeVOs();
    StudentVOs stdvo = new StudentVOs();
    protected void Page_Load(object sender, EventArgs e)
    {
        //TO Clear Login 
        try
        {
            if (Session["EMPUSER"] != null || Session["STUDENTUSER"] != null)
            {
                if (!IsPostBack)
                {
                    empvos = (EmployeeVOs)Session["EMPUSER"];
                    stdvo = (StudentVOs)Session["STUDENTUSER"];
                   
                }
            }
        }
        catch (Exception ex)
        {
            
        }

    }
}


