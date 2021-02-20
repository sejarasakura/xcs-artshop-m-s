<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="SiteMapPage.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.SiteMapPage" %>

<%@ Register Src="~/pages/widget/Sidemap.ascx" TagPrefix="uc1" TagName="Sidemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Sidemap runat="server" ID="Sidemap" />
</asp:Content>
