using System;
using System.Data;
using System.Configuration;
using System.Web.Security;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Collections;

public partial class admin_removeUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Add Event Handler to submit button
        submitBtn.Click += new EventHandler(this.submitBtn_Click);

        if (!IsPostBack)
        {
            populateUserList();

            #region Ajax methods
            if (Request.Form["MethodName"] == "deleteUser")
            {
                deleteUser_Click(Request.Form["userName"]);
                return;
            }
            #endregion
        }
    }

    protected void populateUserList()
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionStringAXLAF"].ConnectionString;
        MySqlConnection con = new MySqlConnection(cs);
        con.Open();

        string Ssql = "Select * from Users";

        MySqlDataAdapter daUsers = new MySqlDataAdapter(Ssql, con);

        DataSet dsUsers = new DataSet();

        daUsers.Fill(dsUsers);

        con.Close();

        userListRep.DataSource = dsUsers;
        userListRep.DataBind();
    }

    public void deleteUser_Click(string userName)
    {
        //Delete User Query
        string query = "DELETE FROM Users WHERE User_Name = '" + userName + "' ";
        openConnection(query);
    }

    public void submitBtn_Click(object sender, EventArgs e)
    {
        //Change Password query
        string query = "UPDATE Users SET User_Pass = '" + FormsAuthentication.HashPasswordForStoringInConfigFile(newPassTxtBox.Text, "SHA1") + "' WHERE User_Name = '" + Request["userName"] + "'";
        openConnection(query);
    }

    private void openConnection(string query)
    {
        //Grab the connection string from the web.config
        string cs = ConfigurationManager.ConnectionStrings["ConnectionStringAXLAF"].ConnectionString;

        using (MySqlConnection con = new MySqlConnection(cs)) {
            con.Open();
            
            MySqlCommand cmd = new MySqlCommand(query, con);

            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
