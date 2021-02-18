<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="RegisterScreen.aspx.cs" Inherits="WebApplicationAssigment.pages.profile.RegisterScreen" %>

<%@ Register Src="~/pages/widget/Register.ascx" TagPrefix="uc1" TagName="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:register runat="server" id="Register" />
</asp:Content>

