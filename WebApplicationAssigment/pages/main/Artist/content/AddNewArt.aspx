<%@ Page Title="Add New Art" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="AddNewArt.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Artist.content.AddNewArt" %>

<%@ Register Src="~/pages/widget/StartPage.ascx" TagPrefix="uc1" TagName="StartPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a {
            color: #f8f9fa;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="page-header col-xs-12 col-sm-12">
                <h1 style="font-size: 28px">Add New Art </h1>
                <p style="font-family: 'Bauhaus 93'">Add your new arts to sell.</p>

            </div>
        </div>
        
        <div id="preview" runat="server"></div>
        <br>

        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xs-offset-3">


                <!--Title-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="usr">Art Title:</label>
                            <asp:TextBox
                                CssClass="form-control"
                                ID="TitleText"
                                placeholder="Please enter art title"
                                Text=""
                                Rows="1"
                                mode="multiline"
                                runat="server" />
                            <asp:RequiredFieldValidator
                                CssClass="alert alert-danger"
                                runat="server"
                                ID="RequiredFieldValidator1"
                                ControlToValidate="TitleText"
                                ErrorMessage="Please enter your title!" />
                            <asp:RegularExpressionValidator
                                CssClass="alert alert-danger"
                                Display="Dynamic"
                                ControlToValidate="Discription"
                                ID="RegularExpressionValidator1"
                                ValidationExpression="[\s\S]{10,150}$"
                                runat="server"
                                ErrorMessage="The description only accept max 50 word only" />
                        </div>
                    </div>
                </div>

                <!--Discription-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="usr">Discription:</label>
                            <asp:TextBox
                                CssClass="form-control"
                                ID="Discription"
                                placeholder="Please enter description"
                                Text=""
                                Rows="4"
                                mode="multiline"
                                runat="server" />
                            <asp:RequiredFieldValidator
                                CssClass="alert alert-danger"
                                runat="server"
                                ID="RequiredFieldValidator4"
                                ControlToValidate="Discription"
                                ErrorMessage="Please enter your description!" />
                            <asp:RegularExpressionValidator
                                CssClass="alert alert-danger"
                                Display="Dynamic"
                                ControlToValidate="Discription"
                                ID="RegularExpressionValidator6"
                                ValidationExpression="[\s\S]{0,250}$"
                                runat="server"
                                ErrorMessage="The description only accept max 250 word only" />
                        </div>
                    </div>
                </div>

                <!--Price-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="usr">Price :</label>
                            <asp:TextBox
                                CssClass="form-control"
                                ID="Price"
                                placeholder="eg 99.9 or 99.99"
                                Text=""
                                runat="server" />
                            <asp:RequiredFieldValidator
                                CssClass="alert alert-danger"
                                runat="server"
                                ID="RequiredFieldValidator"
                                ControlToValidate="Price"
                                ErrorMessage="Please enter the sales price!" />
                            <asp:RegularExpressionValidator
                                CssClass="alert alert-danger"
                                Display="Dynamic"
                                ControlToValidate="Price"
                                ID="RegularExpressionValidator2"
                                ValidationExpression="^\d{0,8}(\.\d{1,2})?$"
                                runat="server"
                                ErrorMessage="The price too large" />
                        </div>
                    </div>
                </div>

                <!--Date Creation-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="pwd">Date creation:</label>
                            <asp:TextBox
                                type="date"
                                CssClass="form-control"
                                ID="DateCreation"
                                placeholder="Please Enter date creation"
                                runat="server" />
                            <asp:RequiredFieldValidator
                                CssClass="alert alert-danger"
                                runat="server"
                                ID="RequiredFieldValidator6"
                                ControlToValidate="DateCreation"
                                ErrorMessage="Please enter date of creation!" />
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="pwd">Upload Image:</label>
                            <asp:FileUpload
                                type="file"
                                name="file"
                                onchange="previewFile()"
                                CssClass="form-control"
                                ID="xFileUpload"
                                placeholder="Upload your profile picture"
                                runat="server" />
                        </div>
                    </div>
                </div>

                <!-- Load picture functions -->
                <script type="text/javascript">
                    function previewFile() {
                        var preview = document.querySelector('#<%=Image1.ClientID %>');
           var file = document.querySelector('#<%=xFileUpload.ClientID %>').files[0];
                        var reader = new FileReader();

                        reader.onloadend = function () {
                            preview.src = reader.result;
                        }

                        if (file) {
                            reader.readAsDataURL(file);
                        } else {
                            preview.src = "";
                        }
                    }
                </script>

                <a class="btn btn-secondary" href='<%= "https://" + HttpContext.Current.Request.Url.Authority+"/pages/main/Artist/content/ReadUpdateDeleteArt.aspx"%>'>Back</a>
                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Add Art" OnClick="btnSubmit_Click" />
            </div>

            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xs-offset-3">
                <asp:Image CssClass="center" ImageUrl="~/assets/image/no_img.jpg" ID="Image1" runat="server" length="700px" Width="500px" />
            </div>
        </div>

    </div>

</asp:Content>

