<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminNav.ascx.cs" Inherits="WebApplicationAssigment.pages.admin.widget.AdminNav" %>

<%@ Import namespace="WebApplicationAssigment.commons" %>

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:200px">
    <center style="margin: 20px;">
        <a class="" href="#">
            <img src="../../../../assets/image/background/CompanyLogo.png" alt="Rent Car" width="64" height="50">
        </a>
    </center>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" 
                    class=" admin-menu " 
                    href="#nav-1"
                    datatype="0">
                    <b>Dashboard</b>
                </a>
            </h4>
        </div>
        <div id="nav-1" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/AdminDashboard.aspx">Admin Dashboard</a></li>
                <li class="list-group-item"><a href="<%= Constant.HOME_URL%>">Customer Homepages</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" 
                    class=" admin-menu " 
                    href="#nav-2" 
                    datatype="1">
                    <b>Users</b>
                </a>
            </h4>
        </div>
        <div id="nav-2" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/UserPages.aspx?role=administrator">Admin</a></li>
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/UserPages.aspx?role=customer">Customer</a></li>
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/UserPages.aspx?role=artist">Artist</a></li>
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/CreateRole.aspx">Create Role</a></li>
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/UserRole.aspx">User Role</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" 
                    class=" admin-menu " 
                    href="#nav-3" 
                    datatype="2">
                    <b>Data Adminsration</b>
                </a>
            </h4>
        </div>
        <div id="nav-3" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/Art.aspx">Art</a></li>
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/PaymentDetails.aspx">Payment</a></li>
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/PaymentDetails.aspx">Cart</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" 
                    class=" admin-menu " 
                    href="#nav-4" 
                    datatype="3">
                    <b>Report</b>
                </a>
            </h4>
        </div>
        <div id="nav-4" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>/SalesReport.aspx">Sales report</a></li>
                <li class="list-group-item"><a href="<%= Constant.ADMIN_URL%>">Best Art Report</a></li>
            </ul>
        </div>
    </div>
    <script>$(document).ready(function () {
            $(".admin-menu").click(function () {
                var x = "/commons/handler/UpdatesHeaderNavigations.ashx?c=" + $(this).attr('datatype');
                $.get(x, function (data, status) {
                    console.log('The status' + status + ', and data: ' + data);
                });
            });
        });
    </script>

</div>