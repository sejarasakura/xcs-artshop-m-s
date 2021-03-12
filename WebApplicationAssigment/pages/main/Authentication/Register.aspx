<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.Register" %>

<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
<%@ Register Src="~/pages/widget/SuccessMessageLarge.ascx" TagPrefix="uc1" TagName="SuccessMessageLarge" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/web/lib/css/toogle-switch.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        table {
            margin: auto !important;
            width: 460px !important;
        }
        /* Credit to bootsnipp.com for the css for the color graph */
        .colorgraph {
            height: 5px;
            border-top: 0;
            border-radius: 5px;
            background: #c4e17f;
            background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
        }
    </style>
    <script src="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/web/lib/js/register.js"></script>
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">

            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-sm-12">
                                    <h2>Please Sign Up <small>It's free and always will be.</small></h2>
                                    <hr class="colorgraph">

                                    <div class="form-group">
                                        <asp:TextBox
                                            runat="server"
                                            ID="UserName"
                                            class="form-control input-lg"
                                            placeholder="Username" />
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="UserName"
                                            ToolTip="User Name is a required field."
                                            ID="UserNameRequired"
                                            ValidationGroup="CreateUserWizard1"
                                            CssClass="text-danger"
                                            ErrorMessage="User Name is a required field.">
                                                    <b>* User Name is a required field.</b>
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox
                                            runat="server"
                                            ID="Email" 
                                            TextMode="Email"
                                            class="form-control input-lg register_email"
                                            placeholder="Emails" />
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="Email"
                                            ToolTip="Email is a required field."
                                            ID="EmailRequired"
                                            ValidationGroup="CreateUserWizard1"
                                            CssClass="text-danger"
                                            ErrorMessage="Email is a required field.">
                                                    <b>* Email is a required field.</b>
                                        </asp:RequiredFieldValidator>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <asp:TextBox
                                                    runat="server"
                                                    TextMode="Password"
                                                    ID="Password"
                                                    class="form-control input-lg"
                                                    placeholder="Password" />
                                                <asp:RequiredFieldValidator runat="server"
                                                    ControlToValidate="Password"
                                                    ToolTip="Password is a required field."
                                                    ID="PasswordRequired"
                                                    ValidationGroup="Createuserwizard1"
                                                    CssClass="text-danger"
                                                    ErrorMessage="Password is a required field.">
                                                    <b>* Password is a required field.</b>
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <asp:TextBox
                                                    runat="server"
                                                    TextMode="Password"
                                                    ID="ConfirmPassword"
                                                    class="form-control input-lg"
                                                    placeholder="Confirm Password" />
                                                <asp:RequiredFieldValidator runat="server"
                                                    ControlToValidate="ConfirmPassword"
                                                    ToolTip="Confirm Password is a required field."
                                                    ID="ConfirmPasswordRequired"
                                                    ValidationGroup="CreateUserWizard1"
                                                    CssClass="text-danger"
                                                    ErrorMessage="Confirm Password is a required field.">
                                                    <b>* Confirm Password is a required field.</b>
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <script>
                                        new Awesomplete('.register_email', {
                                            list: ["aol.com", "att.net", "comcast.net", "facebook.com", "gmail.com", "gmx.com", "googlemail.com", "google.com", "hotmail.com", "hotmail.co.uk", "mac.com", "me.com", "mail.com", "msn.com", "live.com", "sbcglobal.net", "verizon.net", "yahoo.com", "yahoo.co.uk"],
                                            data: function (text, input) {
                                                return input.slice(0, input.indexOf("@")) + "@" + text;
                                            },
                                            filter: Awesomplete.FILTER_STARTSWITH
                                        });
                                    </script>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                            <asp:TextBox
                                                runat="server"
                                                ID="Question"
                                                class="form-control input-lg"
                                                placeholder="Security Question" />
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="Question"
                                                ToolTip="Security Question is a required field."
                                                ID="QuestionRequired"
                                                ValidationGroup="CreateUserWizard1"
                                                CssClass="text-danger"
                                                ErrorMessage="Security Question is a required field.">
                                                <b>* Security Question is a required field.</b>
                                            </asp:RequiredFieldValidator>
                                            <script>
                                                <% TextBox securityQuestions = (TextBox)FindControlRecursive(CreateUserWizard1, "Question");%>
                                                var input = document.getElementById("<%= securityQuestions.ClientID%>");

                                                // Show label but insert value into the input:
                                                var comboplete = new Awesomplete(input, {
                                                    list: SketchConstant.SECURITY_QUESTIONS,
                                                    minChars: 0
                                                });

                                                Awesomplete.$('#<%= securityQuestions.ClientID%>').addEventListener("click", function () {
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
                                            </script>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                            <asp:TextBox
                                                runat="server"
                                                ID="Answer"
                                                class="form-control input-lg"
                                                placeholder="Answer" />
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="Answer"
                                                ToolTip="Security Answer is a required field."
                                                ID="AnswerRequired"
                                                ValidationGroup="CreateUserWizard1"
                                                CssClass="text-danger"
                                                ErrorMessage="Security Answer is a required field.">
                                                <b>* Security Answer is a required field.</b>
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col">
                                            <span class="button-checkbox">
                                                <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
                                                I agree <strong class="label label-primary">Register</strong> to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
                                            </span>
                                        </div>
                                    </div>
                                    <div class="text-danger">
                                        <asp:CompareValidator runat="server"
                                            Display="Dynamic"
                                            CssClass="text-danger"
                                            ErrorMessage="The Password and Confirm Password fields must match."
                                            ControlToCompare="ConfirmPassword"
                                            ControlToValidate="Password"
                                            ID="PasswordCompare"
                                            ValidationGroup="CreateUserWizard1">
                                        </asp:CompareValidator>
                                        <asp:Literal runat="server"
                                            EnableViewState="False"
                                            ID="FailureText">
                                        </asp:Literal>
                                        <asp:Literal runat="server"
                                            EnableViewState="False"
                                            ID="ErrorMessage">
                                        </asp:Literal>
                                    </div>
                                    <hr class="colorgraph">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <div class="row">
                            <div class="col-md-6" style="margin-bottom: 20px;">
                                <a href="#" class="btn btn-secondary btn-block btn-lg">Sign In</a>
                            </div>
                            <div class="col-md-6" style="margin-bottom: 20px;">
                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext"
                                    CssClass="btn btn-success btn-block btn-lg" Text="Create User"
                                    ValidationGroup="CreateUserWizard1" />
                            </div>
                        </div>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:TemplatedWizardStep ID="StepTwo" Title="Secondary Step" runat="server">
                    <ContentTemplate>
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-sm-12">
                                    <h2>Profiles</h2>
                                    <hr class="colorgraph">
                                    <div style="margin: auto; padding: 10px; width:100px">
                                        <asp:Image CssClass="img img-circle" 
                                            ImageUrl="~/assets/image/profile.png"
                                            ID="Image1"
                                            runat="server"
                                            length="100px"
                                            Width="100px" />
                                    </div>
                                    <div class="form-group">

                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <asp:TextBox
                                                        ID="firstName"
                                                        runat="server"
                                                        placeholder="First Name"
                                                        CssClass="form-control input-lg" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <asp:TextBox
                                                        ID="lastName"
                                                        runat="server"
                                                        placeholder="Last Name"
                                                        CssClass="form-control input-lg" />
                                                </div>
                                            </div>
                                        </div>

                                        <!--Picture-->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="pwd">Upload Image:</label>
                                                    <asp:FileUpload
                                                        type="file"
                                                        name="file"
                                                        onchange="previewFile()"
                                                        CssClass="form-control"
                                                        ID="FileUploader"
                                                        placeholder="Upload your profile picture"
                                                        runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <!--Gender-->
                                        <div class="row">
                                            <div class="col-md-4">
                                                Gender : 
                                                </div>
                                            <div class="col-md-8">
                                                <div class="form-check-inline">
                                                    <asp:RadioButton ID="radioMale" runat="server" Text="Male" GroupName="gender" />
                                                </div>
                                                <div class="form-check-inline">
                                                    <asp:RadioButton ID="radioFemale" runat="server" Text="Female" GroupName="gender" />
                                                </div>
                                            </div>
                                        </div>

                                        <!--Birthday Date-->
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4">
                                                Birthday Date
                                            </div>
                                            <div class="col-xs-12 col-sm-8">
                                                <asp:textbox 
                                                    type="date" 
                                                    CssClass="form-control" 
                                                    id="birthdayDate" 
                                                    placeholder = "Birthday Date" 
                                                    runat="server" /> 
                                            </div>
                                        </div>

                                        <script>
                                            jQuery(document).ready(function ($) {
                                                $('input.toggle_switch_input_art').change(function () {
                                                    if ($(this).is(':checked'))
                                                        $('div#artExtensions').show();
                                                    else
                                                        $('div#artExtensions').hide();
                                                }).change();
                                                $('input.toggle_switch_input_cust').change(function () {
                                                    if ($(this).is(':checked'))
                                                        $('div#custExtensions').show();
                                                    else
                                                        $('div#custExtensions').hide();
                                                }).change();
                                            });
                                        </script>

                                        <div id="custExtensions" runat="server" visible="true">
                                            <fieldset class="form-group border p-3">
                                                <legend class="w-auto px-2"><sub>Customer Fields</sub></legend>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <asp:DropDownList 
                                                            ID="ddlMembership" 
                                                            runat="server">
                                                            <asp:ListItem Value="N">Normal Customer</asp:ListItem>
                                                            <asp:ListItem Value="S">Silver Member</asp:ListItem>
                                                            <asp:ListItem Value="G">Gold Member</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div id="artExtensions" runat="server" visible="false">
                                            <fieldset class="form-group border p-3">
                                                <legend class="w-auto px-2"><sub>Artist Profile</sub></legend>
                                                
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                                        <div class="form-group">
                                                            <label for="up">Upload Signature:</label>
                                                            <asp:FileUpload
                                                                type="file"
                                                                name="file"
                                                                onchange="previewFile2()"
                                                                CssClass="form-control"
                                                                ID="FileUploader2"
                                                                placeholder="Upload your profile picture"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                                        <asp:Image CssClass="center img-circle pull-right"
                                                            ImageUrl="~/assets/image/profile.png"
                                                            ID="Image2"
                                                            runat="server"
                                                            Height="100px"
                                                            Width="100%" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12">
                                                        <asp:TextBox 
                                                            ID="Description" 
                                                            runat="server"
                                                            placeholder="Yours Introduction"
                                                            CssClass="form-control input-lg"
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>

                                        <!--Toogle switch-->
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="pull-right" style="margin:10px">
                                                    <asp:CheckBox
                                                        AutoPostBack="true" Checked="false"
                                                        OnCheckedChanged="ChckedChangedArt"
                                                        ID="ArtistOnly"
                                                        runat="server" />
                                                    <span style="color: #888">Artist</span>
                                                </div>

                                                <div class="pull-right" style="margin:10px">
                                                    <asp:CheckBox
                                                        AutoPostBack="true" Checked="true"
                                                        OnCheckedChanged="ChckedChangedCustomer"
                                                        ID="CustomerOnly"
                                                        runat="server" />
                                                    <span style="color: #888">Customer</span>
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <hr class="colorgraph">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <stepnavigationtemplate>
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <asp:Button 
                                        ID="StepPreviousButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="MovePrevious" 
                                        class="btn btn-warning " 
                                        Text="Previous" />
                                </div>
                                <div class="col-sm-6">
                                    <asp:Button 
                                        ID="StepNextButton" 
                                        runat="server" 
                                        OnClick="StepNextButton_Click"
                                        CommandName="MoveNext" 
                                        class="btn btn-success pull-right" 
                                        Text="Next" /> 
                                </div>
                            </div>
                        </stepnavigationtemplate>
                    </CustomNavigationTemplate>
                </asp:TemplatedWizardStep>

                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <div class="container">
                            <uc1:SuccessMessageLarge runat="server" ID="SuccessMessageLarge" />
                            <center>
                            <asp:Button ID="ContinueButton" runat="server" CssClass="btn btn-success btn-block btn-lg pull-right"
                                CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" />
                            </center>
                        </div>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />

    <!-- Load picture functions -->
    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%= this.getImageID("Image1")%>');
            var file = document.querySelector('#<%= this.getFileUploadID("FileUploader")%>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "<%= "https://" + HttpContext.Current.Request.Url.Authority%>/assets/image/profile.png";
            }
        }
        function previewFile2() {
            var preview = document.querySelector('#<%= this.getImageID("Image2")%>');
            var file = document.querySelector('#<%= this.getFileUploadID("FileUploader2")%>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "<%= "https://" + HttpContext.Current.Request.Url.Authority%>/assets/image/profile.png";
            }
        }

    </script>

</asp:Content>
