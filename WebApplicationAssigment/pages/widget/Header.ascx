<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.Header" %>

<%@ Import namespace="WebApplicationAssigment.commons" %>

<nav id="project_navbar" class="navbar navbar-expand-lg navbar-light" style="background-color: transparent">
    <a class="navbar-brand" href="#">
        <img src="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/assets/image/background/CompanyLogo.png " class="d-inline-block align-top" width="90" height="64">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mk mx-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/pages/main/ArtShop/ArtShop_Customer.aspx">Painting</a>
            </li>
            <asp:LoginView ID="LoginView1" runat="server">
                <AnonymousTemplate>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= Constant.AUTH_URL %>/Login.aspx">Login</a>
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
                            <a class="dropdown-item mt-3" href="#">Account Details</a>
                            <a class="dropdown-item mt-3" href="#">Change Password</a>
                            <a class="dropdown-item mt-3" href="#">Logout</a>
                        </div>
                    </li>
                    <% if (role.Contains("Artist")) { %>
                            <li class="nav-item">
                                <a class="nav-link" href="<%= Constant.ARTIST_URL %>/AddNewArt.aspx">Add Art</a>
                                <a class="nav-link" href="<%= Constant.ARTIST_URL %>/ReadUpdateDeleteArt.aspx">My Arts</a>
                                <a class="nav-link" href="<%= Constant.ARTIST_URL %>/ViewArtSales.aspx">My Arts</a>
                            </li>
                    <% } %>
                    <% if (role.Contains("Customer")) { %>
                            <li class="nav-item">
                                <a class="nav-link" href="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/pages/main/ArtShop/ShoppingCart.aspx">Shopping Cart</a>
                            </li>
                    <% } %>
                    <% if (role.Contains("Administrator")) { %>
                            <li class="nav-item">
                                <a class="nav-link" href="<%= Constant.ADMIN_URL %>/AdminDashboard.aspx">Admin Dashboard</a>
                            </li>
                    <% } %>
                </LoggedInTemplate>
                <RoleGroups>
                    <asp:RoleGroup Roles="Artist">
                        <ContentTemplate>
                            <!-- child controls -->
                        </ContentTemplate>
                    </asp:RoleGroup>
                    <asp:RoleGroup Roles="Customer">
                        <ContentTemplate>
                        </ContentTemplate>
                    </asp:RoleGroup>
                    <asp:RoleGroup Roles="Administrator">
                        <ContentTemplate>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
            <li class="nav-item">
                <a class="nav-link font-weight-light" href="#">Contact Us</a>
            </li>

        </ul>
        <div class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
        </div>
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
