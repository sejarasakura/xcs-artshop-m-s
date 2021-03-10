<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ArtShop_Cust_Details.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ArtShop_Cust_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Import Namespace="WebApplicationAssigment.commons" %>
    <%@ Import Namespace="WebApplicationAssigment.modal" %>
    <%
        int id = Int32.Parse(Request["id"]);
        using (ArtShopEntities db = new ArtShopEntities())
        {
            art = db.Arts.Find(id);
    %>

    <!--Main layout-->
    <main class="mt-5 pt-4">
        <div class="container dark-grey-text mt-5">

            <!--Grid row-->
            <div class="row wow fadeIn">

                <!--Grid column-->
                <div class="col-md-6 mb-4">
                    <img src='<%= "https://" + HttpContext.Current.Request.Url.Authority + "/" + art.image%>' width="100%" height="auto">
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-6 mb-4">

                    <!--Content-->
                    <div class="p-4">

                        <h3 class="text-danger mb-5"><%=art.title%></h3>
                        <div class="mb-3">
                            <a href="">
                                <span class="badge purple mr-1">Category 2</span>
                            </a>
                            <a href="">
                                <span class="badge blue mr-1">New</span>
                            </a>
                            <a href="">
                                <span class="badge red mr-1">Bestseller</span>
                            </a>
                        </div>

                        <p class="lead">
                            <span class="mr-1">
                                <del>$200</del>
                            </span>
                            <span>$100</span>
                        </p>
                        
                        <p class="mb-1">Creations Date: </p>
                        <p class="mb-1">Virtual Product: </p>
                        <p class="mb-1">L &times; W &times; H: </p>
                        <p class="mb-1">Stock Remain: </p>
                        <p class="mb-1">Weight: <%= art.Painting == null? "none" : art.Painting.weight_g + " g" %></p>
                        <hr />
                        <p class="lead font-weight-bold">Description</p>
                        <p><%= art.description %></p>

                        <div class="justify-content-left">
                            <!-- Default input -->
                            <input type="number" value="1" aria-label="Search" class="form-control" style="width: 100px; margin: 0">
                        </div>

                            <div class="d-flex justify-content-center" style="margin-top: 20px">
                                <asp:Button ID="btnaddtocart" CssClass=" btn-primary btn-md my-0 p float-center" runat="server" Text="Add to Shopping Cart" OnClick="btnaddtocart_Click" />
                            </div>

                    </div>
                    <!--Content-->

                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->

            <hr>

            <!--Grid row-->
            <div class="row d-flex justify-content-center wow fadeIn">

                <!--Grid column-->
                <div class="col-md-6 text-center">

                    <h4 class="my-4 h4">Additional information</h4>

                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus suscipit modi sapiente illo soluta odit
            voluptates,
            quibusdam officia. Neque quibusdam quas a quis porro? Molestias illo neque eum in laborum.
                    </p>

                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->

        </div>
    </main>
    <!--Main layout-->

    <div class="container-lg mt-4 mb-4">
        <div class="row">
            <div class="col-md-6">
            </div>
            <div class="col-md-6 card-body d-flex flex-column">
                <h3 class="text-danger mb-5 h2"><%=art.title%></h3>
                <p class="font-weight-lighter">Art Description :<%=art.description%></p>
                <p class="font-weight-bold">Art Price : RM <%=art.price %></p>
                <p class="font-weight-lighter">Date Published : <%= art.date %></p>
                <p class="p-3 mb-2 bg-light text-dark">-------------------------------------------------------------------------</p>
                <img alt="" src="<%= Constant.PROFILE_PIC_URL %>?guid=<%= art.Artist.UserId %>" width="66" height="77" />
                <p class="font-weight-bold">Artist Name :<%= art.Artist.aspnet_Users.UserExtension.first_name + " " + art.Artist.aspnet_Users.UserExtension.last_name %>" </p>
                <p class="font-weight-lighter">Artist Motto :<%= art.Artist.description %>" </p>
                <p class="font-weight-lighter">Artist Birthday :<%= art.Artist.birthday_date %>" </p>
                <p class="mb-5"></p>
            </div>
        </div>

    </div>
    <%}%>
</asp:Content>
