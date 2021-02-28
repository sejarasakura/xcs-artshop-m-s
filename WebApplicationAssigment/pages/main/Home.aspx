<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Home" %>

<%@ Register Src="~/pages/widget/StartPage.ascx" TagPrefix="uc1" TagName="StartPage" %>
<%@ Register Src="~/pages/widget/EndPages.ascx" TagPrefix="uc1" TagName="EndPages" %>
<%@ Register Src="~/pages/widget/HotDeals.ascx" TagPrefix="uc1" TagName="HotDeals" %>

<%@ Import namespace="WebApplicationAssigment.commons" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:StartPage runat="server" ID="StartPage" />
    <div style="margin: 20px">
        <img src="<%= Constant.DEFAULT_URL %>/assets/image/hot-deal.png" /><h2>Hot Deals</h2>
        <div id="container1">
            <div id="container2">
                <uc1:HotDeals runat="server" ID="HotDeals" />
            </div>
        </div>
    </div>
    <uc1:EndPages runat="server" ID="EndPages" />
</asp:Content>
