<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileWidget.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.ProfileWidget" %>

<%@ Import Namespace="WebApplicationAssigment.commons" %>
<%@ Register Src="~/pages/main/Authentication/Widget/ProfileCustomer.ascx" TagPrefix="uc1" TagName="ProfileCustomer" %>
<%@ Register Src="~/pages/main/Authentication/Widget/ProfileGeneral.ascx" TagPrefix="uc1" TagName="ProfileGeneral" %>
<%@ Register Src="~/pages/main/Authentication/Widget/ProfileAddress.ascx" TagPrefix="uc1" TagName="ProfileAddress" %>
<%@ Register Src="~/pages/main/Authentication/Widget/ProfileAdmin.ascx" TagPrefix="uc1" TagName="ProfileAdmin" %>
<%@ Register Src="~/pages/main/Authentication/Widget/ProfileArtist.ascx" TagPrefix="uc1" TagName="ProfileArtist" %>





<hr />
<div class="container bootstrap snippet">
    <link rel="stylesheet" href="<%= Constant.LIB_URL %>/css/bootstrap3.css" />
    <div class="row">
        <div class="col-sm-10">
            <h1><%= this.viewMember.UserName %></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <!--left col-->
            <div class="text-center">
                <img src="<%= Constant.PROFILE_PIC_URL %>?guid=<%= (Guid)viewMember.ProviderUserKey %>" class="avatar img-circle img-thumbnail" alt="avatar">
                <h6>Upload a different photo...</h6>
                <input type="file" class="text-center center-block file-upload">
            </div>
            <hr />
            <br>
            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-user fa-1x"></i> | My Account</div>
                <div class="panel-body">
                    <a href="https://localhost:44375/pages/main/Authentication/Profile/Change%20Password.aspx">Changes Password</a>
                </div>
                <div class="panel-body">
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                </div>
            </div>
        </div>
        <!--/col-3-->
        <div class="col-sm-9">
            <ul class="xnav xnav-tabs nav nav-tabs">

                <asp:LoginView ID="LoginView2" runat="server">
                    <LoggedInTemplate>
                        <% string[] role = Roles.GetRolesForUser(viewMember.UserName); %>

                        <li class="profiles-switch active" id="tab-general" u-id="general"><a data-toggle="tab" href="#general">General</a></li>
                        <li class="profiles-switch" id="tab-address" u-id="address"><a data-toggle="tab" href="#address">My Address</a></li>

                        <% if (role.Contains("Artist"))
                            { %>
                        <li class="profiles-switch" id="tab-artist" u-id="artist"><a data-toggle="tab" href="#artist">Artist</a></li>
                        <% } %>
                        <% if (role.Contains("Customer"))
                            { %>
                        <li class="profiles-switch" id="tab-customer" u-id="customer"><a data-toggle="tab" href="#customer">Customer</a></li>
                        <% } %>
                        <% if (role.Contains("Administrator"))

                            { %>
                        <li class="profiles-switch" id="tab-staff" u-id="staff"><a data-toggle="tab" href="#staff">Staff</a></li>
                        <% } %>
                    </LoggedInTemplate>
                </asp:LoginView>
            </ul>

            <div class="tab-content">

                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <% string[] role = Roles.GetRolesForUser(viewMember.UserName); %>

                        <div class="tab-pane" id="general">
                            <uc1:ProfileGeneral runat="server" ID="ProfileGeneral"/>
                        </div>
                        
                        <div class="tab-pane" id="address">
                            <uc1:ProfileAddress runat="server" ID="ProfileAddress" />
                        </div>
                        <% if (role.Contains("Artist"))
                            { %>
                        <div class="tab-pane" id="artist">
                            <uc1:ProfileArtist runat="server" id="ProfileArtist" />
                        </div>
                        <!--/tab-pane-->
                        <% } %>
                        <% if (role.Contains("Customer"))
                            { %>
                        <div class="tab-pane" id="customer">
                            <uc1:ProfileCustomer runat="server" ID="ProfileCustomer" />
                        </div>
                        <!--/tab-pane-->
                        <% } %>
                        <% if (role.Contains("Administrator"))
                            { %>
                        <div class="tab-pane" id="staff">
                            <uc1:ProfileAdmin runat="server" ID="ProfileAdmin" />
                        </div>
                        <!--/tab-pane-->
                        <% } %>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <!--/tab-content-->

        </div>
        <!--/col-9-->
    </div>
</div>
<script>
    $(document).ready(function () {

        var readURL = function (input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.avatar').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $(".file-upload").on('change', function () {
            readURL(this);
        });

        $(".profiles-switch").click(function () {
            $(".profiles-switch").removeClass("active");
            $(this).addClass("active");
            $_x_tab_type = $(this).attr('u-id');
            $_x_url = "/pages/main/Authentication/updatesProfilesSessions.ashx?id=" + $_x_tab_type;
            $.get($_x_url, function (data, status) {
                console.log(data + status);
            });
        });

        $('.tab-content').removeClass("active");
        $('<%= type == null?"":type%>').addClass("active");
        $(".profiles-switch").removeClass("active");
        $('#tab-<%= type == null?"":type.Substring(1)%>').addClass("active");
    });
</script>
