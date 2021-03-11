<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.Test" %>

<%@ Register Src="~/pages/main/Authentication/Widget/AddressPicker.ascx" TagPrefix="uc1" TagName="AddressPicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

      <div class="row">
        <div class="col-lg-4 mt-3 mb-4">

          <!-- Section: Categories -->
          <section>

            <h5 class="mb-3">Categories</h5>

            <div class="text-muted small text-uppercase mb-5">

              <p class="mb-3"><a href="#!" class="card-link-secondary">Vegetables</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Fruits</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Herbs</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Bread</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Pasta</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Buts</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Legumes</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Spices</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Coffee</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Active</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Tea</a></p>
              <p class="mb-3"><a href="#!" class="card-link-secondary">Dry fruits</a></p>

            </div>

          </section>
          <!-- Section: Categories -->


        </div>
        <div class="col-lg-8">

          <!-- Section: Block Content -->
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
          <!-- Section: Block Content -->

          <!--Section: Block Content-->
          <section>

            <!-- Grid row -->
            <div class="row mb-4">

              <!-- Grid column -->
              <div class="col-md-6 col-lg-4 mb-4">

                <!-- Card -->
                <div class="">

                  <div class="view zoom z-depth-2 rounded">
                    <img class="img-fluid w-100" src="https://mdbootstrap.com/img/Photos/Horizontal/Eco/img(77).jpg" alt="Sample">
                    <a href="#!">
                      <div class="mask waves-effect waves-light"></div>
                    </a>
                  </div>

                  <div class="text-center pt-4">

                    <h5 class="mb-0">Organic green grapes</h5>
                    <h6 class="mb-3">$ 12.99</h6>
                    <button type="button" class="btn btn-primary btn-sm mr-1 waves-effect waves-light"><i class="fas fa-cart-plus"></i></button>
                    <button type="button" class="btn btn-light btn-sm waves-effect waves-light"><i class="fas fa-info-circle pr-2"></i>Details</button>

                  </div>

                </div>
                <!-- Card -->

              </div>
              <!-- Grid column -->
            </div>
            <!-- Grid row -->

          </section>
          <!--Section: Block Content-->

        </div>
      </div>

    </div>
</asp:Content>
