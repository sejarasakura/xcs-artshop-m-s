<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.Header" %>

<nav id="project_navbar" class="navbar navbar-expand-lg navbar-light" style="background-color: transparent">
    <a class="navbar-brand" href="#">
        <img src="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/assets/image/background/CompanyLogo.png " class="d-inline-block align-top" width="90" height="64">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mx-auto mk">
            <li class="nav-item">
                <a class="nav-link" href="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/pages/main/ArtShop/ArtShop_Customer.aspx">Painting</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Drawing</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">News</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Login</a>
                    <a class="dropdown-item mt-2" href="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/pages/main/ArtShop/ShoppingCart.aspx">Shopping Cart</a>
                    <a class="dropdown-item mt-3" href="#">Logout</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link font-weight-light" href="#">Contact Us</a>
            </li>

        </ul>
        <div class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
        </div>
    </div>
    <div class="header-content" style="width:1px">
    </div>
</nav>


<style>
    .header-content {
        padding: 16px;
    }

    .header-sticky {
        position: fixed;
        background-color: #f8f9fa!important;
        top: 0;
        width: 100%;
    }

    .header-sticky + .header-content {
        padding-top: 60px;
    }
        
    #project_navbar{
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
