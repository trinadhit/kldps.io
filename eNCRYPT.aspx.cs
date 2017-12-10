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
using System.Text;

public partial class eNCRYPT : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["schoolstring"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    //private const string strconneciton = "Data Source=MYCBJ017550027;Initial Catalog=MySamplesDB;Integrated Security=True";
    //SqlConnection con = new SqlConnection(strconneciton);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindencryptedData();
            BindDecryptedData();
        }
    }
    /// <summary>
    /// btnSubmit event is used to insert user details with password encryption
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strpassword = Encryptdata(txtPassword.Text);
       con= new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into SampleUserdetails(UserName,Password,FirstName,LastName) values('" + txtname.Text + "','" + strpassword + "','" + txtfname.Text + "','" + txtlname.Text + "')", con);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        con.Close();
        BindencryptedData();
        BindDecryptedData();
    }
    /// <summary>
    /// Bind user Details to gridview
    /// </summary>
    protected void BindencryptedData()
    {
       con= new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from SampleUserdetails", con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvUsers.DataSource = ds;
        gvUsers.DataBind();
        con.Close();
    }
    /// <summary>
    /// Bind user Details to gridview
    /// </summary>
    protected void BindDecryptedData()
    {
        con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from SampleUserdetails", con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvdecryption.DataSource = ds;
        gvdecryption.DataBind();
        con.Close();
    }
    /// <summary>
    /// Function is used to encrypt the password
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    private string Encryptdata(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        return strmsg;
    }
    /// <summary>
    /// Function is used to Decrypt the password
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    private string Decryptdata(string encryptpwd)
    {
        string decryptpwd = string.Empty;
        UTF8Encoding encodepwd = new UTF8Encoding();
        Decoder Decode = encodepwd.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
        int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        decryptpwd = new String(decoded_char);
        return decryptpwd;
    }
    /// <summary>
    /// rowdatabound condition is used to change the encrypted password format to decryption format
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvdecryption_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string decryptpassword = e.Row.Cells[2].Text;
            e.Row.Cells[2].Text = Decryptdata(decryptpassword);
        }
    }
}