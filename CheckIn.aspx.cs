using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data;
using MySql.Data.MySqlClient;

public partial class _checkIn : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        submitItemBtn.Click += new EventHandler(this.submitBtn_Click);
		submitReportBtn.Click += new EventHandler(this.submitBtn_Click);

    }

    void submitBtn_Click(object sender, EventArgs e)
    {
        MySqlConnection con = new MySqlConnection();
        //Grab the connection string from the web.config
        string cs = ConfigurationManager.ConnectionStrings["ConnectionStringAXLAF"].ConnectionString;
        con.ConnectionString = cs;
		
		try {
            con.Open();

			string query;

			if(checkedInList.SelectedValue == "Item") {
				query = "INSERT INTO Items (CheckedIn_Reported, Turned_Into, Item_Type, Item_Color, Location_Found, Item_Description, Stored_Location, Entered_By) VALUES ('"
					+ checkedInList.SelectedValue + "', '" + turnedInList.SelectedValue + "', '" + typeList.SelectedValue + "', '" + colorList.SelectedValue + "', '" + loc.Text.Replace("'", "").Replace("\"", "") + "', '" + des.Text.Replace("'", "").Replace("\"", "") + "', '" + storedLoc.Text.Replace("'", "").Replace("\"", "") + "', '" + HttpContext.Current.User.Identity.Name + "')";
			} else {
				query = "INSERT INTO Items (CheckedIn_Reported, Item_Type, Item_Color, Item_Description, Entered_By, Owner_Name, Owner_Contact_Info) VALUES ('"
					+ checkedInList.SelectedValue + "', '" + typeList.SelectedValue + "', '" + colorList.SelectedValue + "', '" + des.Text.Replace("'", "").Replace("\"", "") + "', '" + HttpContext.Current.User.Identity.Name + "', '" + ownName.Text.Replace("'", "").Replace("\"", "") + "', '" + contact.Text.Replace("'", "").Replace("\"", "") + "')";		
			}
		
		
            MySqlCommand cmd = new MySqlCommand(query, con);
            cmd.ExecuteNonQuery();


            query = "SELECT Item_ID FROM Items ORDER BY Item_ID DESC LIMIT 1";
            MySqlCommand Rcmd = new MySqlCommand(query, con);
            MySqlDataReader RqueryCommandReader = Rcmd.ExecuteReader();

            RqueryCommandReader.Read();
            string number = Convert.ToString(RqueryCommandReader["Item_ID"]);
            litTest.Text = "Item Added Successfuly. Item Id is " + number;
			
			//Reset DropDown 
			checkedInList.SelectedIndex = 0;
			turnedInList.SelectedIndex = 0;
			typeList.SelectedIndex = 0;
			typeList.SelectedIndex = 0;
			
			//Cleare TextBox's
			loc.Text = "";
			des.Text = "";
			storedLoc.Text = "";
			ownName.Text = "";
			contact.Text = "";
        }
        catch (MySqlException ex)
        {
            Console.Write(ex);
            litTest.Text = ex + "";
        }

        con.Close();
    }
	
}
