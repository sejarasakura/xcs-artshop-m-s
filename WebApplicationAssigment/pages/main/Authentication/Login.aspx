<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/web/lib/css/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
    <%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <asp:Login ID="Login1" runat="server" Width="100%" Height="100%" OnLoggedIn="Login1_LoggedIn">
        <LayoutTemplate>
            <div id="logreg-forms" style="padding: 20px;">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Sign in</h1>
                <div class="social-login">
                    <button class="btn facebook-btn social-btn" type="button"><span><i class="fab fa-facebook-f"></i>Sign in with Facebook</span> </button>
                    <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i>Sign in with Google+</span> </button>
                </div>
                <p style="text-align: center">OR  </p>
                <asp:TextBox ID="UserName" runat="server" class="form-control" placeholder="email/username" required="" autofocus="" />
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" Text="*"></asp:RequiredFieldValidator>
                <br>
                <asp:TextBox ID="Password" runat="server" class="form-control" placeholder="password" required="" autofocus="" TextMode="Password" />
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" Text="*"></asp:RequiredFieldValidator>

                <br />

                <asp:CheckBox ID="RememberMe" runat="server" Text=" Remember my login"></asp:CheckBox>

                <b class="text-danger text-center">
                    <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                </b>
                <asp:Button CssClass="btn btn-success btn-block" type="submit" ID="Login" CommandName="Login" runat="server" Text="Sing In"></asp:Button>
                <a href="ForgotPassword.aspx" id="forgot_pswd">Forgot password?</a>
                <hr>
                <a href="Register.aspx" class="text-white btn btn-primary" id="btn-signup"><i class="fas fa-user-plus"></i>Sign up New Account</a>
            </div>
        </LayoutTemplate>
    </asp:Login>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>
