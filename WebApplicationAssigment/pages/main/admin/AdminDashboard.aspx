<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/pages/main/admin/master/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="WebApplicationAssigment.pages.main.admin.content.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	
	<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script>

window.onload = function () {

	var options = {
		title: {
			text: "User Spend Amount"
		},
		subtitles: [{
			text: "As of Febuary, 2021"
		}],
		animationEnabled: true,
		data: [{
			type: "pie",
			startAngle: 40,
			toolTipContent: "<b>{label}</b>: {y}%",
			showInLegend: "true",
			legendText: "{label}",
			indexLabelFontSize: 16,
			indexLabel: "{label} - {y}%",
			dataPoints: [
                { y: 29.7, label: "RM 0.01 - 30.00" },
                { y: 47.3, label: "RM 31.01 - 500.00" },
				{ y: 17.9, label: "RM 500.01 - 1000.00" },
				{ y: 5.1, label: "RM 1000 above" },
			]
		}]
	};
	$("#chartContainer").CanvasJSChart(options);
	

	var dataPoints = [];
	var y = 1000;
	var limit = 50000;

	for (var i = 0; i < limit; i++) {
		y += Math.round(10 + Math.random() * (-10 - 10));
		dataPoints.push({ y: y });
	}

	var options = {
		animationEnabled: true,
		zoomEnabled: true,
		title: {
			text: "Sales Chart"
		},
        subtitles: [{
            text: "As of Febuary, 2021"
		}],
		data: [{
			type: "line", 
			dataPoints: dataPoints
		}]
	};
	$("#chartContainer2").CanvasJSChart(options);

}
</script>
<style>
	#timeToRender {
		position:absolute; 
		top: 10px; 
		font-size: 20px; 
		font-weight: bold; 
		background-color: #d85757;
		padding: 0px 4px;
		color: #ffffff;
	}
</style>

	<div class="jumbotron text-center">
		<h1>Sketch Art dashboard</h1>
		<p>Welcome back to admin pages !! </p>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div id="chartContainer" style="height: 370px; width: 100%;"></div>
			</div>
			<div class="col-sm-6">
				<div id="chartContainer2" style="height: 370px; width: 100%;"></div>
			</div>
		</div>
	</div>

</asp:Content>
