<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Change Password.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.account.Profile" %>

<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table {
            margin: auto !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
        <asp:ChangePassword ID="ChangePassword1" runat="server"></asp:ChangePassword>
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>
