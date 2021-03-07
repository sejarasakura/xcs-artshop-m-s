<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.Widget.Login" %>

<link href="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/web/lib/css/login.css" rel="stylesheet" />
<asp:Login ID="Login1" runat="server" Width="100%" Height="100%" OnLoggedIn="Login1_LoggedIn" OnLoginError="Login1_LoginError">
    <LayoutTemplate>
        <div id="logreg-forms" style="padding: 20px;">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Sign in</h1>
            <div class="social-login">
                <button class="btn facebook-btn social-btn" type="button"><span><i class="fab fa-facebook-f"></i> Sign in with Facebook</span> </button>
                <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Sign in with Google+</span> </button>
            </div>
            <p style="text-align: center">OR  </p>
            <asp:TextBox ID="UserName" runat="server" class="form-control" placeholder="username" required="" autofocus="" />
            <asp:RequiredFieldValidator class="text-danger" ID="UserNameRequired" runat="server" ControlToValidate="UserName" Text="*Username is required"></asp:RequiredFieldValidator>
            <br>
            <asp:TextBox ID="Password" runat="server" class="form-control" placeholder="password" required="" autofocus="" TextMode="Password" />
            <asp:RequiredFieldValidator class="text-danger" ID="PasswordRequired" runat="server" ControlToValidate="Password" Text="*Password is required"></asp:RequiredFieldValidator>

            <br />

            <asp:CheckBox ID="RememberMe" runat="server" Text=" Remember my login"></asp:CheckBox>

            <b class="text-danger text-center">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </b>
            <asp:Button CssClass="btn btn-success btn-block" ID="Login" CommandName="Login" runat="server" Text="Sing In"></asp:Button>
            <a href="/pages/main/Authentication/ForgotPassword.aspx" id="forgot_pswd">Forgot password?</a>
            <hr>
            <a href="/pages/main/Authentication/Register.aspx" class="text-white btn btn-primary" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</a>
        </div>
    </LayoutTemplate>
</asp:Login>