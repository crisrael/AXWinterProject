using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

public partial class admin_addUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Add Event Handler to submit button
        submitBtn.Click += new EventHandler(this.submitBtn_Click);

        //Check to see if a previous user was added
        string test = Request.QueryString["name"];

        if (!(Request.QueryString["name"] == null))
        {
            msgLit.Text = "<span style='color:green;'>User " + Request.QueryString["name"] + " was added successfully.</span>";
        }
    }

    public void ConnectionString()
    {
        MySqlConnection con = new MySqlConnection();
        //Grab the connection string from the web.config
        string cs = ConfigurationManager.ConnectionStrings["ConnectionStringAXLAF"].ConnectionString;
        con.ConnectionString = cs;
        MySqlCommand cmd = new MySqlCommand();

        try
        {
            con.Open();
            cmd.Connection = con;

            cmd.CommandText = "spRegisterUser";
            cmd.CommandType = CommandType.StoredProcedure;

            //Create the parameters to pass in
            cmd.Parameters.AddWithValue("UserName", userTxtBox.Text);
            //Pass the password and encrypt it with SHA1
            cmd.Parameters.AddWithValue("UserPass", FormsAuthentication.HashPasswordForStoringInConfigFile(passTxtBox.Text, "SHA1"));
            //Parameter for full name
            cmd.Parameters.AddWithValue("FullName", fullNameTxtBox.Text);
        }
        catch (MySqlException ex)
        {
            Console.WriteLine(ex);
        }

        if (Convert.ToBoolean(cmd.ExecuteScalar()))
            msgLit.Text = "<span style='color:red;'>User Name already in use, please choose another user name.</span>";
        else
            Response.Redirect("~/admin/addUser.aspx?name=" + userTxtBox.Text, true);

        con.Close();
    }
    
    public void submitBtn_Click(object sender, EventArgs args)
    {
        ConnectionString();
    }
}
