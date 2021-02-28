<%@ Page Title="View art Sales" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ViewArtSales.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Artist.content.ViewArtSales" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {

            var options = {
                animationEnabled: true,
                theme: "light2",
                title: {
                    text: "Actual vs Projected Sales"
                },
                axisX: {
                    valueFormatString: "DD MMM"
                },
                axisY: {
                    title: "Number of Sales",
                    suffix: "K",
                    minimum: 30
                },
                toolTip: {
                    shared: true
                },
                legend: {
                    cursor: "pointer",
                    verticalAlign: "bottom",
                    horizontalAlign: "left",
                    dockInsidePlotArea: true,
                    itemclick: toogleDataSeries
                },
                data: [{
                    type: "line",
                    showInLegend: true,
                    name: "Projected Sales",
                    markerType: "square",
                    xValueFormatString: "DD MMM, YYYY",
                    color: "#F08080",
                    yValueFormatString: "#,##0K",
                    dataPoints: [
                        { x: new Date(2017, 10, 1), y: 63 },
                        { x: new Date(2017, 10, 2), y: 69 },
                        { x: new Date(2017, 10, 3), y: 65 },
                        { x: new Date(2017, 10, 4), y: 70 },
                        { x: new Date(2017, 10, 5), y: 71 },
                        { x: new Date(2017, 10, 6), y: 65 },
                        { x: new Date(2017, 10, 7), y: 73 },
                        { x: new Date(2017, 10, 8), y: 96 },
                        { x: new Date(2017, 10, 9), y: 84 },
                        { x: new Date(2017, 10, 10), y: 85 },
                        { x: new Date(2017, 10, 11), y: 86 },
                        { x: new Date(2017, 10, 12), y: 94 },
                        { x: new Date(2017, 10, 13), y: 97 },
                        { x: new Date(2017, 10, 14), y: 86 },
                        { x: new Date(2017, 10, 15), y: 89 }
                    ]
                },
                ]
            };
            $("#chartContainer").CanvasJSChart(options);

            function toogleDataSeries(e) {
                if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                    e.dataSeries.visible = false;
                } else {
                    e.dataSeries.visible = true;
                }
                e.chart.render();
            }

        }
</script>
    </asp:content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<%@ Import namespace="WebApplicationAssigment.commons" %>
 <img src="<%= Constant.DEFAULT_URL %>/assets/image/background/CompanyLogo.png " class="d-inline-block align-top" width="130" height="100"><br />
    <a href="<%= "https://" + HttpContext.Current.Request.Url.Authority+"/pages/main/Artist/content/ReadUpdateDeleteArt.aspx"%>"">
        <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Update Art</button></a>

<div id="chartContainer" style="height: 300px; width: 70%;    margin-left: 200px;"></div>

     
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    <asp:Chart ID="Chart1" runat="server" Width="897px">
        <series>
            <asp:Series ChartArea="ChartArea1" Name="Series1">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:content>
