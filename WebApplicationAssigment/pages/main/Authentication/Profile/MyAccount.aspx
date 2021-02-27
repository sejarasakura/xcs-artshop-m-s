<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.account.MyAccount" %>

<%@ Register Src="~/pages/widget/ProfileWidget.ascx" TagPrefix="uc1" TagName="ProfileWidget" %>
<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPages.ascx" TagPrefix="uc1" TagName="EndPages" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>




<%@ Import Namespace="WebApplicationAssigment.commons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial;
        }

        /* Style the sk2_tab */
        .sk2_tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

            /* Style the buttons inside the sk2_tab */
            .sk2_tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
            }

                /* Change background color of buttons on hover */
                .sk2_tab button:hover {
                    background-color: #ddd;
                }

                /* Create an active/current sk2_tablink class */
                .sk2_tab button.active {
                    background-color: #ccc;
                }

        /* Style the sk2_tab content */
        .sk2_tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
    <div class="sk2_tab">
        <asp:LoginView ID="LoginView2" runat="server">
            <LoggedInTemplate>
                <% string[] role = Roles.GetRolesForUser(); %>

                <a id="xGeneral" class="btn btn-lg btn-default sk2_tablinks" href="MyAccount.aspx?id=General">General</a>

                <% if (role.Contains("Artist"))
                    { %>
                <a id="xArtist" class="btn btn-lg btn-default sk2_tablinks" href="MyAccount.aspx?id=Artist">Artist</a>
                <% } %>
                <% if (role.Contains("Customer"))
                    { %>
                <a id="xCustomer" class="btn btn-lg btn-default sk2_tablinks" href="MyAccount.aspx?id=Customer">Customer</a>
                <% } %>
                <% if (role.Contains("Administrator"))
                    { %>
                <a id="xAdministrator" class="btn btn-lg btn-default sk2_tablinks" href="MyAccount.aspx?id=Administrator">Staff</a>
                <% } %>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>

    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>

            <% string[] role = Roles.GetRolesForUser(); %>

            <div id="General" class="sk2_tabcontent">
                <uc1:ProfileWidget runat="server" ID="ProfileWidget" />
                <h3>General Profile Details</h3>
                <p>Paris is the capital of France.</p>
            </div>

            <% if (role.Contains("Artist"))
                { %>
            <div id="Artist" class="sk2_tabcontent">
                <h3>Artist Profile Details</h3>
                <p>Paris is the capital of France.</p>
            </div>
            <% } %>
            <% if (role.Contains("Customer"))
                { %>
            <div id="Customer" class="sk2_tabcontent">
                <h3>Customer Profile Details</h3>
                <p>Tokyo is the capital of Japan.</p>
            </div>
            <% } %>
            <% if (role.Contains("Administrator"))
                { %>
            <div id="Staff" class="sk2_tabcontent">
                <h3>Admin OR Staff Profile</h3>
                <p>Tokyo is the capital of Japan.</p>
            </div>
            <% } %>
        </LoggedInTemplate>
    </asp:LoginView>
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
    <script>
        function openCity(cityName) {
            var i, sk2_tabcontent, sk2_tablinks;
            sk2_tabcontent = document.getElementsByClassName("sk2_tabcontent");
            for (i = 0; i < sk2_tabcontent.length; i++) {
                sk2_tabcontent[i].style.display = "none";
            }
            sk2_tablinks = document.getElementsByClassName("sk2_tablinks");
            for (i = 0; i < sk2_tablinks.length; i++) {
                sk2_tablinks[i].className = sk2_tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            document.getElementById("x" + cityName).className += " active";
        }
        openCity('<%= Request["id"]%>');
    </script>

</asp:Content>
