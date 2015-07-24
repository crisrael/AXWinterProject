<%@ Page Title="AXLAF Check In" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="checkIn.aspx.cs" Inherits="_checkIn" %>

<asp:Content ID="bodyContent" ContentPlaceHolderID="mainContentPlaceHolder" Runat="Server">
    <div class="container">
      <h3>Items Received</h3>
      <p><span style="color:red;">* Required</span></p>
      <form id="checkInForm" method="post"  action="CheckIn.aspx" runat="server" role="form">
        <label>Item or Report:</label>
		  <asp:DropDownList ID="checkedInList" runat="server" CssClass="form-control dropdown">
			  <asp:ListItem>Item</asp:ListItem>
			  <asp:ListItem>Report</asp:ListItem>
		  </asp:DropDownList>
          <br />
          <div class = "ItemID"><label>Turned Into: <span style="color:red;">*</span></label></div>
          <span style="color:red;"><asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="turnedInList" Text="The Turned Into field is required!" runat="server" /></span>
            <asp:DropDownList ID="turnedInList" runat="server" CssClass="form-control dropdown">
                <asp:ListItem>Info HQ</asp:ListItem>
                <asp:ListItem>South Hall</asp:ListItem>
                <asp:ListItem>West Hall</asp:ListItem>
            </asp:DropDownList>
          <br id="turnedInBr"/>
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
			
		  <label>Color: <span style="color:red;">*</span></label>
          <span style="color:red;"><asp:RequiredFieldValidator ControlToValidate="colorList" Text="The Color field is required!" runat="server" /></span>
          <asp:DropDownList ID="colorList" runat="server" CssClass="form-control dropdown">
              <asp:ListItem>Red</asp:ListItem>
              <asp:ListItem>Orange</asp:ListItem>
              <asp:ListItem>Yellow</asp:ListItem>
              <asp:ListItem>Green</asp:ListItem>
              <asp:ListItem>Blue</asp:ListItem>
              <asp:ListItem>Purple</asp:ListItem>
              <asp:ListItem>Black</asp:ListItem>
              <asp:ListItem>White</asp:ListItem>
              <asp:ListItem>Grey</asp:ListItem>
              <asp:ListItem>Pink</asp:ListItem>
			  <asp:ListItem>Other/Multi</asp:ListItem>
            </asp:DropDownList>
            <br />
            
            <div class = "ItemID"><label>Location Found:</label></div>
                <asp:TextBox ID="loc" runat="server" CssClass="form-control text"></asp:TextBox><br id="locBr"/>
            <label>Description: <span style="color:red;">*</span></label>
			<span style="color:red;"><asp:RequiredFieldValidator ID="itemDesValid" ControlToValidate="des" Text="Description is Required!" runat="server" ValidationGroup="itemValid"/></span>
			<span style="color:red;"><asp:RequiredFieldValidator ID="returnDesValid" ControlToValidate="des" Text="Description is Required!" runat="server" ValidationGroup="reportValid"/></span>
                <asp:TextBox ID="des" runat="server" CssClass="form-control text"></asp:TextBox><br />
            <div class = "ItemID"><label>Stored Location: <span style="color:red;">*</span></label></div>
			<span style="color:red;"><asp:RequiredFieldValidator ID="itemStoredLocValid" ControlToValidate="storedLoc" Text="Stored Location is Required!" runat="server" ValidationGroup="itemValid"/></span>
                <asp:TextBox ID="storedLoc" runat="server" CssClass="form-control text"></asp:TextBox><br id="storedLocBr"/>
			<div class = "OwnerID"><label>Owner Name: <span style="color:red;">*</span></label></div>
			<span style="color:red;"><asp:RequiredFieldValidator ID="returnOwnNameValid" ControlToValidate="ownName" Text="Owner is Required!" runat="server" ValidationGroup="reportValid"/></span>
            <asp:TextBox ID="ownName" runat="server" CssClass="form-control text"></asp:TextBox><br class="returnBr"/>
			<div class = "OwnerID"><label>Owner Contact Information:<span style="color:red;">*</span></label></div>
			<span style="color:red;"><asp:RequiredFieldValidator ID="returnContactValid" ControlToValidate="contact" Text="Owner Contact is Required!" runat="server" ValidationGroup="reportValid"/></span>
			<asp:TextBox ID="contact" runat="server" CssClass="form-control text"></asp:TextBox><br class="returnBr"/>
			<br />
			<asp:Button ID="submitItemBtn" runat="server" class="btn btn-danger" Text="Submit" ValidationGroup="itemValid"/>
			<asp:Button ID="submitReportBtn" runat="server" class="btn btn-danger" Text="Submit" ValidationGroup="reportValid"/>
      </form>
        <br />
        <p><asp:Literal ID="litTest" runat="server"></asp:Literal></p>
    </div>
	<script>		
		$(document).ready(function() {
			shift();
		}); 
		
		$("#mainContentPlaceHolder_checkedInList").change(function() {
			shift();
		});
		
		function shift() {
			var selectedOption = $("#mainContentPlaceHolder_checkedInList option:selected").text();
			if(selectedOption === 'Item') {
			
				$(".ItemID").show();
				$(".OwnerID").hide();
				$("#mainContentPlaceHolder_turnedInList").show();
				$("#mainContentPlaceHolder_loc").show();
				$("#mainContentPlaceHolder_storedLoc").show();
				$("#mainContentPlaceHolder_ownName").hide();
				$("#mainContentPlaceHolder_contact").hide();	
				
				//Extra Breaks
				$("#turnedInBr").show();
				$("#locBr").show();
				$("#storedLocBr").show();
				$(".returnBr").hide();
				
				//Hide Validators
				$("#mainContentPlaceHolder_itemDesValid").show();
				$("#mainContentPlaceHolder_itemStoredLocValid").show();
				
				$("#mainContentPlaceHolder_returnOwnNameValid").hide();
				$("#mainContentPlaceHolder_returnContactValid").hide();

				//Change submit button validation group
				$("#mainContentPlaceHolder_submitItemBtn").show();
				$("#mainContentPlaceHolder_submitReportBtn").hide();
				Page_ClientValidate('');
				
			} else {
			
				$(".ItemID").hide();
				$(".OwnerID").show();
				$("#mainContentPlaceHolder_turnedInList").hide();
				$("#mainContentPlaceHolder_loc").hide();
				$("#mainContentPlaceHolder_storedLoc").hide();
				$("#mainContentPlaceHolder_ownName").show();
				$("#mainContentPlaceHolder_contact").show();
				
				//Extra Breaks
				$("#turnedInBr").hide();
				$("#locBr").hide();
				$("#storedLocBr").hide();
				$(".returnBr").show();
				
				//Hide Validators
				$("#mainContentPlaceHolder_itemDesValid").hide();
				$("#mainContentPlaceHolder_itemStoredLocValid").hide();
				
				$("#mainContentPlaceHolder_returnOwnNameValid").show();
				$("#mainContentPlaceHolder_returnContactValid").show();

				//Change submit button validation group
				$("#mainContentPlaceHolder_submitItemBtn").hide();
				$("#mainContentPlaceHolder_submitReportBtn").show();	
				Page_ClientValidate('');				
			}
		}
		
		function Page_ValidationSummariesReset(){
			if (typeof(Page_ValidationSummaries) == "undefined")
				return;
			for (var i = 0; i < Page_ValidationSummaries.length; i++)
				Page_ValidationSummaries[i].style.display = "none";
		}
		
	</script>
</asp:Content>

