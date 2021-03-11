<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="LoginScreen.aspx.cs" Inherits="WebApplicationAssigment.pages.__test.LoginScreen" %>

<%@ Register Src="~/pages/widget/LoginNav.ascx" TagPrefix="uc1" TagName="LoginNav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:LoginNav runat="server" ID="LoginNav" />
</asp:Content>
