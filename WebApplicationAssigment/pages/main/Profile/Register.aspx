<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Profile.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
        

        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <ContentTemplate>
                    <style>
                        /* Credit to bootsnipp.com for the css for the color graph */
                        .colorgraph {
                            height: 5px;
                            border-top: 0;
                            background: #c4e17f;
                            border-radius: 5px;
                            background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                            background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                            background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                        }
                    </style>
                    <div class="container">
                        <script src="../../web/lib/js/register.js"></script>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                                <h2>Please Sign Up <small>It's free and always will be.</small></h2>
                                <hr class="colorgraph">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
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
                                        ErrorMessage="User Name is a required field.">
                                        *
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
                                        ValidationGroup="Createuserwizard1"
                                        ErrorMessage="Email is a required field.">
                                    *
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <div class="form-group">
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
                                                ErrorMessage="Password is a required field.">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <div class="form-group">
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
                                                ErrorMessage="Confirm Password is a required field.">
                                                *
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <div class="form-group">
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
                                                ErrorMessage="Security Question is a required field.">
                                            *
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <div class="form-group">
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
                                                ErrorMessage="Security Answer is a required field.">
                                            *
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4 col-sm-3 col-md-3">
                                        <span class="button-checkbox">
                                            <button type="button" class="btn" data-color="info" tabindex="7">I Agree</button>
                                            <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
                                        </span>
                                    &nbsp;&nbsp;</div>
                                    <div class="col-xs-8 col-sm-9 col-md-9">
                                        By clicking <strong class="label label-primary">Register</strong>, you agree to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
                                    </div>
                                </div>

                                <asp:CompareValidator runat="server"
                                    Display="Dynamic"
                                    ErrorMessage="The Password and Confirm Password fields must match."
                                    ControlToCompare="ConfirmPassword"
                                    ControlToValidate="Password"
                                    ID="PasswordCompare"
                                    ValidationGroup="CreateUserWizard1">
                                </asp:CompareValidator>
                                <asp:literal runat="server" 
                                    enableviewstate="False" 
                                    id="FailureText">
                                </asp:literal>
                                <hr class="colorgraph">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext"
                                            CssClass="btn btn-primary btn-block btn-lg" Text="Create User" ValidationGroup="CreateUserWizard1" />
                                    </div>
                                    <div class="col-xs-12 col-md-6"><a href="#" class="btn btn-success btn-block btn-lg">Sign In</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:CreateUserWizardStep>

            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
            
        </WizardSteps>
    </asp:CreateUserWizard>

</asp:Content>
