﻿<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.Register" %>

<%@ Register Src="~/pages/widget/Staff/RegisterPage.ascx" TagPrefix="uc1" TagName="RegisterPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:registerpage runat="server" id="RegisterPage" />
</asp:Content>

