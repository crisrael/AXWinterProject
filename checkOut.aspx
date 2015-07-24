<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="checkOut.aspx.cs" Inherits="_checkOut" %>
<asp:content ID="bodyContent" ContentPlaceHolderID="mainContentPlaceHolder" Runat="Server">
    <form id="checkOutForm" name="checkOutForm" method="post" action="CheckOut.aspx" runat="server" role="form">
	<div class="container">
	<h3>Check Out Items</h3>
		<div class="row">
			<div class="col-xs-3">
                <label>Claimed:</label>
			    <asp:DropDownList ID="claimedList" runat="server" CssClass="form-control dropdown">
                    <asp:ListItem>No</asp:ListItem>
			    	<asp:ListItem>Yes</asp:ListItem>
			    </asp:DropDownList>
				<br />
                <label>Checked In/Reported:</label>
			    <asp:DropDownList ID="checkedInList" runat="server" CssClass="form-control dropdown">
                    <asp:ListItem>All</asp:ListItem>
			    	<asp:ListItem>Item</asp:ListItem>
			    	<asp:ListItem>Report</asp:ListItem>
			    </asp:DropDownList>
				<br />
				<label>Type:</label>
				<asp:DropDownList ID="typeList" runat="server" CssClass="form-control dropdown">
                    <asp:ListItem>All</asp:ListItem>
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

			    <label>Color:</label>
			    <asp:DropDownList ID="colorList" runat="server" CssClass="form-control dropdown">
                    <asp:ListItem>All</asp:ListItem>
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
			    <label>Keyword:</label>
				<asp:TextBox ID="keywordsTxtBox" runat="server" CssClass="form-control text" placeHolder="Keywords"></asp:TextBox>
				<br />
                <asp:TextBox ID="startTimeTxtBox" runat="server" CssClass="form-control text" placeHolder="Start Date/Time"></asp:TextBox>
                <br />
                <asp:TextBox ID="endTimeTxtBox" runat="server" CssClass="form-control text" placeHolder="End Date/Time"></asp:TextBox>
                <br />
                <asp:Button ID="submitBtn" runat="server" class="btn btn-danger" Text="Submit" />
			</div>
		</div>
        <asp:Literal ID="litTest" runat="server"></asp:Literal>
        <asp:Repeater id="itemListRep" runat="server" OnItemCommand="itemListRep_ItemCommand">    
            <HeaderTemplate>
              <table class="table table-striped">
                  <thead>
                      <tr>
                          <th>Item ID</th>
                          <th>Time Stamp</th>
                          <th>Turned In</th>
                          <th>Type</th>
                          <th>Color</th>
                          <th>Location Found</th>
                          <th>Description</th>
                          <th>Stored Location</th>
                          <th>Check In/Reported</th>
						  <th>Own Name</th>
						  <th>Contact</th>
                          <th>Entered By</th>
						  <th>Checked By</th>
                          <th>Check Out</th>
                          <th>Delete Item</th>
                      </tr>
                  </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# DataBinder.Eval(Container.DataItem, "Item_ID") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Item_Timestamp") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Turned_Into") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Item_Type") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Item_Color") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Location_Found") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Item_Description") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Stored_Location") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "CheckedIn_Reported") %></td>
					<td><%# DataBinder.Eval(Container.DataItem, "Owner_Name") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Owner_Contact_Info") %></td>
					<td><%# DataBinder.Eval(Container.DataItem, "CheckedOut_By") %></td>
					<td><%# DataBinder.Eval(Container.DataItem, "CheckedOut_By") %></td>
                    <td><asp:LinkButton ID="editBtn" CommandName="checkOutItem" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Item_ID")%>' CssClass='<%# DataBinder.Eval(Container.DataItem, "Item_Claimed").ToString().Equals("True") ? "True" : "False" %>' Text="Check Out" /></td>
                    <td><asp:LinkButton ID="deleteBtn" CommandName="deleteItem" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Item_ID")%>' Text="Delete" /></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
              </table>
            </FooterTemplate>
        </asp:Repeater>
	</div>
</form>

    <script>
        $(function () {
            $(".True").hide();
        });
    </script>
</asp:content>
