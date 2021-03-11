<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Logout_Staff.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.Logout_Staff" %>

<%@ Register Src="~/pages/widget/Staff/LogoutPage.ascx" TagPrefix="uc1" TagName="LogoutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:LogoutPage runat="server" id="LogoutPage" />
</asp:Content>
