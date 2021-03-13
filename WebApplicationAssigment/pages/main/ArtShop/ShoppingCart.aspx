<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ShoppingCart" %>

<%@ Import Namespace="WebApplicationAssigment.modal" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/main/ArtShop/widget/CartSections.ascx" TagPrefix="uc1" TagName="CartSections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
        <uc1:CartSections runat="server" id="CartSections" />
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />


</asp:Content>
