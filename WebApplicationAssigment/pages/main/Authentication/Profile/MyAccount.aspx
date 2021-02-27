<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.account.MyAccount" %>

<%@ Register Src="~/pages/widget/ProfileWidget.ascx" TagPrefix="uc1" TagName="ProfileWidget" %>

<%@ Import namespace="WebApplicationAssigment.commons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial;
        }

        /* Style the tab */
        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

            /* Style the buttons inside the tab */
            .tab button {
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
                .tab button:hover {
                    background-color: #ddd;
                }

                /* Create an active/current tablink class */
                .tab button.active {
                    background-color: #ccc;
                }

        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="tab">
        <asp:LoginView ID="LoginView2" runat="server">
            <LoggedInTemplate>
                <button class="tablinks" onclick="openCity(event, 'General')">General</button>
            </LoggedInTemplate>
            <RoleGroups>
                <asp:RoleGroup Roles="Artist">
                    <ContentTemplate>
                        <button class="tablinks" onclick="openCity(event, 'Artist')">Artist</button>
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="Customer">
                    <ContentTemplate>
                        <button class="tablinks" onclick="openCity(event, 'Customer')">Customer</button>
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="Administrator">
                    <ContentTemplate>
                        <button class="tablinks" onclick="openCity(event, 'Staff')">Staff</button>

                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
    </div>

    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <div id="General" class="tabcontent">
                <uc1:ProfileWidget runat="server" ID="ProfileWidget" />
            </div>
        </LoggedInTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Artist">
                <ContentTemplate>
                    <div id="Artist" class="tabcontent">
                        <h3>Artist Profile Details</h3>
                        <p>Paris is the capital of France.</p>
                    </div>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Customer">
                <ContentTemplate>
                    <div id="Customer" class="tabcontent">
                        <h3>Customer Profile Details</h3>
                        <p>Tokyo is the capital of Japan.</p>
                    </div>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Administrator">
                <ContentTemplate>
                    <div id="Staff" class="tabcontent">
                        <h3>Admin OR Staff Profile</h3>
                        <p>Tokyo is the capital of Japan.</p>
                    </div>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>

</asp:Content>
