<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ArtShop_Customer.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ArtShop_Customer" %>

<%@ Import Namespace="WebApplicationAssigment.modal" %>
<%@ Import Namespace="WebApplicationAssigment.commons" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            text-align: center;
            height: 77px;
        }

        .auto-style5 {
            text-align: center;
            height: 281px;
        }

        .auto-style6 {
            text-align: center;
            height: 84px;
        }

        .center-cropped {
            width: 100px;
            height: 100px;
            background-position: center center;
            background-repeat: no-repeat;
            overflow: hidden;
        }

            /* Set the image to fill its parent and make transparent */
            .center-cropped img {
                min-height: 100%;
                min-width: 100%;
                /* IE 8 */
                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
                /* IE 5-7 */
                filter: alpha(opacity=0);
                /* modern browsers */
                opacity: 0;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">

        <div class="row">
            <div class="col-lg-4 mt-3 mb-4">

                <section>

                    <h5 class="mb-3">Categories</h5>

                    <div class="text-muted small text-uppercase mb-5">
                        <%if (Request.QueryString["cid"] != null){
                                using (ArtShopEntities db = new ArtShopEntities())
                                {
                                    cat = db.Categories.Find(int.Parse(Request.QueryString["cid"]));
                        %>
                            <h3 class="mb-1"><%= cat.name %></h3>
                            <p class="mb-1"><%= cat.description %></p>
                            <hr />
                        <%
                                }
                            }else{ %>
                            <h3 class="mb-1">All products</h3>
                        <%}%>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <span class="mb-1">
                                    <a href="?cid=<%# Eval("id") %>" class="card-link-secondary">
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
                            SelectCommand="SELECT * FROM Category ORDER BY permission_level DESC"></asp:SqlDataSource>
                    </div>

                </section>

            </div>
            <div class="col-lg-8">

                <section>

                    <div class="row d-flex justify-content-around align-items-center mb-4" style="margin-top: 20px;">
                        <div class="col-12 col-md-3 text-center text-md-left">
                            <a href="#!" class="text-reset"><i class="fas fa-th-list fa-lg mr-1"></i></a>
                            <a href="#!" class="text-reset"><i class="fas fa-th-large fa-lg"></i></a>
                        </div>
                        <div class="col-12 col-md-5">
                            <div class="d-flex flex-wrap">
                            </div>
                        </div>
                        <div class="col-12 col-md-4 text-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center float-md-right mb-0">
                                    <li class="page-item"><a class="page-link waves-effect waves-effect"><i class="fas fa-chevron-left"></i></a></li>
                                    <li class="page-item active"><a class="page-link waves-effect waves-effect">1</a></li>
                                    <li class="page-item"><a class="page-link waves-effect waves-effect"><i class="fas fa-chevron-right"></i></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                </section>

                <section>

                    <div class="row mb-4" id="data_frame" runat="server">
                        <%
                            using (ArtShopEntities db = new ArtShopEntities())
                            {
                                Art[] arts = db.Arts.ToArray();
                                for (i = 0; i < arts.Length; i++)
                                {
                        %>

                        <div class="col-md-6 col-lg-4 mb-4">

                            <!-- Cart -->
                            <div class="">

                                <div class="view zoom z-depth-2 rounded">

                                    <img class="img-fluid w-100" src='<%= arts[i].image%>' alt="Sample">
                                    <a href="<%= Constant.ARTSHOP_URL %>/ArtShop_Cust_Details.aspx?id=<%= arts[i].id %>">
                                        <div class="mask waves-effect waves-light"></div>
                                    </a>
                                </div>

                                <div class="text-center pt-4">
                                    <h5 class="mb-0"><%= arts[i].title%></h5>
                                    <h6 class="mb-3">BY <%= arts[i].Artist.aspnet_Users.UserExtension.first_name %> <%= arts[i].Artist.aspnet_Users.UserExtension.last_name %></h6>
                                    <a href="AddToCart.ashx?pid=<%= arts[i].id %>" class="btn btn-primary btn-sm mr-1 waves-effect waves-light"><i class='fas fa-cart-plus'></i></a>
                                    <a href="<%= Constant.ARTSHOP_URL %>/ArtShop_Cust_Details.aspx?id=<%= arts[i].id %>" class="btn btn-light btn-sm waves-effect waves-light"><i class="fas fa-info-circle pr-2"></i>Details</a>
                                </div>

                            </div>
                            <!-- Card -->

                        </div>
                        <%
                                }
                            }

                        %>
                    </div>

                </section>

            </div>
        </div>

    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>
