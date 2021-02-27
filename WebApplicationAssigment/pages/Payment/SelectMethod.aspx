<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="SelectMethod.aspx.cs" Inherits="WebApplicationAssigment.pages.Payment.SelectMethod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
    <%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <div class="container">
        
        <div class="card">
            <div class="card-header">
                <h4 class="card-title" align="center">Payment Method 
                </h4>
            </div>
            <div class="card-body">

                <div class="row" align="center">
                    <div class="col-md-12">
                        <div class="form-group">
                            <img src="../../assets/image/Payment/paypal.jpg" style="height: 65px; margin-right: 30px;">
                            <asp:Button
                                CssClass="btn btn-success pull-right"
                                Style="margin-left: 20px"
                                Text="Paypal"
                                runat="server"
                                ID="Button2"
                                PostBackUrl="~/pages/Payment/Paypal.aspx" />
                        </div>
                    </div>
                </div>


                <div class="row" align="center">
                    <div class="col-md-12">
                        <div class="form-group">
                            <img src="../../assets/image/Payment/visamaster.jpg" style="height: 65px; margin-right: 30px;">
                            <asp:Button
                                CssClass="btn btn-success pull-right"
                                Style="margin-left: 20px"
                                Text="Credit/Debit Card"
                                runat="server"
                                ID="Button4"
                                PostBackUrl="~/pages/Payment/CreditAndDebit.aspx" />
                        </div>
                    </div>
                </div>

                <div class="row" align="center">
                    <div class="col-md-12">
                        <div class="form-group">
                            <img src="../../assets/image/Payment/onlinebanking.jpg" style="height: 65px; margin-right: 30px;">
                            <asp:Button
                                CssClass="btn btn-success pull-right"
                                Style="margin-left: 20px"
                                Text="Online Banking"
                                runat="server"
                                ID="Button3"
                                PostBackUrl="~/pages/Payment/OnlineBanking.aspx" />
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
