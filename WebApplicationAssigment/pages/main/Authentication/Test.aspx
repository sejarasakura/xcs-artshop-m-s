<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.Test" %>

<%@ Register Src="~/pages/main/Authentication/Widget/AddressPicker.ascx" TagPrefix="uc1" TagName="AddressPicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:AddressPicker runat="server" ID="AddressPicker" />
</asp:Content>
