<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginUserControl.ascx.cs" Inherits="ProjectZupree.User_Control.LoginUserControl" %>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt margin-50" data-tilt>
                <img src="../App_Images/img-01.png" alt="IMG">
            </div>

            <div class="login100-form">
                <span class="login100-form-title">Member Login
                </span>
                <div class="wrap-input100">
                    <asp:TextBox ID="txtUserName" runat="server" class="input100" type="text" name="UserName" placeholder="User Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="User Name Required !" ControlToValidate="txtUserName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                        <i class="fas fa-user"></i>
                    </span>
                </div>
                <div class="wrap-input100">
                    <asp:TextBox ID="txtPassword" runat="server" class="input100" type="password" name="password" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password Required !" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                    </span>
                </div>
                <div class="wrap-input100">
                    <asp:CheckBox ID="chkBoxRememberMe" runat="server" Text="&nbsp;&nbsp;Remember Me" ForeColor="#00CC66" />
                </div>
                <div class="wrap-input100">
                    <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <div class="container-login100-form-btn">
                    <asp:Button ID="btnLogin" class="login100-form-btn" runat="server" Text="Sing In" OnClick="btnLogin_Click" />
                </div>

                <div class="text-center p-t-12">
                    <span class="txt1">Forgot
                    </span>
                    <a class="txt2" href="#">Username / Password?
                    </a>
                </div>

                <div class="text-center p-t-136">
                    <a class="txt2" href="UnauthorizedPages/UserRegistration.aspx">Create your Account
						<i class="fas fa-long-arrow-alt-right  m-l-5" style="font-size: 12px;"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
