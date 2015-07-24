<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="addUser.aspx.cs" Inherits="admin_addUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <div class="container">
      <h2>Add New User</h2>
        <form id="form" name="addUserForm" method="post"  action="addUser.aspx" runat="server" role="form">
            <p><span style="color:red;">* Required</span></p><br />
                <label>User Name: <span style="color:red;">*</span></label>
                <span style="color:red;"><asp:RequiredFieldValidator ControlToValidate="userTxtBox" Text="Please enter a User Name." runat="server" /></span>
                    <asp:TextBox ID="userTxtBox" runat="server" CssClass="form-control text" placeHolder="Username"></asp:TextBox><br />
                <label>Password: <span style="color:red;">*</span></label>
                <span style="color:red;"><asp:RequiredFieldValidator ControlToValidate="passTxtBox" Text="Please enter a Password." runat="server" /></span>
                    <asp:TextBox ID="passTxtBox" runat="server" CssClass="form-control text" placeholder="Password" TextMode="Password"></asp:TextBox><br />
                <label>Full Name: <span style="color:red;">*</span></label>
                <span style="color:red;"><asp:RequiredFieldValidator ControlToValidate="userTxtBox" Text="Please enter the full name of user." runat="server" /></span>
                    <asp:TextBox ID="fullNameTxtBox" runat="server" CssClass="form-control text" placeHolder="Full Name"></asp:TextBox><br />
            <br />
            <asp:Button ID="submitBtn" runat="server" CssClass="btn btn-danger" Text="Submit"/>
            </form>
        <br />
        <p> <asp:Literal ID="msgLit" runat="server"></asp:Literal> </p>       
    </div>
</asp:Content>

