<%@ Page Title="Add New Art" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="AddNewArt.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Artist.content.WebForm1" %>
<%@ Register Src="~/pages/widget/StartPage.ascx" TagPrefix="uc1" TagName="StartPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="container">
  <div class="row">               
          <div class="page-header col-xs-12 col-sm-12">
        <h1 style="font-size:28px">Add New Art </h1>
              <p style="font-family:'Bauhaus 93'">Add your new arts to sell.</p>
      </div>
  </div>
  <div class="row">
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xs-offset-3">
          <form id="contact-form" class="form" action="#" method="POST" role="form">
              <div class="form-group">
                  <label class="form-label" for="name">Your Name :</label><br><br>
                  <input type="text" class="form-control" id="name" name="name" placeholder="Your name" tabindex="1" required>
              </div>                            
              <div class="form-group">
                  <label class="form-label" for="email">Your Email :</label><br><br>
                  <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" tabindex="2" required>
              </div>                            
              <div class="form-group">
                  <label class="form-label" for="subject">Subject :</label><br><br>
                  <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" tabindex="3">
              </div>                            
              <div class="form-group">
                  <label class="form-label" for="message">Description :</label><br><br>
                  <textarea rows="5" cols="50" name="message" class="form-control" id="message" placeholder="Message..." tabindex="4" required></textarea>                                 
              </div>

             <div class="form-group">
                <label for="exampleFormControlFile1">Example file input :</label><br><br>
                <input type="file" class="form-control-file" id="exampleFormControlFile1">
              </div>
              <div class="text-left">
                  <button type="submit" class="btn btn-primary"> Add Art </button>
                 
              </div>
          </form>
      </div>
  </div>
</div>

</asp:Content>

