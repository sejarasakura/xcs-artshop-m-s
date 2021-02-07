<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ProfileScreen.aspx.cs" Inherits="WebApplicationAssigment.pages.profile.ProfileScreen" %>

<<<<<<< Updated upstream
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%@ Register Src="~/pages/widget/Profile.ascx" TagPrefix="uc1" TagName="Profile" %>

<uc1:Profile runat="server" ID="Profile" />

=======
<%@ Register Src="~/pages/widget/profilemou.ascx" TagPrefix="uc1" TagName="profilemou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <uc1:profilemou runat="server" id="profilemou" />
>>>>>>> Stashed changes
</asp:Content>
