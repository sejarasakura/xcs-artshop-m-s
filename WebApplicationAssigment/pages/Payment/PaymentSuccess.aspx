<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="WebApplicationAssigment.pages.Payment.PaymentSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
<%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">

            </h4>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="usr">Your payment have make successfully! Please click here to back to the main page!</label>
                    </div>
                </div>
            </div>

        </div>
        <div class="card-footer">
            
        </div>
    </div>
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>
