<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ArtShop_Cust_Details.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ArtShop_Cust_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-lg mt-4 mb-4">
        <div class="row">
            <div class="col-md-6">
                <img src='<%= "https://" + HttpContext.Current.Request.Url.Authority + "/" + art.image%>' width="100%" height="auto">
            </div>
            <div class="col-md-6 card-body d-flex flex-column">
                <h3 class="text-danger mb-5"><%=art.title%></h3>
                <p class="font-weight-lighter"><%=art.description%></p>
                <p class="font-weight-bolder">RM <%=art.price %></p>
                <p class="font-weight-lighter">Date Published : <%= art.date %></p>
                <p class="mb-5"></p>
                <p class="mb-5"></p>
                <p class="mb-5"></p>
                <asp:Button ID="Button1" Cssclass="align-self-end btn btn-warning mt-5" runat="server" Text="Add to Shopping Cart" OnClick="Button1_Click" />
            </div>
        </div>

    </div>
</asp:Content>
