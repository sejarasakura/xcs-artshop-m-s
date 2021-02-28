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
                <uc1:ProfileWidget runat="server" ID="ProfileWidget" />
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
   
</asp:Content>
