<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="SelectMethod.aspx.cs" Inherits="WebApplicationAssigment.pages.Payment.SelectMethod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
    <%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
    <%@ Import Namespace="WebApplicationAssigment.commons" %>
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">

        <div class="card">
            <div class="card-header">
                <h4 class="card-title" align="center">Payment Method 
                </h4>
            </div>
            <div class="card-body">

                <div class="row" align="center">
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-body">
                                <a href="<%= Constant.DEFAULT_URL %>/pages/Payment/Paypal.aspx?id=<%=this.paymentId %>" style="margin-bottom: 30px; margin-top:30px;">
                                    <img src="<%= Constant.DEFAULT_URL %>/assets/image/Payment/paypal.jpg" style="height: 65px;">
                                </a>
                                <br />
                                <a href="<%= Constant.DEFAULT_URL %>/pages/Payment/Paypal.aspx?id=<%=this.paymentId %>" class="btn btn-primary" style="margin-top:20px;">
                                    Checkout with paypal
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-body">
                                <a href="<%= Constant.DEFAULT_URL %>/pages/Payment/CreditAndDebit.aspx?id=<%=this.paymentId %>" style="margin-bottom: 30px; margin-top:30px;">
                                    <img src="<%= Constant.DEFAULT_URL %>/assets/image/Payment/visamaster.jpg" style="height: 65px;">
                                </a>
                                <br />
                                <a href="<%= Constant.DEFAULT_URL %>/pages/Payment/CreditAndDebit.aspx?id=<%=this.paymentId %>" class="btn btn-primary" style="margin-top:20px;">
                                    Using credit or debitcard
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-body">
                                <a href="<%= Constant.DEFAULT_URL %>/pages/Payment/OnlineBanking.aspx?id=<%=this.paymentId %>" style="margin-bottom: 30px; margin-top:30px;">
                                    <img src="<%= Constant.DEFAULT_URL %>/assets/image/Payment/onlinebanking.jpg" style="height: 65px;">
                                </a>
                                <br />
                                <a href="<%= Constant.DEFAULT_URL %>/pages/Payment/OnlineBanking.aspx?id=<%=this.paymentId %>" class="btn btn-primary" style="margin-top:20px;">
                                    Pay by online banking
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <div class="card-footer">
            <button type="button" class="btn btn-danger" data-dismiss="card">Back</button>
        </div>
    </div>
    </div>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>
