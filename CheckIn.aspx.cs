using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        submitBtn.Click += new EventHandler(this.submitBtn_Click);
    }

    void submitBtn_Click (object sender, EventArgs e)
    {
        string turnedIn = "Nope";

        if (!string.IsNullOrEmpty(Request.Form["turnedInList"]))
        {
            turnedIn = Request.Form["turnedInList"];
        }

        litTest.Text = "Successful";
    }
}