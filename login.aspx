<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>AXLAF</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="includes/styles/loginpage.css" rel="stylesheet"/>
</head>

<body>
    <div class="body"></div>
    <div class="grad"></div>
    <div class="header">
        <div>AX<span>LAF</span></div>
    </div>

    <br>

    <div class="login">
        <form class="form-signin" runat="server">
            <asp:RequiredFieldValidator ControlToValidate="userTxtBox" Text="Please Enter a Username" display="Dynamic" runat="server" />
            <asp:TextBox ID="userTxtBox" runat="server" placeholder="username" CssClass="form-control" name="userName"></asp:TextBox>
            <asp:TextBox ID="passTxtBox" runat="server" placeholder="password" TextMode="Password" CssClass="form-control" ></asp:TextBox>
            <asp:Literal ID="msgLit" runat="server"></asp:Literal>

            <div class="checkbox">
                    <label><asp:CheckBox ID="rememberLoginChkBox" runat="server" />Remember Me</label>
            </div>
            <asp:Button ID="loginBtn" runat="server" Text="Sign In" CssClass="loginButton" OnClick="loginBtn_Click"/>
        </form>
    </div>

</body>
</html>
