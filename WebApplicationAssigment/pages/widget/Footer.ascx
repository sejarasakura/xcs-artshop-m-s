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
        <div class="col-sm-6">

            <div class="row">
                <div class="col-sm-6 artshop-footer-widget">
                  <h2 class="artshop-footer-title-style">Comapny name</h2>
                    <p class="artshop-footer-style">
                        Company bussiness rules
                    </p>
                </div>
                <div class="col-sm-6 artshop-footer-widget">
                  <h5 class="artshop-footer-title-style">Contact</h5>
                  <p><i class="fas fa-headphones-alt text-primary"></i> 
                      <span class="artshop-footer-style">+6018-392-7135</span>
                  </p>
                  <p><i class="fas fa-envelope text-primary"></i> 
                      <span class="artshop-footer-style">+6018-392-7135</span>
                  </p>
                  <p><i class="fas fa-headphones-alt text-primary"></i> 
                      <span class="artshop-footer-style">+6018-392-7135</span>
                  </p>
                </div>
            </div>

        </div>
        <div class="col-sm-6">

            <div class="row">
              <div class="col-sm-4">
                  <h5 class="artshop-footer-title-style">Pages</h5>
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                          About US
                      </a>
                  </div>
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                          Home
                      </a>
                  </div>     
                  <div class="footer-zoom">
                      <a href="#" class="artshop-footer-style">
                          Development Theme
                      </a>
                  </div>
              </div>
              <div class="col-sm-4">

              </div>
              <div class="col-sm-4">

              </div>
            </div>

        </div>
      </div>
    </div>

    <hr style="margin:20px 10px 0 10px"/>
        <!-- Add div row and grid-->
        <!-- Use pull left or right-->
    <div>

    </div>
</footer>