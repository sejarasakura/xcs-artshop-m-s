<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.ForgotPassword" %>

<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table{
            margin: auto!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server"></asp:PasswordRecovery>

<uc1:EndPagesSM runat="server" ID="EndPagesSM" />

</asp:Content>