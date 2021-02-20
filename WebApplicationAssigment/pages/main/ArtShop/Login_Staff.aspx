<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Login_Staff.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.Login_Staff" %>

<%@ Register Src="~/pages/widget/Staff/LoginPage.ascx" TagPrefix="uc1" TagName="LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:LoginPage runat="server" ID="LoginPage" />
</asp:Content>
