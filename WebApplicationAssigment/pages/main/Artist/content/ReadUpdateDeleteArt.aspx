<%@ Page Title="Your Art" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ReadUpdateDeleteArt.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Artist.content.ReadUpdateDeleteArt" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Table with Add and Delete Row Feature</title>
<!--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">-->

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!--<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
    <style>
body {
    color: #404E67;
    background: #F5F7FA; 
   
}
.table-wrapper {
    width: 700px;
    margin: 30px auto;
    background: #fff;
    padding: 20px;	
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
}
.table-title h2 {
    margin: 6px 0 0;
    font-size: 22px;
}
.table-title .add-new {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
}
.table-title .add-new i {
    margin-right: 4px;
}
table.table {
    table-layout: fixed;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table th:last-child {
    width: 100px;
}
table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 0 5px;
    min-width: 24px;
}    
table.table td a.add {
    color: #27C46B;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}
table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
}    
table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
}
table.table .form-control.error {
    border-color: #f50000;
}
table.table td .add {
    display: none;
}
</style>
    <script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	var actions = $("table td:last-child").html();
	// Append table with add row form on add new button click
  /*  $(".add-new").click(function(){
		$(this).attr("disabled", "disabled");
		var index = $("table tbody tr:last-child").index();
        var row = '<tr>' +
            '<td><input type="text" class="form-control" name="name" id="name"></td>' +
            '<td><input type="text" class="form-control" name="department" id="department"></td>' +
            '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
			'<td>' + actions + '</td>' +
        '</tr>';
    	$("table").append(row);		
		$("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
        $('[data-toggle="tooltip"]').tooltip();
    });*/
	// Add row on add button click
	$(document).on("click", ".add", function(){
		var empty = false;
		var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function(){
			if(!$(this).val()){
				$(this).addClass("error");
				empty = true;
			} else{
                $(this).removeClass("error");
            }
		}); 
		$(this).parents("tr").find(".error").first().focus();
		if(!empty){
			input.each(function(){
				$(this).parent("td").html($(this).val());
			});			
			$(this).parents("tr").find(".add, .edit").toggle();
			$(".add-new").removeAttr("disabled");
		}		
    });
	// Edit row on edit button click
	$(document).on("click", ".edit", function(){		
        $(this).parents("tr").find("td:not(:last-child)").each(function(){
			$(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
		});		
		$(this).parents("tr").find(".add, .edit").toggle();
		$(".add-new").attr("disabled", "disabled");
    });
	// Delete row on delete button click
	$(document).on("click", ".delete", function(){
        $(this).parents("tr").remove();
		$(".add-new").removeAttr("disabled");
    });
});
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
        <!--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center"> -->
              <div class="page-header col-xs-12 col-sm-12">
        <h1 style="font-size:28px">Your Selling Art </h1>
           
      </div>
            <div class="col-lg-11 mx-auto">
                <div class="card border-0 shadow">
                    <div class="card-body p-5">
                        <img src="../../../assets/image/background/CompanyLogo.png " class="d-inline-block align-top" width="90" height="64">
                        <!-- Responsive table -->
                          <div class="table-responsive">
        <div class="table-wrapper" style="margin-top: 0px;margin-left: 0px;margin-right: 0px;margin-bottom: 0px;width: 890px;">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h2>Employee <b>Details</b></h2></div>
                    <div class="col-sm-4">
                        

<a href="<%= "https://" + HttpContext.Current.Request.Url.Authority+"/pages/main/Artist/content/AddNewArt.aspx"%>""> 
    <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button></a>
                        <a href="<%= "https://" + HttpContext.Current.Request.Url.Authority+"/pages/main/Artist/content/ViewArtSales.aspx"%>"" >
    <button type="button" class="btn btn-secondary add-new" style="">         Back</button></a> 
                    </div>
                </div>
            </div>
<!--table-->
     <!--       <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width:85px">id</th>
                        <th style="width:110px">Image</th>
                        <th style="width:100px">Art Name</th>
                        <th style="width:160px">Description</th>
                        <th style="width:100px">Price</th>
                        <th style=""></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>1</th>
                        <th><img /></th>
                        <td>John Doe</td>
                        <td>Administration</td>
                        <td>1800.00</td>
                        <td>
                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                       
                </tbody>
            </table><br />   -->
            <!--gridview-->
           
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="id" ForeColor="#333333" GridLines="None" Height="241px" Width="886px" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeaderWhenEmpty="True" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="White" />
              
            <EmptyDataTemplate>
    <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available matching your selected
        filter. Click on "Add New" button to enter new data .. </span>               
  </EmptyDataTemplate>
           
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="name" HeaderText="Category" SortExpression="name" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                </Columns>
           
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
           
            <br /><br />
           
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Art.description, Art.title, Art.date, Art.price, Art.image,Art.id,Category.name FROM Art INNER JOIN Category ON Art.category_id = Category.id" DeleteCommand="DELETE FROM [Art] WHERE [id] = @id" InsertCommand="INSERT INTO [Art] ([description], [title], [date], [price], [image], [id]) VALUES (@description, @title, @date, @price, @image, @id)" UpdateCommand="UPDATE [Art] SET [description] = @description, [title] = @title, [date] = @date, [price] = @price, [image] = @image WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="date" Type="String" />
                    <asp:Parameter Name="price" Type="Decimal" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="date" Type="String" />
                    <asp:Parameter Name="price" Type="Decimal" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</div>
                    </div>
                </div>
    </div>
        </div>
</asp:Content>