<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileGeneral.ascx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.Widget.ProfileGeneral" %>
<div>
    <hr />
    <div class="row">
        <div class="col-sm 12 form-group" style="margin: 0">
            <asp:TextBox
                runat="server"
                ID="Emails"
                class="form-control"
                ValidationGroup="ProfileGeneral"
                placeholder="Emails" />
            <asp:RequiredFieldValidator runat="server"
                ControlToValidate="Emails"
                ToolTip="Email is a required field."
                ID="EmailRequired"
                CssClass="text-danger"
                ValidationGroup="ProfileGeneral"
                ErrorMessage="Email is a required field.">
                <b>* Email is a required field.</b>
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <hr />
    <div class="form-group">

        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6">
                <asp:TextBox
                    ID="firstName"
                    runat="server"
                    placeholder="First Name"
                    ValidationGroup="ProfileGeneral"
                    CssClass="form-control" />
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6">
                <asp:TextBox
                    ID="lastName"
                    runat="server"
                    placeholder="Last Name"
                    ValidationGroup="ProfileGeneral"
                    CssClass="form-control" />
            </div>
        </div>
    </div>

    <div class="form-group">

        <!--Gender-->
        <div class="row">
            <div class="col-md-4">
                Gender : 
            </div>
            <div class="col-md-8">
                <div class="form-check-inline">
                    <asp:RadioButton
                        ID="radioMale"
                        runat="server"
                        Text=""
                        ValidationGroup="ProfileGeneral"
                        GroupName="gender" />
                    <label class="form-check-label" for="inlineRadio2">Male</label>
                </div>

                <div class="form-check-inline">
                    <asp:RadioButton
                        ID="radioFemale"
                        runat="server"
                        Text=""
                        ValidationGroup="ProfileGeneral"
                        GroupName="gender" />
                    <label class="form-check-label" for="inlineRadio2">Female</label>
                </div>
            </div>
        </div>

    </div>

    <div class="form-group">
        <!--Birthday Date-->
        <div class="row">
            <div class="col-xs-12 col-sm-4">
                Birthday Date
            </div>
            <div class="col-xs-12 col-sm-8">
                <asp:TextBox
                    type="date"
                    CssClass="form-control"
                    ID="birthdayDate"
                    ValidationGroup="ProfileGeneral"
                    placeholder="Birthday Date"
                    runat="server" />
            </div>
        </div>
    </div>

    <hr>
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
            <asp:TextBox
                runat="server"
                ID="Question"
                class="form-control input"
                ValidationGroup="ProfileGeneral"
                placeholder="Security Question" />
            <asp:RequiredFieldValidator runat="server"
                ControlToValidate="Question"
                ToolTip="Security Question is a required field."
                ID="QuestionRequired"
                CssClass="text-danger"
                ErrorMessage="Security Question is a required field.">
               <b>* Security Question is a required field.</b>
            </asp:RequiredFieldValidator>

            <script>
                var input = document.getElementById("<%= Question.ClientID%>");

                // Show label but insert value into the input:
                var comboplete = new Awesomplete(input, {
                    list: SketchConstant.SECURITY_QUESTIONS,
                    minChars: 0
                });

                Awesomplete.$('#<%= Question.ClientID%>').addEventListener("click", function () {
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
                class="form-control input"
                TextMode="Password"
                ValidationGroup="ProfileGeneral"
                placeholder="Answer" />
            <asp:RequiredFieldValidator runat="server"
                ControlToValidate="Answer"
                ToolTip="Security Answer is a required field."
                ID="AnswerRequired"
                CssClass="text-danger"
                ValidationGroup="ProfileGeneral"
                ErrorMessage="Security Answer is a required field.">
                <b>* Security Answer is a required field.</b>
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <hr />
</div>
