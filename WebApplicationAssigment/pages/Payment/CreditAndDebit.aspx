<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="CreditAndDebit.aspx.cs" Inherits="WebApplicationAssigment.pages.Payment.CreditAndDebit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
    <uc1:startpagesm runat="server" id="StartPageSM" />
    <div class="container">


        <div class="card">
            <div class="card-header">
                <h4 class="card-title">
                    <img src="../../assets/image/Payment/visamaster.jpg" style="height: 50px; margin-right: 30px;">
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
                                placeholder="Enter card number..."
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
                                placeholder="Enter card holder name..."
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
                                placeholder="Enter card exp date..."
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
                                placeholder="Enter card ccv..."
                                runat="server"
                                Text=''>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator
                                ValidationGroup="CARD"
                                ForeColor="Red"
                                runat="server"
                                ID="RequiredFieldValidator010"
                                ControlToValidate="CardCcv"
                                ErrorMessage="Please enter your ccv!" />
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
    </div>
    <uc1:endpagessm runat="server" id="EndPagesSM" />

</asp:Content>






