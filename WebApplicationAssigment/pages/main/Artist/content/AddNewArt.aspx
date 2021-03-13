<%@ Page Title="Add New Art" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="AddNewArt.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Artist.content.AddNewArt" %>

<%@ Register Src="~/pages/widget/StartPage.ascx" TagPrefix="uc1" TagName="StartPage" %>
<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a {
            color: #f8f9fa;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
        <div class="row">
            <div class="page-header col-xs-12 col-sm-12">
                <h1 style="font-size: 28px">Add New Art </h1>
                <p style="font-family: 'Bauhaus 93'">Add your new arts to sell.</p>

            </div>
        </div>

        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

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
                                ValidationGroup="AddNewArt"
                                Rows="1"
                                mode="multiline"
                                runat="server" />
                            <asp:RequiredFieldValidator
                                CssClass="alert alert-danger"
                                runat="server"
                                ID="RequiredFieldValidator1"
                                ControlToValidate="TitleText"
                                ValidationGroup="AddNewArt"
                                ErrorMessage="Please enter your title!" />
                            <asp:RegularExpressionValidator
                                CssClass="alert alert-danger"
                                Display="Dynamic"
                                ControlToValidate="Discription"
                                ValidationGroup="AddNewArt"
                                ID="RegularExpressionValidator1"
                                ValidationExpression="[\s\S]{0,150}$"
                                runat="server"
                                ErrorMessage="The description only accept max 50 word only" />
                        </div>
                    </div>
                </div>
                <!--Category-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="usr">Category:</label>
                            <asp:DropDownList ID="Category" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [id] FROM [Category]"></asp:SqlDataSource>

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
                                ValidationGroup="AddNewArt"
                                ErrorMessage="Please enter your description!" />
                            <asp:RegularExpressionValidator
                                CssClass="alert alert-danger"
                                Display="Dynamic"
                                ControlToValidate="Discription"
                                ValidationGroup="AddNewArt"
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
                                ValidationGroup="AddNewArt"
                                ControlToValidate="Price"
                                ErrorMessage="Please enter the sales price!" />
                            <asp:RegularExpressionValidator
                                CssClass="alert alert-danger"
                                Display="Dynamic"
                                ValidationGroup="AddNewArt"
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
                                ValidationGroup="AddNewArt"
                                ID="DateCreation"
                                placeholder="Please Enter date creation"
                                runat="server" />
                            <asp:RequiredFieldValidator
                                CssClass="alert alert-danger"
                                runat="server"
                                ValidationGroup="AddNewArt"
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
                                ValidationGroup="AddNewArt"
                                onchange="previewFile()"
                                CssClass="form-control"
                                ID="xFileUpload"
                                placeholder="Upload your profile picture"
                                runat="server" />
                        </div>
                    </div>
                </div>


                <div id="NotVirtualExtensions" runat="server" visible="false">
                    <fieldset class="form-group border p-3">
                        <legend class="w-auto px-2">Solid Products</legend>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="pwd">Quantity:</label>
                                    <asp:TextBox
                                        TextMode="Number"
                                        CssClass="form-control"
                                        ID="txbQuantity"
                                        ValidationGroup="AddNewArt"
                                        placeholder="Please Enter quantity available"
                                        runat="server" />
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator7"
                                        runat="server"
                                        SetFocusOnError="true"
                                        Display="Dynamic"
                                        ValidationGroup="AddNewArt"
                                        ControlToValidate="txbQuantity"
                                        ErrorMessage="Number Required"
                                        ForeColor="Red" />
                                    <asp:RangeValidator
                                        ID="rangeValidator4"
                                        runat="server"
                                        ErrorMessage="*Value too large"
                                        SetFocusOnError="true"
                                        ValidationGroup="AddNewArt"
                                        ControlToValidate="txbQuantity"
                                        Display="Dynamic"
                                        ForeColor="red"
                                        Type="Integer"
                                        MinimumValue="1"
                                        MaximumValue="999999" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="pwd">Weight:</label>
                                    <asp:TextBox
                                        TextMode="Number"
                                        CssClass="form-control"
                                        ID="txbWeight"
                                        ValidationGroup="AddNewArt"
                                        placeholder="Please Enter weight available"
                                        runat="server" />
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator5"
                                        runat="server"
                                        SetFocusOnError="true"
                                        Display="Dynamic"
                                        ValidationGroup="AddNewArt"
                                        ControlToValidate="txbWeight"
                                        ErrorMessage="Number Required"
                                        ForeColor="Red" />
                                    <asp:RangeValidator
                                        ID="rangeValidator3"
                                        runat="server"
                                        ErrorMessage="Value too large"
                                        SetFocusOnError="true"
                                        ValidationGroup="AddNewArt"
                                        ControlToValidate="txbWeight"
                                        Display="Dynamic"
                                        ForeColor="red"
                                        Type="Integer"
                                        MinimumValue="1"
                                        MaximumValue="999999" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="pwd">L &times; W &times; W:</label>
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:TextBox
                                        TextMode="Number"
                                        CssClass="form-control"
                                        ID="txbLL"
                                        ValidationGroup="AddNewArt"
                                        placeholder="Length"
                                        runat="server" />
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator3"
                                        runat="server"
                                        SetFocusOnError="true"
                                        Display="Dynamic"
                                        ValidationGroup="AddNewArt"
                                        ControlToValidate="txbLL"
                                        ErrorMessage="Number Required"
                                        ForeColor="Red" />
                                    <asp:RangeValidator
                                        ID="rangeValidator2"
                                        runat="server"
                                        ErrorMessage="Value too large"
                                        SetFocusOnError="true"
                                        ValidationGroup="AddNewArt"
                                        ControlToValidate="txbLL"
                                        Display="Dynamic"
                                        ForeColor="red"
                                        Type="Integer"
                                        MinimumValue="1"
                                        MaximumValue="999999" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:TextBox
                                            TextMode="Number"
                                            CssClass="form-control"
                                            ID="txbWW"
                                            placeholder="Width"
                                            runat="server" />
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator2"
                                            runat="server"
                                            SetFocusOnError="true"
                                            Display="Dynamic"
                                            ValidationGroup="AddNewArt"
                                            ControlToValidate="txbWW"
                                            ErrorMessage="Number Required"
                                            ForeColor="Red" />
                                        <asp:RangeValidator
                                            ID="rangeValidator1"
                                            runat="server"
                                            ErrorMessage="Value too large"
                                            SetFocusOnError="true"
                                            ValidationGroup="AddNewArt"
                                            ControlToValidate="txbWW"
                                            Display="Dynamic"
                                            ForeColor="red"
                                            Type="Integer"
                                            MinimumValue="1"
                                            MaximumValue="999999" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:TextBox
                                            TextMode="Number"
                                            CssClass="form-control"
                                            ID="txbHH"
                                            ValidationGroup="AddNewArt"
                                            placeholder="Height"
                                            runat="server" />
                                        <asp:RequiredFieldValidator
                                            ID="val1"
                                            runat="server"
                                            SetFocusOnError="true"
                                            Display="Dynamic"
                                            ValidationGroup="AddNewArt"
                                            ControlToValidate="txbHH"
                                            ErrorMessage="Number Required"
                                            ForeColor="Red" />
                                        <asp:RangeValidator
                                            ID="rangeValidator"
                                            runat="server"
                                            ErrorMessage="Value too large"
                                            SetFocusOnError="true"
                                            ValidationGroup="AddNewArt"
                                            ControlToValidate="txbHH"
                                            Display="Dynamic"
                                            ForeColor="red"
                                            Type="Integer"
                                            MinimumValue="1"
                                            MaximumValue="999999" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <!--Toogle switch-->
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="pull-right" style="margin: 10px">
                            <asp:CheckBox
                                AutoPostBack="true" Checked="true"
                                OnCheckedChanged="NonVirtual_CheckedChanged"
                                ID="NonVirtual"
                                runat="server" />
                            <span style="color: #888">Virtual Product</span>
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

                <a class="btn btn-secondary" href="<%= "https://" + HttpContext.Current.Request.Url.Authority+"/pages/main/Artist/content/ReadUpdateDeleteArt.aspx"%>">Back</a>
                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Add Art" OnClick="btnSubmit_Click" />
            </div>

            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <asp:Image CssClass="center" ImageUrl="~/assets/image/no_img.jpg" ID="Image1" runat="server" length="700px" Width="500px" />
            </div>
        </div>



    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>

