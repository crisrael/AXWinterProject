using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //If the user is refreshing the login page or redirecting to it, clear the form
            //Response.Redirect("login.aspx", true);
        }
    }

    protected void loginBtn_Click(object sender, EventArgs e)
    {
        if (AuthenticateUser(userTxtBox.Text, passTxtBox.Text))
            FormsAuthentication.RedirectFromLoginPage(userTxtBox.Text, rememberLoginChkBox.Checked);
        else
            msgLit.Text = "<span style='color:red'>Incorrect Username and/or Password!</span>";
    }

    public bool AuthenticateUser(string userName, string password) {
        MySqlConnection con = new MySqlConnection();
        //Grab the connection string from the web.config
        string cs = ConfigurationManager.ConnectionStrings["ConnectionStringAXLAF"].ConnectionString;
        con.ConnectionString = cs;
        MySqlCommand cmd = new MySqlCommand();

        try {
            con.Open();
            cmd.Connection = con;

            cmd.CommandText = "spAuthenticateUser";
            cmd.CommandType = CommandType.StoredProcedure;

            //Create the parameters to pass in
            cmd.Parameters.AddWithValue("UserName", userName);
            //Pass the password and encrypt it with SHA1
            cmd.Parameters.AddWithValue("UserPass", FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1"));

            //Excute the procedure and get a result

            
        } catch (MySqlException ex) {
            Console.WriteLine(ex);
        }

        return Convert.ToBoolean(cmd.ExecuteScalar());
    }
}
