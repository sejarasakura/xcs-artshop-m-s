<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.Register" %>

<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
<%@ Register Src="~/pages/widget/SuccessMessageLarge.ascx" TagPrefix="uc1" TagName="SuccessMessageLarge" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        table{
            margin:auto!important;
        }
    </style>
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <style>
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
                        <div class="container">
                            <script src="../../web/lib/js/register.js"></script>
                            <div class="row justify-content-center">
                                <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                                    <h2>Please Sign Up <small>It's free and always will be.</small></h2>
                                    <hr class="colorgraph">
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
                                                        ID="lastname"
                                                        runat="server"
                                                        placeholder="Last Name"
                                                        CssClass="form-control input-lg" />
                                                </div>
                                            </div>
                                        </div>
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
                                            class="form-control input-lg"
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
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <span class="button-checkbox">
                                            <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
                                            I agree <strong class="label label-primary">Register</strong> to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
                                        </span>
                                    &nbsp;</div>
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

                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <div class="container">
                            <uc1:SuccessMessageLarge runat="server" ID="SuccessMessageLarge" />
                            <asp:Button ID="ContinueButton" runat="server" CssClass="btn btn-success btn-block btn-lg pull-right" 
                                CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" />
                        </div>
                    </ContentTemplate>
                </asp:CompleteWizardStep>

            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>
