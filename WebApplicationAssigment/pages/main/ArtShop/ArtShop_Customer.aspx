<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ArtShop_Customer.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ArtShop_Customer" %>

<%@ Import Namespace="WebApplicationAssigment.modal" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Art Shop</h2>

        <br>
        <div id="preview" runat="server"></div>
        <br>
        <div>
        <!--Email-->
        <%
            using (ArtShopEntities db = new ArtShopEntities())
            {
                Art[] arts = db.Arts.ToArray();
                for (int i = 0; i < arts.Length; i++)
                {
                    if ((i % 3) == 0)
                    {
        %>
        </div>
        <div class="row">
            <%
                }
            %>
            <div class="col-lg-4 col-sm-4">
                <a style="color: inherit; text-decoration: none" href="ArtShop_Cust_Details.aspx?id=<% =arts[i].id%>">
                    <div class="card" style="margin-top:60px">
                        <div class="card-header">
                            <h4><%= arts[i].title%></h4>    
                        </div>
                        <div class="card-body">
                            <img
                                class="pull-left"
                                src='<%= "https://" + HttpContext.Current.Request.Url.Authority + "/" + arts[i].image%>' 
                                alt="<%= arts[i].title%>"
                                width="100%"
                                height="480px">
                        </div>
                        <div class="card-footer">
                            <div class="row">
                            </div>
                            <div class="row">
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%
                }
            }
        %>
    </div>

    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtShop.mdf;Integrated Security=True;MultipleActiveResultSets=True;Connect Timeout=30;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [image], [title] FROM [Art]"></asp:SqlDataSource>

    </div>
</asp:Content>
