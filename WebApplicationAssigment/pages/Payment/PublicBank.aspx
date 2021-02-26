<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="PublicBank.aspx.cs" Inherits="WebApplicationAssigment.pages.Payment.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">
                Public Bank Check Out  <img src="../../assets/image/Payment/publicbank.png" style="height: 50px; margin-right: 1px;">
            </h4>
        </div>
        <div class="card-body">


  


            <!--Account-->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="usr">Account Number :</label>
                        <asp:Label
                            CssClass="form-control"
                            ID="CardName"
                            runat="server"
                            Text='04584262448'>
                        </asp:Label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="usr">Purchase For :</label>
                        <asp:Label
                            CssClass="form-control"
                            ID="Label2"
                            runat="server"
                            Text='Company Sketch Sdn Bhd'>
                        </asp:Label>
                    </div>
                </div>
            </div>


            
            <!--Date-->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="usr">Date Payment :</label>
                        <asp:Label
                            CssClass="form-control"
                            ID="CardPass"
                            runat="server"
                            Text='2021-02-25  8.45.25PM'>
                        </asp:Label>
                    </div>
                </div>
            </div>

            <!--Amount-->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="usr">Amount :</label>
                        <asp:Label
                            CssClass="form-control"
                            ID="Label1"
                            runat="server"
                            Text='RM 1000.00'>
                        </asp:Label>
                    </div>
                </div>
            </div>



        </div>
        <div class="card-footer">
            <asp:Button
                ValidationGroup="CARD"
                CssClass="btn btn-success pull-right"
                Style="margin-left: 20px"
                Text="Confirm"
                runat="server"
                ID="Button1"
                PostBackUrl="~/pages/Payment/PaymentSuccess.aspx"/>
        </div>
    </div>
    </div>
</asp:Content>
