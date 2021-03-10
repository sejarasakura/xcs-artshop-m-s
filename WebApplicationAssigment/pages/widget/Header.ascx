<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.Header" %>

<%@ Import Namespace="WebApplicationAssigment.commons" %>

<nav id="project_navbar" class="navbar navbar-expand-lg navbar-light" style="background-color: transparent">
    <a class="navbar-brand" href="#">
        <img src="<%= Constant.COMPANY_LOGO %>" class="d-inline-block align-top" width="90" height="64">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mk mx-auto">
            <li class="nav-item">
                <a class="nav-link" href="<%= Constant.HOME_URL %>">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= Constant.DEFAULT_URL%>/pages/main/ArtShop/ArtShop_Customer.aspx">Painting</a>
            </li>
            <asp:LoginView ID="LoginView1" runat="server">
                <AnonymousTemplate>
                    <li class="nav-item">
                        <a class="nav-link" id="login_button_in_header" href="#">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= Constant.AUTH_URL %>/Register.aspx">Sign Up</a>
                    </li>
                </AnonymousTemplate>
                <LoggedInTemplate>

                    <% string[] role = Roles.GetRolesForUser(); %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item mt-3" href="<%= Constant.PROFILE_URL %>/MyAccount.aspx">Account Details</a>
                            <a class="dropdown-item mt-3" href="<%= Constant.PROFILE_URL %>/Change Password.aspx">Change Password</a>
                            <a class="dropdown-item mt-3" href="<%= Constant.PROFILE_URL %>/Logout.aspx">Logout</a>
                        </div>
                    </li>
                    <% if (role.Contains("Artist"))
                        { %>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= Constant.ARTIST_URL %>/AddNewArt.aspx">Add Art</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= Constant.ARTIST_URL %>/ReadUpdateDeleteArt.aspx">My Art</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= Constant.ARTIST_URL %>/ViewArtSales.aspx">Arts Sales</a>
                    </li>
                    <% } %>
                    <% if (role.Contains("Customer"))
                        { %>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= Constant.ARTSHOP_URL%>/ShoppingCart.aspx">Shopping Cart</a>
                    </li>
                    <% } %>
                    <% if (role.Contains("Administrator"))
                        { %>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= Constant.ADMIN_URL %>/AdminDashboard.aspx">Admin Dashboard</a>
                    </li>
                    <% } %>
                </LoggedInTemplate>
            </asp:LoginView>
            <li class="nav-item">
                <a class="nav-link font-weight-light" href="#">Contact Us</a>
            </li>

        </ul>
        <div class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
        </div>

        <asp:LoginView ID="LoginView2" runat="server">
            <AnonymousTemplate>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <% MembershipUser ms = Functions.getLoginUser(); %>
                <img src="<%= Constant.PROFILE_PIC_URL %>?guid=<%= (Guid)ms.ProviderUserKey %>" class="avatar rounded-circle img-thumbnail" alt="avatar" width="60" height="60" style="margin-left: 20px">
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
    <div class="header-content" style="width: 1px">
    </div>
</nav>


<style>
    .header-content {
        padding: 16px;
    }

    .header-sticky {
        position: fixed;
        background-color: #f8f9fa !important;
        top: 0;
        width: 100%;
    }

        .header-sticky + .header-content {
            padding-top: 60px;
        }

    #project_navbar {
        z-index: 100000;
        background: rgb(193,193,193)!important;
        background: linear-gradient(0deg, rgba(225,225,225,1) 0%, rgba(255,255,255,1) 100%)!important;
    }
</style>

<script>
    window.onscroll = function () { myFunction() };

    var navbar = document.getElementById("project_navbar");
    var sticky = navbar.offsetTop;

    function myFunction() {
        if (window.pageYOffset > sticky) {
            navbar.classList.add("header-sticky")
        } else {
            navbar.classList.remove("header-sticky");
        }
    }
</script>
