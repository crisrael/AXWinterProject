using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class admin_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Only the admin account has access to the admin tools
        if (HttpContext.Current.User.Identity.Name == "Admin")
            adminToolsLink.Visible = true;
    }

    public void logoutLink_OnClick(object sender, EventArgs args)
    {
        //Sign the user out
        FormsAuthentication.SignOut();
        Response.Redirect(ResolveUrl("~/login.aspx"));
    }
}
