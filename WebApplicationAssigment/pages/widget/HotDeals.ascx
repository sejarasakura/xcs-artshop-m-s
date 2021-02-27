<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HotDeals.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.HotDeals" %>

<style>
    .container-x {
        width: 100%;
        overflow-x: scroll;
        white-space: nowrap;
        background-color: #fff;
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
</style>

<%@ Import namespace="WebApplicationAssigment.commons" %>
<div class="container-x" id="flavoursContainer">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <!-- START -->
            <div class="panel panel-default data-container">
                <div class="panel-heading"><%# Eval("title") %></div>
                <div class="panel-body control-body">
                    <img class="img-control" src="../Class/ArtPicGetter.ashx?id=<%# Eval("id") %>" alt="<%# Eval("name") %>">
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
                                class="btn btn-default btn-block form-control"
                                style="margin-top: 10px">View Image
                            </a>
                        </div>
                        <br />
                    </div>
                    <div class="row" style="padding-top: 0">
                        <div class="col-sm-12 text-center">
                            <a href="SingleProduct.aspx?id=<%# Eval("id")%>">View Details
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
