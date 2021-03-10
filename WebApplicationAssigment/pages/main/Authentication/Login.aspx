<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/web/lib/css/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
    <%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
    <%@ Register Src="~/pages/main/Authentication/Widget/Login.ascx" TagPrefix="uc1" TagName="Login" %>

    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <uc1:Login runat="server" id="LoginUserControl" AutoRedirect="false" ValidationGroup="Login"/>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>
