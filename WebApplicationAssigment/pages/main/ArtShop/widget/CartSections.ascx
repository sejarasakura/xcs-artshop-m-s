<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartSections.ascx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.CartSections" %>

<%@ Import Namespace="WebApplicationAssigment.commons" %>
<%@ Import Namespace="WebApplicationAssigment.modal" %>

<!--Section: Block Content-->
<section>

    <div id="NoCartFound" class="float-center" runat="server"></div>
    <!--Grid row-->
    <div id="GotCart" class="row" runat="server">

        <!--Grid column-->
        <div class="col-lg-8">

            <!-- Card -->
            <div class="mb-3">
                <div class="pt-4 wish-list">

                    <h5 class="mb-4">Cart (<span><asp:Label ID="lblCount" runat="server" Text="Label"></asp:Label></span> items / <span>
                        <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label></span> items)</h5>
                    <!-- Cart Items -->
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <!-- START -->

                            <div>
                                <asp:CheckBox
                                    Checked='<%# Eval("checked") %>'
                                    ID="CheckBox1"
                                    runat="server"
                                    AutoPostBack="True"
                                    CommandName='<%# Eval("id")%>'
                                    OnCheckedChanged="CheckBox1_CheckedChanged" />
                                <div class="row mb-4">
                                    <div class="col-md-5 col-lg-3 col-xl-3">
                                        <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                                            <img class="img-fluid w-100" src="<%# Eval("image") %>" alt="Sample">
                                            <a href="#!">
                                                <div class="mask">
                                                    <img class="img-fluid w-100" src="<%# Eval("image") %>">
                                                    <div class="mask rgba-black-slight"></div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-7 col-lg-9 col-xl-9">
                                        <div>
                                            <div class="d-flex justify-content-between">
                                                <div>
                                                    <h5><%# Eval("title") %></h5>
                                                    <p class="mb-1 text-muted text-uppercase small">Creation Date: <%# Eval("date") %></p>
                                                    <p class="mb-1 text-muted text-uppercase small">Weight: <%# Eval("weight_g") + "g"%></p>
                                                    <p class="mb-1 text-muted text-uppercase small">L &times; W &times; H: <%# createdLWH(Eval("lenght_mm"), Eval("width_mm"), Eval("height_mm"))%></p>
                                                    <p class="mb-1 text-muted text-uppercase small">Virtual: <%# (bool)Eval("virtual")? "Yes": "No"%></p>
                                                </div>
                                                <div>
                                                    <div class="def-number-input number-input safari_only mb-0 w-100">
                                                        <asp:TextBox
                                                            ID="input_number"
                                                            runat="server"
                                                            TextMode="Number"
                                                            CssClass="form-control quantity"
                                                            OnTextChanged="input_number_TextChanged"
                                                            CommandName='<%# Eval("id")%>'
                                                            Enabled='<%# !(bool)Eval("virtual") %>'
                                                            AutoPostBack="true"
                                                            Text='<%# Eval("availability") %>' />
                                                    </div>
                                                    <small id="passwordHelpBlock" class="form-text text-muted text-center">(Note, 1 piece)
                                                    </small>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <a href="/pages/main/ArtShop/DeleteCart.ashx?cid=<%= cart_id %>&id=<%# Eval("id") %>"
                                                        type="button"
                                                        class="card-link-secondary small text-uppercase mr-3 text-danger"><i class="fas fa-trash-alt mr-1"></i>Remove item</a>
                                                </div>
                                                <p class="mb-0"><span><strong id="summary">RM <%# Eval("price") %></strong></span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="mb-4">
                            </div>
                            <!-- END -->
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT * FROM [vw_customer_cart2] WHERE ([user_id] = @user_id) ORDER BY add_date DESC;">
                    </asp:SqlDataSource>
                    <!-- Cart Items -->
                    <p class="text-primary mb-0">
                        <i class="fas fa-info-circle mr-1"></i>Do not delay the purchase, adding items to your cart does not mean booking them.
                    </p>

                </div>
            </div>
            <!-- Card -->

            <!-- Card -->
            <div class="mb-3">
                <div class="pt-4">

                    <h5 class="mb-4">We accept</h5>

                    <img class="mr-2" width="45px"
                        src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                        alt="Visa">
                    <img class="mr-2" width="45px"
                        src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                        alt="American Express">
                    <img class="mr-2" width="45px"
                        src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                        alt="Mastercard">
                    <img class="mr-2" width="45px"
                        src="https://mdbootstrap.com/wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.png"
                        alt="PayPal acceptance mark">
                </div>
            </div>
            <!-- Card -->

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-4">

            <!-- Card -->
            <div class="mb-3">
                <div class="pt-4">

                    <h5 class="mb-3">The total amount of</h5>

                    <ul class="list-group list-group-flush">

                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0"><%# Eval("title") %>
                                    <span>RM <%# (decimal)Eval("price") * ((int)Eval("availability"))%></span>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [vw_customer_cart2] WHERE (([checked] = @checked) AND ([user_id] = @user_id)) ORDER BY add_date DESC;">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="checked" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                            <div>
                                <strong>The total amount of</strong>
                                <strong>
                                    <p class="mb-0">(including VAT)</p>
                                </strong>
                            </div>
                            <span><strong>
                                <asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label></strong></span>
                        </li>
                    </ul>
                    <asp:Button OnClick="btnCheckout_event" ID="btnCheckout" runat="server" Text="go to checkout" CssClass="btn btn-primary from-contol" />

                </div>
            </div>
            <!-- Card -->

            <!-- Card -->
            <div class="mb-3">
                <div class="pt-4">

                    <a class="dark-grey-text d-flex justify-content-between" data-toggle="collapse" href="#collapseExample"
                        aria-expanded="false" aria-controls="collapseExample">Add a discount code (optional)
            <span><i class="fas fa-chevron-down pt-1"></i></span>
                    </a>

                    <div class="collapse" id="collapseExample">
                        <div class="mt-3">
                            <div class="md-form md-outline mb-0">
                                <input type="text" id="discount-code" class="form-control font-weight-light"
                                    placeholder="Enter discount code">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Card -->

        </div>
        <!--Grid column-->

    </div>
    <!-- Grid row -->

</section>
<!--Section: Block Content-->
