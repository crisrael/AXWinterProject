using System;
using System.Data;
using System.Configuration;
using System.Web.Security;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Collections;
using System.Web.UI.WebControls;
using System.Web;

public partial class _checkOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        submitBtn.Click += new EventHandler(this.submitBtn_Click);

        if (IsPostBack) {}
    }

    public void claimItem(string itemID) {
        string query = "UPDATE items SET Item_Claimed = True, CheckedOut_By = '" + HttpContext.Current.User.Identity.Name + "' WHERE Item_ID = " + itemID;

        string cs = ConfigurationManager.ConnectionStrings["ConnectionStringAXLAF"].ConnectionString;

        using (MySqlConnection con = new MySqlConnection(cs))
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(query, con);

            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

    public void deleteItem(string itemID) {
        string query = "DELETE FROM items WHERE Item_ID = " + itemID;

        string cs = ConfigurationManager.ConnectionStrings["ConnectionStringAXLAF"].ConnectionString;

        using (MySqlConnection con = new MySqlConnection(cs))
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(query, con);

            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

    protected void itemListRep_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        switch (e.CommandName)
        {
            case "checkOutItem":
                claimItem(e.CommandArgument.ToString());
                Response.Redirect(Request.RawUrl);
                break;
            case "deleteItem":
                deleteItem(e.CommandArgument.ToString());
                Response.Redirect(Request.RawUrl);
                break;
            default:
                break;
        }

    }

    public void submitBtn_Click(object sender, EventArgs e)
    {
        //Run Query Builder
        openConnection(queryBuilder());
    }

    public void openConnection (string query) {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionStringAXLAF"].ConnectionString;

        //litTest.Text = query;

        using (MySqlConnection con = new MySqlConnection(cs))
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataAdapter daItems = new MySqlDataAdapter(query, con);
            DataSet dsItems = new DataSet();

            daItems.Fill(dsItems);
            con.Close();

            itemListRep.DataSource = dsItems;
            itemListRep.DataBind();
        }
    }

    enum BooleanAliases { Yes = 1, No = 0 } //Used for converting yes to true and no to false

    public string queryBuilder()
    {
        
        ArrayList sqlBuilder = new ArrayList();

        string sql = "SELECT * FROM ITEMS "
            + "JOIN Users on User_Name = Entered_By WHERE Item_Claimed = " + Convert.ToBoolean(Enum.Parse(typeof(BooleanAliases), claimedList.SelectedValue));

        if (!checkedInList.SelectedValue.Equals("All"))
            sqlBuilder.Add("CheckedIn_Reported = '" + checkedInList.SelectedValue + "' ");
        if (!typeList.SelectedValue.Equals("All"))
            sqlBuilder.Add("Item_Type = '" + typeList.SelectedValue + "' ");
        if (!colorList.SelectedValue.Equals("All"))
            sqlBuilder.Add("Item_Color = '" + colorList.SelectedValue + "' ");
        if (!keywordsTxtBox.Text.Equals(""))
            sqlBuilder.Add("(Item_Description like ('%" + keywordsTxtBox.Text + "%') or Item_Type like ('%" + keywordsTxtBox.Text + "%') or Item_ID like ('%" + keywordsTxtBox.Text + "%')) ");
		if(!(startTimeTxtBox.Text.Equals("") && endTimeTxtBox.Text.Equals("")))
			sqlBuilder.Add(" Item_TimeStamp BETWEEN STR_TO_DATE('" + startTimeTxtBox.Text + "', '%c/%e/%Y %r') AND STR_TO_DATE('" + endTimeTxtBox.Text + "', '%c/%e/%Y %r') ");
        for (int i = 0; i < sqlBuilder.Count; i++)
            sql += " And " + sqlBuilder[i];
		
		sql += " Order by Item_ID desc";

        return sql;
    }	
}
