<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplicationAssigment.pages.__test.WebForm1" %>

<%@ Register Src="~/pages/widget/StartPage.ascx" TagPrefix="uc1" TagName="StartPage" %>
<%@ Register Src="~/pages/widget/EndPages.ascx" TagPrefix="uc1" TagName="EndPages" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:StartPage runat="server" ID="StartPage" />
    <div class="container">

    <form id="card_pay" runat="server">
        
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">
                <img src="../media/card.png" style="height: 50px; margin-right: 30px;">
                Credit Card Check Out
            </h4>
        </div>
        <div class="card-body">


            <!--CardNumber-->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="usr">Card Number :</label>
                        <asp:TextBox
                            CssClass="form-control"
                            ID="CardNumber"
                            placeholder="please enter card number!"
                            runat="server" />
                        <asp:RequiredFieldValidator
                            ValidationGroup="CARD"
                            ForeColor="Red"
                            runat="server"
                            ID="RequiredFieldValidator007"
                            ControlToValidate="CardNumber"
                            ErrorMessage="Please enter card number!" />
                        <asp:RegularExpressionValidator
                            ValidationGroup="CARD"
                            ForeColor="Red"
                            Display="Dynamic"
                            ControlToValidate="CardNumber"
                            ID="RegularExpressionValidator007"
                            ValidationExpression="[0-9]{16}$"
                            runat="server"
                            ErrorMessage="The card numbe rmust be 16 number. " />
                    </div>
                </div>
            </div>


            <!--Name-->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="usr">Full Name :</label>
                        <asp:TextBox
                            CssClass="form-control"
                            ID="CardName"
                            runat="server"
                            Text=''>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ValidationGroup="CARD"
                            ForeColor="Red"
                            runat="server"
                            ID="RequiredFieldValidator008"
                            ControlToValidate="CardName"
                            ErrorMessage="Please enter your full name!" />
                        <asp:RegularExpressionValidator
                            ValidationGroup="CARD"
                            ForeColor="Red"
                            Display="Dynamic"
                            ControlToValidate="CardName"
                            ID="RegularExpressionValidator008"
                            ValidationExpression="[a-zA-Z ]{0,20}$"
                            runat="server"
                            ErrorMessage="The full name only accept max 20 word and must be character only" />
                    </div>
                </div>
            </div>


            <!--CCV and year month -->
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="usr">Exp Date :</label>
                        <asp:TextBox
                            type="date"
                            CssClass="form-control"
                            ID="CardExp"
                            runat="server"
                            Text=''>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ValidationGroup="CARD"
                            ForeColor="Red"
                            runat="server"
                            ID="RequiredFieldValidator009"
                            ControlToValidate="CardExp"
                            ErrorMessage="Please enter card exp date!" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="usr">CCV :</label>
                        <asp:TextBox
                            CssClass="form-control"
                            ID="CardCcv"
                            runat="server"
                            Text=''>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ValidationGroup="CARD"
                            ForeColor="Red"
                            runat="server"
                            ID="RequiredFieldValidator010"
                            ControlToValidate="CardCcv"
                            ErrorMessage="Please enter your ccv" />
                        <asp:RegularExpressionValidator
                            ValidationGroup="CARD"
                            ForeColor="Red"
                            Display="Dynamic"
                            ControlToValidate="CardCcv"
                            ID="RegularExpressionValidator010"
                            ValidationExpression="[0-9]{3}$"
                            runat="server"
                            ErrorMessage="CCV must be 3 number only" />
                    </div>
                </div>
            </div>


            <!--Password-->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="usr">Password :</label>
                        <asp:TextBox
                            CssClass="form-control"
                            ID="CardPass"
                            runat="server"
                            TextMode="Password"
                            Text=''>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ValidationGroup="CARD"
                            ForeColor="Red"
                            runat="server"
                            ID="RequiredFieldValidator005"
                            ControlToValidate="CardPass"
                            ErrorMessage="Please enter your password!" />
                        <asp:RegularExpressionValidator
                            ValidationGroup="CARD"
                            ForeColor="Red"
                            Display="Dynamic"
                            ControlToValidate="CardPass"
                            ID="RegularExpressionValidator005"
                            ValidationExpression="[a-zA-Z0-9]{8,50}$"
                            runat="server"
                            ErrorMessage="The password only accept 8 to 50 word and must be number or character" />
                    </div>
                </div>
            </div>



        </div>
        <div class="card-footer">
            <button type="button" class="btn btn-danger" data-dismiss="card">Return</button>
            <asp:Button
                ValidationGroup="CARD"
                CssClass="btn btn-success pull-right"
                Style="margin-left: 20px"
                Text="Continue Payment"
                runat="server"
                ID="Button1" />
        </div>
    </div>
    </form>
    </div>
    <uc1:EndPages runat="server" ID="EndPages" />

</asp:Content>
