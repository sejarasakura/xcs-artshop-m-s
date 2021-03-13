<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Delivery.Delivery" %>

<%@ Register Src="~/pages/main/Delivery/widget/DeliveryChain.ascx" TagPrefix="uc1" TagName="DeliveryChain" %>
<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
        <uc1:DeliveryChain runat="server" ID="DeliveryChain" />
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>

