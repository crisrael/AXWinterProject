<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="removeUser.aspx.cs" Inherits="admin_removeUser" %>

<asp:Content ID="bodyContent" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
        <asp:Repeater id="userListRep" runat="server" >    
            <HeaderTemplate>
              <table class="table table-striped">
                  <thead>
                      <tr>
                          <th>User Name</th>
                          <th>Full Name</th>
                      </tr>
                  </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# DataBinder.Eval(Container.DataItem, "User_Name") %></td>
                    <td runat="server" id="userNameTD"><%# DataBinder.Eval(Container.DataItem, "Full_Name") %></td>
                    <td><a href="#" onclick='showModal("<%# DataBinder.Eval(Container.DataItem, "User_Name")%>"); return false;'>Change Password</a></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "User_Name").Equals("Admin") ? "---------------" : "<a id='deleteUserLnk' href='#' onClick='deleteUser(\"" + DataBinder.Eval(Container.DataItem, "User_Name") + "\"); return false;'>Delete User</a>" %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
              </tabel>
            </FooterTemplate>
        </asp:Repeater>

    <div class="modal fade" id="changePassModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    
                    <h4 class="modal-title">Change</h4>
                </div>
                <form id="form" class="form-signin" runat="server" method="post">
                    <div class="modal-body">
                        <asp:Literal runat="server" ID="msgLit"></asp:Literal>
                        <label>New Password: <span style="color:red;">*</span></label>
                        <span style="color:red;"><div id="newPassMsg"></div></span>
                            <asp:TextBox ID="newPassTxtBox" runat="server" CssClass="form-control text" TextMode="Password"></asp:TextBox><br />
                        <label>Re-type Password: <span style="color:red;">*</span></label>
                        <span style="color:red;"><div id="rePassMsg"></div></span>
                            <asp:TextBox ID="rePassTxtBox" runat="server" CssClass="form-control text" TextMode="Password"></asp:TextBox><br />
                    </div>
                    <div class="modal-footer">
                        <button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <asp:Button text="Submit" runat="server" CssClass="btn btn-primary" ID="submitBtn" OnClientClick="checkPass()" OnClick="submitBtn_Click"/>
                        <input id="userName" name="userName" type="hidden" value="" />
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <script>
        function showModal(userName) {
            $(".modal-title").html("Change password: " + userName);
            $("#submitBtn").attr("onclick", "changePass_Click(" + "" + ")");
            $("#changePassModal").modal({ "backdrop": "static" });
            $('#changePassModal').modal('show');
            $("#userName").attr("value", userName);
        }

        //Reset the form when the modal is closed
        $("#cancelBtn").click(function () {
            form.reset();
        });

        //Delete User
        function deleteUser(userName) {
            var dataToSend = {MethodName: 'deleteUser', userName: userName };
            $.ajax({
                url: '/admin/removeUser.aspx',
                data: dataToSend,
                dataType: 'JSON',
                type: 'POST',
                success: function (response) {
                    window.location.reload();
                },
                error: function (response) {
                    window.location.reload();
                }
            });
        }

        //Prevents the server onclick method from running on a window refresh
        $("form").submit(function (event) {
            var newPass = $("#<%=newPassTxtBox.ClientID %>").val();
            var rePass = $("#<%=rePassTxtBox.ClientID %>").val();;

            if (newPass != rePass) {
                event.preventDefault();

                $("#newPassMsg").html("Passwords do not match");
            }
            else if (newPass == "" && rePass == "") {
                event.preventDefault();
                $("#newPassMsg").html("Please Enter a New Password");
                $("#rePassMsg").html("Please re-enter your Password");
            }
            else {
                form.submit;
                alert("Password Changed Successfully");
            }
        });

    </script>
</asp:Content>

