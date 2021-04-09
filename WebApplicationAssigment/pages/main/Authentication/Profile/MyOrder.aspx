<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.Profile.MyOrder" %>
<%@ Import Namespace="WebApplicationAssigment.modal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
        <h2>My Order</h2>
        <p>Look for more product go to <a href="Shop.aspx">Shop Now</a></p>
        <br>
        <div id="preview" runat="server"></div>
        <br>
        <asp:Repeater
            ID="RepeaterOrder"
             DataSourceID="SqlDataSource2"
            runat="server" OnItemDataBound="RepeaterOrder_ItemDataBound">
            <ItemTemplate>
                <div class="well well-md">
                    <div class="row">
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-6 text-right">
                            <h5>
                                <span class="label <%# convert_css_class((PaymentStatu)Eval("payment_status")) %>" style="border-radius: 30px">
                                    <%# convert_user_role((PaymentStatu)Eval("payment_status")) %>
                                </span>
                            </h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <%# Eval("payment_date", "{0:dddd, dd MMMM yyyy}")  %>
                        </div>
                        <div class="col-sm-6 text-right">
                            Manage order:
                            <asp:Literal ID="MyLiteral" runat="server" Text='<%# Eval("id")  %>' />
                        </div>
                    </div>
                    <table class="table table-striped">
                        <tbody>
                            <asp:Repeater
                                ID="RepeaterOrderDetails"
                                runat="server">
                                <ItemTemplate>
                                    <div>
                                        <tr>
                                            <!-- Join Order Details and Art Where order_id = x-->
                                            <!-- artist_name as description -->
                                            <td><%# Eval("description")  %></td>
                                            <td><%# Eval("name")  %></td>
                                            <td>
                                                <asp:Image ID="Image1"
                                                    Height="100"
                                                    Width="100"
                                                    runat="server"
                                                    ImageUrl='~<%# Eval("image")%>' />
                                            </td>
                                            <!-- product_quantity as qantity -->
                                            <td><%# Eval("artist_id")  %></td>
                                            <td><%# Eval("price")  %></td>
                                        </tr>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-6">
                            <%-- Paid --%>
                            <asp:HyperLink
                                CssClass="btn btn-warning pull-right"
                                Text="Make Payment"
                                runat="server"
                                ID="PaymentBtn"
                                NavigateUrl='<%# "Payment.aspx?order=" + Eval("id") %>'
                                Enabled='true'
                                Visible='true' />
                            <%-- Cancle Order --%>
                            <asp:Button
                                CssClass="btn btn-danger pull-right"
                                Text="Cancel Order"
                                runat="server"
                                ID="CancleBtn"
                                CommandArgument='<%# Eval("id")  %>'
                                Enabled='true'
                                Visible='true' />
                        </div>
                    </div>
                </div>
                <br />
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [Payment] WHERE ([UserId] = @user_id) ORDER BY add_date DESC;">
        </asp:SqlDataSource>
    </div>

</asp:Content>
