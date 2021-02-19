<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master"  AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplicationAssigment.pages.__test.WebForm1" %>

<%@ Register Src="~/pages/widget/StartPage.ascx" TagPrefix="uc1" TagName="StartPage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:StartPage runat="server" id="StartPage" />

</asp:Content>
