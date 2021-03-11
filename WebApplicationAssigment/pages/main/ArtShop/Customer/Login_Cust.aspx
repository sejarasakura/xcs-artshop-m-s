<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Login_Cust.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.Customer.Login_Cust" %>

<%@ Register Src="~/pages/widget/Customer/LoginPageCust.ascx" TagPrefix="uc1" TagName="LoginPageCust" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:LoginPageCust runat="server" id="LoginPageCust" />
</asp:Content>
