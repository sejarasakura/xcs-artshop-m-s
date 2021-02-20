<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ArtShop_Cust_Details.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ArtShop_Cust_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-lg mt-4 mb-4">
        <div class="row">
            <div class="col-md-6">
                <img src="../../../assets/image/testing/OK.JPG" width="380" height="640">
            </div>
            <div class="col-md-6">
                <p style="font-size:30px">Artwork Name</p>
                <p class="font-weight-lighter">Artwort Description/Artwort Description/Artwort Description/Artwort Description/Artwort Description/Artwort Description/
                    Artwort Description/Artwort Description/Artwort Description
                </p>
                <p class="font-weight-lighter">Artwork Price</p>
                <p class="font-weight-lighter">Artwork Quantity</p>
                <button type="button" class="btn btn-warning mt-6">Add to Shopping Cart</button>
            </div>
        </div>

    </div>
</asp:Content>
