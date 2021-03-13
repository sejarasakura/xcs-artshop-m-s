<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.account.MyAccount" %>

<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPages.ascx" TagPrefix="uc1" TagName="EndPages" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
<%@ Register Src="~/pages/main/Authentication/Widget/ProfileWidget.ascx" TagPrefix="uc1" TagName="ProfileWidget" %>





<%@ Import Namespace="WebApplicationAssigment.commons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
        <center><h2>Users Profiles</h2></center>
        <uc1:ProfileWidget runat="server" ID="ProfileWidget" />
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
   
</asp:Content>
