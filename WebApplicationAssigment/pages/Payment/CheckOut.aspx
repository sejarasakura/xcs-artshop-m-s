<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="WebApplicationAssigment.pages.Payment.CheckOut" %>

<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
        <section>

            <!--Grid row-->
            <div class="row">

                <!--Grid column-->
                <div class="col-lg-8 mb-4">

                    <!-- Card -->
                    <div class="card wish-list pb-1">
                        <div class="card-body">

                            <h5 class="mb-2">Billing details</h5>

                            <!-- Grid row -->
                            <div class="row">

                                <!-- Grid column -->
                                <div class="col-lg-6">

                                    <!-- First name -->
                                    <div class="md-form md-outline mb-0 mb-lg-4">
                                        <asp:TextBox
                                            CssClass="form-control mb-0"
                                            ID="first"
                                            runat="server">
                                        </asp:TextBox>
                                        <label for="firstName">First name</label>
                                    </div>

                                </div>
                                <!-- Grid column -->

                                <!-- Grid column -->
                                <div class="col-lg-6">

                                    <!-- Last name -->
                                    <div class="md-form md-outline">
                                        <asp:TextBox
                                            CssClass="form-control mb-0"
                                            ID="last"
                                            runat="server">
                                        </asp:TextBox>
                                        <label for="lastName">Last name</label>
                                    </div>

                                </div>
                                <!-- Grid column -->

                            </div>
                            <!-- Grid row -->

                            <!-- Company name -->
                            <div class="md-form md-outline my-0">
                                <asp:TextBox
                                    CssClass="form-control mb-0"
                                    ID="companyName"
                                    runat="server">
                                </asp:TextBox>
                                <label for="companyName">Company name (optional)</label>
                            </div>

                            <!-- Phone -->
                            <div class="md-form md-outline">
                                <asp:TextBox
                                    CssClass="form-control mb-0"
                                    ID="phone"
                                    runat="server">
                                </asp:TextBox>
                                <label for="form18">Phone</label>
                            </div>

                            <!-- Additional information -->
                            <div class="md-form md-outline">
                                <textarea id="form76" class="md-textarea form-control" runat="server" rows="4"></textarea>
                                <label for="form76">Additional information</label>
                            </div>

                            <div class="form-check pl-0 mb-4 mb-lg-0">
                                <input type="checkbox" class="form-check-input filled-in" id="new3">
                                <label class="form-check-label small text-uppercase card-link-secondary" for="new3">
                                    Create an
              account?</label>
                            </div>

                        </div>
                    </div>
                    <!-- Card -->

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4">

                    <!-- Card -->
                    <div class="card mb-4">
                        <div class="card-body">

                            <h5 class="mb-3">The total amount of</h5>

                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">Temporary amount
              <span>$53.98</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0">Shipping
              <span>Gratis</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                    <div>
                                        <strong>The total amount of</strong>
                                        <strong>
                                            <p class="mb-0">(including VAT)</p>
                                        </strong>
                                    </div>
                                    <span><strong>$53.98</strong></span>
                                </li>
                            </ul>

                            <button type="button" class="btn btn-primary btn-block waves-effect waves-light">Make purchase</button>

                        </div>
                    </div>
                    <!-- Card -->

                    <!-- Card -->
                    <div class="card mb-4">
                        <div class="card-body">

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
            <!--Grid row-->

        </section>
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
    <script>
        $(document).ready(function () {
            $('.mdb-select').materialSelect();
            $('.select-wrapper.md-form.md-outline input.select-dropdown').bind('focus blur', function () {
                $(this).closest('.select-outline').find('label').toggleClass('active');
                $(this).closest('.select-outline').find('.caret').toggleClass('active');
            });
        });
    </script>
</asp:Content>
