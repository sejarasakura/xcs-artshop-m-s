<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ChangePassword_Staff.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ChangePassword_Staff" %>

<%@ Register Src="~/pages/widget/Staff/ChangePassPage.ascx" TagPrefix="uc1" TagName="ChangePassPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ChangePassPage runat="server" id="ChangePassPage" />
</asp:Content>
