<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminNav.ascx.cs" Inherits="WebApplicationAssigment.pages.admin.widget.AdminNav" %>

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:200px">
    <center style="margin: 20px;">
        <a class="" href="#">
            <img src="../../../../assets/image/background/CompanyLogo.png" alt="Rent Car" width="64" height="50">
        </a>
    </center>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" class=" admin-menu " href="#nav-1"
                    datatype="0"><b>Dashboard</b></a></h4>
        </div>
        <div id="nav-1" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="#">Admin</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" class=" admin-menu " href="#nav-2" datatype="1"><b>Users</b></a></h4>
        </div>
        <div id="nav-2" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="#">Admin</a></li>
                <li class="list-group-item"><a href="#">Customer</a></li>
                <li class="list-group-item"><a href="#">Artist</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" class=" admin-menu " href="#nav-3" datatype="2"><b>Data Adminsration</b></a></h4>
        </div>
        <div id="nav-3" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="#">Bookings</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" class=" admin-menu " href="#nav-4" datatype="3"><b>Report</b></a></h4>
        </div>
        <div id="nav-4" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="#">Sales diary report</a></li>
                <li class="list-group-item"><a href="#">xx Report</a></li>
                <li class="list-group-item"><a href="#">xx Report</a></li>
                <li class="list-group-item"><a href="#">xx Report</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" class=" admin-menu " href="#nav-5" datatype="4"><b>Settings</b></a></h4>
        </div>
        <div id="nav-5" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="">values</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" class=" admin-menu " href="#development-note"
                    datatype="5"><b>Development note</b></a></h4>
        </div>
        <div id="development-note" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="#">Report Link</a></li>
                <li class="list-group-item"><a href="#">Map Reference</a></li>
                <li class="list-group-item"><a href="#">GitHub Project Url</a></li>
                <li class="list-group-item"><a href="#">Development progress</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default" style="margin: 0px">
        <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" class=" admin-menu " href="#development-opperation"
                    datatype="6"><b>Report</b></a></h4>
        </div>
        <div id="development-opperation" class="panel-collapse collapse " style="padding-left: 10px">
            <ul class="list-group">
                <li class="list-group-item"><a href="#">Generatate exiting ID
                        List</a></li>
            </ul>
        </div>
    </div>
    <script>$(document).ready(function () {
            $(".admin-menu").click(function () {
                var x = "/WebApplication/AdminBarUpdate?c=" + $(this).attr('datatype');
                $.get(x, function (data, status) {
                    console.log('The status' + status + ', and data: ' + data);
                });
            });
        });
    </script>
</div>