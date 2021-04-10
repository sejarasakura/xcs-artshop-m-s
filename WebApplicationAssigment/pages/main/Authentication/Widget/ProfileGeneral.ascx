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
                 ReadOnly="true"
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
    <hr />
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
            
        <asp:Button 
            Class="btn btn-warning pull-right" 
            Style="margin-right: 20px;" 
            ID="Button2" 
            runat="server" 
            Text="Updates"  
                ValidationGroup="ProfileGeneral"
            OnClick="Button2_Click" />
        </div>
    </div>

    <hr />
</div>
