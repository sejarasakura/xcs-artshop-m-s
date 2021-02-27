﻿<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ShoppingCart" %>

<%@ Import Namespace="WebApplicationAssigment.modal" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="container">

        <div class="row">
            <div class="col-md-12 d-flex justify-content-center">
                <asp:Label ID="Label1" runat="server" Text="Your Shopping Cart" CssClass="text-lg-center"></asp:Label>
            </div>
            <center>
            <div id="preview" class="float-center" runat="server"></div>
                </center>
            <br>
            <div class="col-md-12 d-flex justify-content-center">

                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    class="table table-borderless table-condensed table-responsive table-hover "
                    AutoGenerateColumns="False"
                    AutoGenerateDeleteButton="False"
                    DataSourceID="SqlDataSource1"
                    ShowHeaderWhenEmpty="True">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Art Image" SortExpression="image">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image", "~/{0}")%>' Height="50" Width="50" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Art Title" SortExpression="title">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Added Date" SortExpression="add_date">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("add_date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Availability" SortExpression="availability">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# setAvability((int)Eval("availability")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category Id" SortExpression="category_id">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# setCatergory((int)Eval("category_id")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price" SortExpression="price">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("price", "RM {0:0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remove" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton
                                    ID="btnRemoveItem"
                                    runat="server"
                                    CausesValidation="false"
                                    Text="&#x1F5D1;"
                                    ControlStyle-CssClass="text-danger"
                                    CommandArgument='<%# Eval("art_id") %>'
                                    OnCommand="btnDeleteEvent" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtShop.mdf;Integrated Security=True;MultipleActiveResultSets=True;Connect Timeout=30;Application Name=EntityFramework" ProviderName="System.Data.SqlClient"
                    SelectCommand="SELECT * FROM [vw_customer_cart] WHERE user_id = @user_id"
                    DeleteCommand="DELETE FROM [CartDetails] WHERE [cart_id] = @cart_id AND [art_id] = @art_id">
                    <SelectParameters>
                        <asp:Parameter Name="user_id" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="cart_id" Type="Int32" />
                        <asp:Parameter Name="art_id" Type="Int32" />
                    </DeleteParameters>

                </asp:SqlDataSource>


            </div>
            <div class="col-md-12 text-right">
                <asp:Label ID="totalprice" runat="server" Text="TOTAL:"></asp:Label>
            </div>

            <div class="col-md-12 text-right">
                <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Text="Check Out to payment" />
            </div>

        </div>
    </div>





</asp:Content>
