<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Profile_Staff.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.Profile_Staff" %>

<%@ Register Src="~/pages/widget/Staff/ProfilePage.ascx" TagPrefix="uc1" TagName="ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ProfilePage runat="server" ID="ProfilePage" />
</asp:Content>
