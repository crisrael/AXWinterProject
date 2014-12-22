<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckIn.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check In</title>

     <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Latest compiled and minified Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />

    <link rel="stylesheet" href="includes/styles/mainSite.css" />

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Latest compiled and minified Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <script src="<%=ResolveClientUrl("~/includes/scripts/liveClock.js") %>" type="text/javascript" ></script>

</head>
<body>
    <!-- Include Menu -->
    <!-- #include virtual = menu.html -->
    
    <div class="container">
      <h2>AXIS Lost and Found, Items Received </h2>
      <p><span style="color:red;">* Required</span></p>
      <form name="checkInForm" method="post"  action="CheckIn.aspx" runat="server" role="form">
          <label>Turned Into: <span style="color:red;">*</span></label>
          <span style="color:red;"><asp:RequiredFieldValidator ControlToValidate="turnedInList" Text="The Turned Into field is required!" runat="server" /></span>
            <asp:DropDownList ID="turnedInList" runat="server" CssClass="form-control dropdown">
                <asp:ListItem>Info HQ</asp:ListItem>
                <asp:ListItem>South Hall</asp:ListItem>
                <asp:ListItem>West Hall</asp:ListItem>
            </asp:DropDownList>
          <br />
          <label>Type: <span style="color:red;">*</span></label>
          <span style="color:red;"><asp:RequiredFieldValidator ControlToValidate="typeList" Text="The Type field is required!" runat="server" /></span>
          <asp:DropDownList ID="typeList" runat="server" CssClass="form-control dropdown">
              <asp:ListItem>Badges</asp:ListItem>
              <asp:ListItem>ID/Cards</asp:ListItem>
              <asp:ListItem>Phones</asp:ListItem>
              <asp:ListItem>Electronics</asp:ListItem>
              <asp:ListItem>Wallets</asp:ListItem>
              <asp:ListItem>Cameras</asp:ListItem>
              <asp:ListItem>Keys</asp:ListItem>
              <asp:ListItem>Glasses/Sunglasses</asp:ListItem>
              <asp:ListItem>Clothes</asp:ListItem>
              <asp:ListItem>Bag/Backpack/Purse</asp:ListItem>
              <asp:ListItem>Other</asp:ListItem>
            </asp:DropDownList>
            <br />
            
            <label>Location Found:</label>
                <asp:TextBox ID="loc" runat="server" CssClass="form-control text"></asp:TextBox><br />
            <label>Description: <span style="color:red;">*</span></label>
            <span style="color:red;"><asp:RequiredFieldValidator ControlToValidate="des" Text="The Description field is required!" runat="server" /></span>
                <asp:TextBox ID="des" runat="server" CssClass="form-control text"></asp:TextBox><br />
            <label>Stored Location: <span style="color:red;">*</span></label>
            <span style="color:red;"><asp:RequiredFieldValidator ControlToValidate="storedLoc" Text="The Stored Location field is required!" runat="server" /></span>
                <asp:TextBox ID="storedLoc" runat="server" CssClass="form-control text"></asp:TextBox><br />
            <label>Entered By: <span style="color:red;">*</span></label>
            <span style="color:red;"><asp:RequiredFieldValidator ControlToValidate="name" Text="The Name field is required!" runat="server" /></span>
                <asp:TextBox ID="name" runat="server" CssClass="form-control text"></asp:TextBox><br />
          <br />
          <!-- Validate the required fields -->
          
        <asp:Button ID="submitBtn" runat="server" class="btn btn-primary" Text="Submit" />
      </form>
        <br />
        <p> <asp:Literal ID="litTest" runat="server"></asp:Literal> </p>
       
    </div>

    <script>
        var currentYear = (new Date).getFullYear();     //get the current year

        $(document).ready(function () {
            //This will append the current year to the end of the header string
            $("h2").append(currentYear);
            GetClock();
            setInterval(GetClock, 1000);
        });

    </script>
</body>
    
</html>
