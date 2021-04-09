<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ArtShop_Cust_Details.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ArtShop_Cust_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Import Namespace="WebApplicationAssigment.commons" %>
    <%@ Import Namespace="WebApplicationAssigment.modal" %>
    <%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
    <%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>


    <%
        int id = Int32.Parse(Request["id"]);
        id = id == null ? 0 : id;
        using (ArtShopEntities db = new ArtShopEntities())
        {
            art = db.Arts.Find(id);
    %>
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <!--Main layout-->
    <main class="mt-5 pt-4">
        <div class="container dark-grey-text mt-5">

            <div class="row wow fadeIn">

                <div class="col-md-6 mb-4">
                    <img src='<%= "https://" + HttpContext.Current.Request.Url.Authority + "/" + art.image%>' width="100%" height="auto">
                </div>
                <div class="col-md-6 mb-4">


                    <!--Content-->
                    <div class="p-4">

                        <h3 class="text-danger mb-5"><%=art.title%></h3>
                        <div class="mb-3">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <span class="mb-1">
                                        <a href="ArtShop_Customer.aspx?cid=<%# Eval("id") %>" class="card-link-secondary">
                                            <span
                                                style='background-color: <%# Eval("color") %>; padding: 5px'
                                                class="badge mr-1"><%# Eval("name") %>
                                            </span>
                                        </a>
                                    </span>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource
                                ID="SqlDataSource1"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT * FROM Category INNER JOIN CategoryDetails ON CategoryDetails.category_id = Category.id WHERE CategoryDetails.art_id = @art_id ORDER BY permission_level DESC">
                                <SelectParameters>
                                    <asp:querystringparameter name="art_id" type="Int32" querystringfield="id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <p class="lead">
                            <span class="mr-1">
                                <del>$200</del>
                            </span>
                            <span>$100</span>
                        </p>
                        
                        <p class="mb-1">Creations Date: <i><%= art.date %></i></p>
                        <p class="mb-1">Virtual Product: <i> <%= art.@virtual? "Yes": "No"%></i></p>
                        <p class="mb-1">L &times; W &times; H: <i><%= createdLWH(art.Painting.lenght_mm, art.Painting.width_mm, art.Painting.height_mm)%></i></p>
                        <p class="mb-1">Stock Remain: <i><%= art.Painting.quantity %></i></p>
                        <p class="mb-1">Weight: <i><%= art.Painting == null? "none" : art.Painting.weight_g + " g" %></i></p>
                        <hr />
                        <p class="lead font-weight-bold">Description</p>
                        <p><%= art.description %></p>

                        <div class="row">
                            <div class="col-sm-6">
                                <asp:TextBox ID="quantity" runat="server" Txet="1" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator1"
                                    ControlToValidate="quantity" 
                                    runat="server"
                                    ErrorMessage="Only Numbers allowed"
                                    ValidationExpression="\d+">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="col-sm-6">
                                <asp:Button ID="btnaddtocart" CssClass=" btn-primary btn-md my-0 p float-center form-control" runat="server" Text="Add to Shopping Cart" OnClick="btnaddtocart_Click" />
                            </div>
                        </div>


                    </div>
                    <!--Content-->


                </div>
            </div>
            <hr>
            <h4 class="my-4 h4">About Artist: </h4>
            
            <div class="row d-flex justify-content-center wow fadeIn">
                <div class="col-md-6 text-center">
                    <div class="row mt-3 wow fadeIn" data-wow-delay="0.2s" style="visibility: visible; animation-name: fadeIn; animation-delay: 0.2s;">
                      <!-- Place for photo -->
                      <div class="col-lg-4 mb-5 flex-center">
                        <div class="view z-depth-1">
                          <img src="<%= Constant.PROFILE_PIC_URL %>?guid=<%= art.Artist.UserId %>" class="img-fluid z-depth-1" alt="">
                        </div>
                      </div>
                      <!-- Text content -->
                      <div class="col-lg-7 ml-3">
                        <h3 class="font-weight-bold"><%= art.Artist.aspnet_Users.UserExtension.first_name + " " + art.Artist.aspnet_Users.UserExtension.last_name %></h3>
                        <hr>
                        <p align="justify" class="mt-4"><span><%= art.Artist.description %></span></p>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!--Main layout-->
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
    <%}%>
</asp:Content>
