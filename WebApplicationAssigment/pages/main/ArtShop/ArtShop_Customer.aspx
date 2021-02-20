<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ArtShop_Customer.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ArtShop_Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="ArtShop_Customer" runat="server">
        <div class="container-md mt-5 mb-5">
            <div class="row">
                <div class="col-sm text-center">
                    <p class="font-weight-bolder">Artwork Name</p>
                    <img src="../../../assets/image/testing/OK.JPG" width="180" height="240">
                    <p class="font-weight-lighter">Artwork Description</p>
                    <asp:Button ID="details" runat="server" Text="Details" CssClass="btn btn-outline-danger" OnClick="details_OnClick" />
                </div>
            </div>

        </div>
    </form>

</asp:Content>
