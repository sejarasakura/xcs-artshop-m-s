<%@ Page Title="Add New Art" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="AddNewArt.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Artist.content.AddNewArt" %>

<%@ Register Src="~/pages/widget/StartPage.ascx" TagPrefix="uc1" TagName="StartPage" %>
<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>


<%@ Import Namespace="WebApplicationAssigment.modal" %>
<%@ Import Namespace="WebApplicationAssigment.commons" %>


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
                <h1 style="font-size: 28px"><%= editMode? "Edit art": "Add New Art"%></h1>
                <p style="font-family: 'Bauhaus 93'"><%= editMode? "Change your art details": "Add your new arts to sell."%></p>

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
                                            ForeColor="red"
                                runat="server"
                                ID="RequiredFieldValidator1"
                                ControlToValidate="TitleText"
                                ValidationGroup="AddNewArt"
                                ErrorMessage="Please enter your title!" />
                            <asp:RegularExpressionValidator
                                            ForeColor="red"
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
                
                <div>
                    <fieldset class="form-group border p-3">
                        <legend class="w-auto px-2">General</legend>
                <!--Category-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="usr">Category:</label>
                                <div
                                    runat="server"
                                    id="cat_preview" 
                                    style="margin-bottom: 10px">
                                </div>
                                <asp:TextBox
                                    runat="server"
                                    data-multiple
                                    ID="txtCategory"
                                    ValidationGroup="AddNewArt"
                                    class="form-control input-lg"
                                    placeholder="Choose category" />
                                <input
                                    type="hidden"
                                    value="[]"
                                    id="realCatergory"
                                    runat="server"/>
                            <style>
                                .delete{
                                    cursor: pointer;
                                }
                            </style>
                                <script>
                                    var input = document.getElementById("<%= txtCategory.ClientID%>");
                                    var actualImputs = document.getElementById("<%= realCatergory.ClientID%>");
                                    var cat_preview = document.getElementById("<%= cat_preview.ClientID%>");
                                    var x_selected = <%= this.realCatergory.Value%>;
                                    // Show label but insert value into the input:
                                    var comboplete = new Awesomplete(input, {
                                        list: <%= allCatStr %>,
                                        minChars: 0,
                                        filter: function (text, input) {
                                            return Awesomplete.FILTER_CONTAINS(text.value.name, input);
                                        },
                                        item: function (text, input) {
                                            var realImput = input.match(/[^,]*$/)[0];
                                            var html = '<span style="background-color: ' + text.value.color + '; padding: 5px" class="badge mr-1 card-link-secondary">' + text.value.name + "</span>";
                                            return Awesomplete.$.create("li", {
                                                innerHTML: html,
                                            });
                                        },
                                        replace: function (text) {
                                            if (!x_selected.includes(text.value.id)) {
                                                x_selected.push(text.value.id)
                                                var before = this.input.value.match(/^.+,\s*|/)[0];
                                                this.input.value = "";
                                                actualImputs.value = JSON.stringify(x_selected);

                                                var innerHTML = '<span style="background-color: ' + text.value.color + '; padding: 5px" class="badge mr-1 card-link-secondary">' + text.value.name + " <span onclick=\"deletedataintcat(this, " + text.value.id + ")\"><i class='delete fa fa-times text-danger' aria-hidden='true'></i></span></span>";
                                                $(document).ready(function () {
                                                    $("#<%= cat_preview.ClientID%>").append(innerHTML);
                                                });
                                            }
                                        }
                                    });

                                    Awesomplete.$('#<%= txtCategory.ClientID%>').addEventListener("click", function () {
                                        if (comboplete.ul.childNodes.length === 0) {
                                            comboplete.minChars = 0;
                                            comboplete.evaluate();
                                        }
                                        else if (comboplete.ul.hasAttribute('hidden')) {
                                            comboplete.open();
                                        }
                                        else {
                                            comboplete.close();
                                        }
                                    });

                                    function deletedataintcat(t, variable) {
                                        x_selected.remove(variable);
                                        actualImputs.value = JSON.stringify(x_selected);
                                        $(t).parent().hide();
                                    }

                                    Array.prototype.remove = function () {
                                        var what, a = arguments, L = a.length, ax;
                                        while (L && this.length) {
                                            what = a[--L];
                                            while ((ax = this.indexOf(what)) !== -1) {
                                                this.splice(ax, 1);
                                            }
                                        }
                                        return this;
                                    };
                                </script>
                        </div>
                    </div>
                </div>

                <!--Discription-->
                <div class="row">
                    <div class="col-md-12">
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
                                            ForeColor="red"
                                runat="server"
                                ID="RequiredFieldValidator4"
                                ControlToValidate="Discription"
                                ValidationGroup="AddNewArt"
                                ErrorMessage="Please enter your description!" />
                            <asp:RegularExpressionValidator
                                            ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="Discription"
                                ValidationGroup="AddNewArt"
                                ID="RegularExpressionValidator6"
                                ValidationExpression="[\s\S]{0,250}$"
                                runat="server"
                                ErrorMessage="The description only accept max 250 word only" />
                        </div>
                </div>

                <!--Price-->
                <div class="row">
                    <div class="col-md-12">
                            <label for="usr">Price :</label>
                            <asp:TextBox
                                CssClass="form-control"
                                ID="Price"
                                placeholder="eg 99.9 or 99.99"
                                Text=""
                                runat="server" />
                            <asp:RequiredFieldValidator
                                            ForeColor="red"
                                runat="server"
                                ID="RequiredFieldValidator"
                                ValidationGroup="AddNewArt"
                                ControlToValidate="Price"
                                ErrorMessage="Please enter the sales price!" />
                            <asp:RegularExpressionValidator
                                            ForeColor="red"
                                Display="Dynamic"
                                ValidationGroup="AddNewArt"
                                ControlToValidate="Price"
                                ID="RegularExpressionValidator2"
                                ValidationExpression="^\d{0,8}(\.\d{1,2})?$"
                                runat="server"
                                ErrorMessage="The price too large" />
                        </div>
                </div>

                <!--Date Creation-->
                <div class="row">
                    <div class="col-md-12">
                            <label for="pwd">Date creation:</label>
                            <asp:TextBox
                                type="date"
                                CssClass="form-control"
                                ValidationGroup="AddNewArt"
                                ID="DateCreation"
                                placeholder="Please Enter date creation"
                                runat="server" />
                            <asp:RequiredFieldValidator
                                            ForeColor="red"
                                runat="server"
                                ValidationGroup="AddNewArt"
                                ID="RequiredFieldValidator6"
                                ControlToValidate="DateCreation"
                                ErrorMessage="Please enter date of creation!" />
                        </div>
                </div>


                <div class="row">
                    <div class="col-md-12">
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
                    </fieldset>
                </div>
                
                <!--Toogle switch-->
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="pull-right" style="margin: 10px">
                            <asp:CheckBox
                                AutoPostBack="true" Checked="false"
                                OnCheckedChanged="NonVirtual_CheckedChanged"
                                ID="Virtual"
                                runat="server" />
                            <span style="color: #888">Virtual Product</span>
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
                                        ID="ext10"
                                        runat="server"
                                        SetFocusOnError="true"
                                        Display="Dynamic"
                                        ValidationGroup="AddNewArt"
                                        ControlToValidate="txbQuantity"
                                        ErrorMessage="Number Required"
                                        ForeColor="Red" />
                                    <asp:RangeValidator
                                        ID="ext9"
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
                        <div class="form-group">
                                <label for="pwd">Shipment source:</label>
                            <div class="row">
                                <div class="col-md-8">
                                    <asp:DropDownList 
                                        ID="ddlAddress" 
                                        CssClass="form-control"
                                        runat="server"
                                        DataSourceID="SqlDataSource1"
                                        DataTextField="details"
                                        DataValueField="id" 
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Text="Please select" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [vW_users_address] WHERE ([UserId] = @UserId)">
                                        <SelectParameters>
                                            
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div runat="server" id="address_preview">

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <asp:Button 
                                        CssClass="btn btn-success btn-sm"
                                        OnClick="Button1_Click"
                                        ID="Button1" 
                                        runat="server" 
                                        Text="Add New" />
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
                                        ID="ext8"
                                        runat="server"
                                        SetFocusOnError="true"
                                        Display="Dynamic"
                                        ValidationGroup="AddNewArt"
                                        ControlToValidate="txbWeight"
                                        ErrorMessage="Number Required"
                                        ForeColor="Red" />
                                    <asp:RangeValidator
                                        ID="ext7"
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
                                        ID="ext6"
                                        runat="server"
                                        SetFocusOnError="true"
                                        Display="Dynamic"
                                        ValidationGroup="AddNewArt"
                                        ControlToValidate="txbLL"
                                        ErrorMessage="Number Required"
                                        ForeColor="Red" />
                                    <asp:RangeValidator
                                        ID="ext5"
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
                                            ID="ext4"
                                            runat="server"
                                            SetFocusOnError="true"
                                            Display="Dynamic"
                                            ValidationGroup="AddNewArt"
                                            ControlToValidate="txbWW"
                                            ErrorMessage="Number Required"
                                            ForeColor="Red" />
                                        <asp:RangeValidator
                                            ID="ext3"
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
                                            ID="ext2"
                                            runat="server"
                                            SetFocusOnError="true"
                                            Display="Dynamic"
                                            ValidationGroup="AddNewArt"
                                            ControlToValidate="txbHH"
                                            ErrorMessage="Number Required"
                                            ForeColor="Red" />
                                        <asp:RangeValidator
                                            ID="ext1"
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
                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Add Art" OnClick="btnSubmit_Click" 
                                ValidationGroup="AddNewArt"/>
            </div>

            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <asp:Image CssClass="center" ImageUrl="~/assets/image/no_img.jpg" ID="Image1" runat="server" length="700px" Width="500px" />
            </div>
        </div>



    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>

