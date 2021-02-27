<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Your Shopping Cart" Font-Size="X-Large"></asp:Label>


    <div class="container">
        <div class="row">
            <div class="col-md-12 d-flex justify-content-center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True">
                    <EmptyDataTemplate>
                        <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available matching your selected
        filter. Click on "Add New" button to enter new data .. </span>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                        <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                        <asp:BoundField DataField="category_id" HeaderText="category_id" SortExpression="category_id" />
                        <asp:BoundField DataField="availability" HeaderText="availability" SortExpression="availability" />
                        <asp:BoundField DataField="add_date" HeaderText="add_date" SortExpression="add_date" />
                    </Columns>
                </asp:GridView>

                
            </div>
            <div class="col-md-12 text-right">
                <asp:Label ID="Label2" runat="server" Text="Total price : "></asp:Label>
            </div>

            <div class="col-md-12 text-right">
                <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Text="Check Out to payment" />
            </div>

        </div>
    </div>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtShop.mdf;Integrated Security=True;MultipleActiveResultSets=True;Connect Timeout=30;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [vw_customer_cart]"></asp:SqlDataSource>


</asp:Content>
