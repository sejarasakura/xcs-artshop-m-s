<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileCustomer.ascx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.Widget.ProfileCustomer" %>
<div>
    
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
                    ValidationGroup="ProfileCustomer"
                    placeholder="Birthday Date"
                    runat="server" />
            </div>
        </div>
    </div>

    <br>
    
    <div class="row">
        <div class="col-sm-6">
            Memberships
         </div>
        <div class="col-sm-6">
            <asp:DropDownList 
                ID="ddlMembership" 
                ValidationGroup="ProfileCustomer"
                runat="server">
                <asp:ListItem Value="N">Normal Customer</asp:ListItem>
                <asp:ListItem Value="S">Silver Member</asp:ListItem>
                <asp:ListItem Value="G">Gold Member</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <hr />
    <asp:Button 
        Class="btn btn-warning pull-right" 
        Style="margin-right: 20px;" 
        ID="Button2" 
        runat="server" 
        Text="Updates"  
                ValidationGroup="ProfileCustomer"
        OnClick="Button2_Click" />
</div>