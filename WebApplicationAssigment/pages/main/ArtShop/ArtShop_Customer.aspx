<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ArtShop_Customer.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.ArtShop_Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        function btn_submitclick() {
            window.location = "ArtShop_Cust_Details.aspx";
        }
    </script>

    <div class="container-md mt-5 mb-5">
        <div class="row">
            <div class="col-sm text-center">
                <p class="font-weight-bolder">Artwork Name</p>
                <img src="../../../assets/image/testing/OK.JPG" width="180" height="240">
                <p class="font-weight-lighter">Artwork Description</p>
                <input type="submit" class="btn btn-warning" value="Details" id="btn_submit" onclick="return btn_submitclick();" />
            </div>
            <div class="col-sm text-center">
                <p class="font-weight-bolder">Artwork Name</p>
                <img src="../../../assets/image/testing/OK.JPG" width="180" height="240">
                <p class="font-weight-lighter">Artwork Description</p>
                <input type="submit" class="btn btn-warning" value="Details" id="btn_submit1" onclick="return btn_submitclick();" />
            </div>
            <div class="col-sm text-center">
                <p class="font-weight-bolder">Artwork Name</p>
                <img src="../../../assets/image/testing/OK.JPG" width="180" height="240">
                <p class="font-weight-lighter">Artwork Description</p>
                <input type="submit" class="btn btn-warning" value="Details" id="btn_submit2" onclick="return btn_submitclick();" />
            </div>
        </div>
        <div class="row">
            <div class="col-sm text-center">
                <p class="font-weight-bolder">Artwork Name</p>
                <img src="../../../assets/image/testing/OK.JPG" width="180" height="240">
                <p class="font-weight-lighter">Artwork Description</p>
                <input type="submit" class="btn btn-warning" value="Details" id="btn_submit4" onclick="return btn_submitclick();" />
            </div>
            <div class="col-sm text-center">
                <p class="font-weight-bolder">Artwork Name</p>
                <img src="../../../assets/image/testing/OK.JPG" width="180" height="240">
                <p class="font-weight-lighter">Artwork Description</p>
                <input type="submit" class="btn btn-warning" value="Details" id="btn_submit5" onclick="return btn_submitclick();" />
            </div>
            <div class="col-sm text-center">
                <p class="font-weight-bolder">Artwork Name</p>
                <img src="../../../assets/image/testing/OK.JPG" width="180" height="240">
                <p class="font-weight-lighter">Artwork Description</p>
                <input type="submit" class="btn btn-warning" value="Details" id="btn_submit6" onclick="return btn_submitclick();" />
            </div>
        </div>

    </div>
</asp:Content>
