<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HotDeals.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.HotDeals" %>

<style>
    .container-x {
        width: 100%;
        overflow-x: scroll;
        white-space: nowrap;
        background-color: #fff;
    }

    ::-webkit-scrollbar {
        display: none;
    }

    .data-container {
        display: inline-block;
        margin-right: 20px;
        margin-bottom: 0px;
        height: 100%;
        overflow: hidden;
    }

    .control-body {
        max-height: 100%;
    }

    .img-control {
        width: auto;
        height: 300px;
    }

    .extra-margin {
        margin: 10px 20px;
    }

    .discripion-size {
        width: 270px;
        height: 80px;
        white-space: pre-wrap;
        word-wrap: break-word;
    }

    .discripion {
        overflow: hidden;
    }

    .border-Hotdeals {
        border: solid #EEE 1px;
        padding: 10px;
    }
</style>

<%@ Import Namespace="WebApplicationAssigment.commons" %>
<div class="container-x" id="flavoursContainer">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <!-- START -->
            <div class="panel panel-default data-container border-Hotdeals">
                <h4 class="text-center"><%# Eval("title") %></h4>
                <div class="panel-body control-body">
                    <center>
                            <a
                                href='<%= Constant.IMAGE_URL %>/ImageViewer.aspx?image=<%# Eval("image") %>&name=<%# Eval("title") %>'
                                target="_blank">
                    <img class="img-control pull-center float-center" src="<%= Constant.DEFAULT_URL %>/<%# Eval("image") %>" alt="<%# Eval("title") %>">
                            </a>
                    </center>
                    <div class="row" style="padding-top: 10px;">
                        <div class="col-sm-8">
                            <div class="discripion overflow-hidden">
                                <p class="discripion-size"><%# Eval("description")%></p>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <a
                                href='<%= Constant.IMAGE_URL %>/ImageViewer.aspx?image=<%# Eval("image") %>&name=<%# Eval("title") %>'
                                target="_blank"
                                class="btn btn-secondary btn-block form-control"
                                style="margin-top: 10px">View Image
                            </a>
                        </div>
                        <br />
                    </div>
                    <div class="row" style="padding-top: 0">
                        <div class="col-sm-12 text-center">
                            <a href="<%= Constant.ARTSHOP_URL%>/ArtShop_Cust_Details.aspx?id=<%# Eval("id")%>">View Details
                            </a>
                        </div>
                        <br />
                    </div>
                </div>
            </div>
            <!-- END -->
        </ItemTemplate>
    </asp:Repeater>
</div>
