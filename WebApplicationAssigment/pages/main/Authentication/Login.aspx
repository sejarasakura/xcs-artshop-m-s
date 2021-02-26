<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/web/lib/css/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Login ID="Login1" runat="server" Width="100%" Height="100%">
        <LayoutTemplate>
            
            <b class="text-danger"><asp:Literal id="FailureText" runat="server"></asp:Literal></b>
            <div id="logreg-forms" style="padding:20px;">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Sign in</h1>
                <div class="social-login">
                    <button class="btn facebook-btn social-btn" type="button"><span><i class="fab fa-facebook-f"></i> Sign in with Facebook</span> </button>
                    <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Sign in with Google+</span> </button>
                </div>
                <p style="text-align: center">OR  </p>
                <asp:TextBox id="UserName" runat="server" class="form-control" placeholder="email/username" required="" autofocus=""/>
                <br>
                <asp:TextBox id="Password" runat="server" class="form-control" placeholder="password" required="" autofocus=""/>
                <br />
                
                <asp:Checkbox id="RememberMe" runat="server" Text=" Remember my login"></asp:Checkbox>

                <asp:button CssClass="btn btn-success btn-block" type="submit" n id="Login" CommandName="Login" runat="server" Text="Sing In"></asp:button>
                <a href="#" id="forgot_pswd">Forgot password?</a>
                <hr>
                <a href="Register.aspx" class="text-white btn btn-primary" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</a>
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>
