<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.Footer" %>
<style>
    .artshop-footer-widget{
        padding: 0 25px;
    }
    .artshop-footer-li{
        list-style-type:none;
    }
    .artshop-footer-style{
        font-family: "Hind",-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Oxygen-Sans,Ubuntu,Cantarell,'Helvetica Neue',sans-serif;
        font-weight: 400;
        font-style: normal;
        font-size: 16px;
        text-transform: none;
        letter-spacing: 0;
        line-height: 24px;
        color: rgba(132,137,145,1);
    }
    .artshop-footer-title-style {
        font-family: "proxima-nova",-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Oxygen-Sans,Ubuntu,Cantarell,'Helvetica Neue',sans-serif;
        font-weight: 600;
        font-style: normal;
        font-size: 18px;
        text-transform: none;
        letter-spacing: -0.01em;
        line-height: 30px;
        color: #333333!important;
    }
    .footer-zoom:hover {
        transform: translateX(14px);
        transition-duration: 0.7s;
    }
    .footer-zoom{
        transition-duration: 0.7s;
    }
</style>
<footer id="bottom-widgets">
    <div id="tatsu-footer-container">
      <div class="row">
        <div class="col-sm-5 ">

            <div class="row">
                <div class="col-sm-6 artshop-footer-widget">
                  <h2 class="artshop-footer-title-style">*Company name*</h2>
                    <p class="artshop-footer-style">
                        *Company bussiness rules*
                    </p>
                </div>
                <div class="col-sm-6 artshop-footer-widget">
                  <h5 class="artshop-footer-title-style">Contact</h5>
                  <p><i class="fas fa-headphones-alt text-primary"></i> 
                      <span class="artshop-footer-style">+6018-392-7135</span>
                  </p>
                  <p><i class="fas fa-envelope text-primary"></i> 
                      <span class="artshop-footer-style">company@gmail.com</span>
                  </p>
                  <p><i class="fas fa-map-marked-alt text-primary"></i>
                      <span class="artshop-footer-style">1-chōme-11 Nishikubo, Musashino, Tokyo 180-0013, Japan 35°42'14.7"N 139°33'27.8"E</span>
                  </p>
                </div>
            </div>

        </div>

        <div class="col-sm-7">

            <div class="row">
              <div class="col-sm-4 ">
                  <h5 class="artshop-footer-title-style  ">For artist</h5>
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                          Profile
                      </a>
                  </div>
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                          Sell history
                      </a>
                  </div>     
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                          My Art
                      </a>
                  </div>
              </div>
              <div class="col-sm-4">
                  <h5 class="artshop-footer-title-style">For buyer</h5>
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                         Profile
                      </a>
                  </div>
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                         Payment History
                      </a>
                  </div>     
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                         View cart
                      </a>
                  </div>
              </div>
              <div class="col-sm-4">
                  <h5 class="artshop-footer-title-style">Categories</h5>
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                          Paint
                      </a>
                  </div>
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                          Photograph
                      </a>
                  </div>     
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                          Drawing
                      </a>
                  </div>
              </div>
            </div>

        </div>
      </div>
    </div>

    <hr style="margin:20px 10px 0 10px"/>
        <!-- Add div row and grid-->
     
     <div class="row ml-1">
    <div>
     <span class="artshop-footer-style">Copyright © 2019 Brand Exponents. All Rights Reserved</span>
        </div>
    <div class="ml-auto mr-4">  <!--ml-auto to pull/float right , mr-4/ml-4 adjust pos -->
        <i class="fab fa-instagram-square"></i>
        </div>
        <!-- Use pull left or right-->
    <div>
 </div>
          </div>


   
</footer>