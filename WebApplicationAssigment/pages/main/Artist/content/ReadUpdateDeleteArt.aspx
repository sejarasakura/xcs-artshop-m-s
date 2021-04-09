<%@ Page Title="Your Art" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="ReadUpdateDeleteArt.aspx.cs" Inherits="WebApplicationAssigment.pages.main.Artist.content.ReadUpdateDeleteArt" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap Table with Add and Delete Row Feature</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Register Src="~/pages/widget/StartPageSM.ascx" TagPrefix="uc1" TagName="StartPageSM" %>
    <%@ Register Src="~/pages/widget/EndPagesSM.ascx" TagPrefix="uc1" TagName="EndPagesSM" %>
    <uc1:StartPageSM runat="server" ID="StartPageSM" />
    <%@ Import Namespace="WebApplicationAssigment.commons" %>

    <center>
        
    <div class="table-responsive">
        <div class="table-wrapper" style="margin-top: 0px; margin-left: 0px; margin-right: 0px; margin-bottom: 0px; width: 1090px;">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8">
                        <h2>Employee <b>Details</b></h2>
                    </div>
                    <div class="col-sm-4">


                        <a href="<%= "https://" + HttpContext.Current.Request.Url.Authority+"/pages/main/Artist/content/AddNewArt.aspx"%>">
                            <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i>Add New</button></a>
                        <a href="<%= "https://" + HttpContext.Current.Request.Url.Authority+"/pages/main/Artist/content/ViewArtSales.aspx"%>">
                            <button type="button" class="btn btn-secondary add-new" style="">Back</button></a>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    $('#<%= GridView1.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({

                        buttons: ['copy', 'excel', 'pdf', 'colvis']
                    });
                });
            </script>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" class="table table-striped table-bordered"
                DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeaderWhenEmpty="True" DataSourceID="SqlDataSource1">
 
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="image" SortExpression="image">
                        <ItemTemplate>
                            <img src='<%= "https://" + HttpContext.Current.Request.Url.Authority + "/"%><%# Eval("image") %>' width="100" height="auto">
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:TemplateField HeaderText="Edit" SortExpression="edit">
                        <ItemTemplate>
                            <a href="AddNewArt.aspx?id=<%# Eval("id") %>" class="btn btn-warning">Edit</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" SortExpression="delete">
                        <ItemTemplate>
                            <asp:Button 
                                CssClass="btn btn-danger"
                                ID="Button1" 
                                runat="server" 
                                Text="Delete" 
                                OnClick="Delete"
                                CommandArgument='<%# Eval("order_id")  %>'></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>

            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Art.description, Art.title, Art.date, Art.price, Art.image,Art.id FROM Art" DeleteCommand="DELETE FROM [Art] WHERE [id] = @id" InsertCommand="INSERT INTO [Art] ([description], [title], [date], [price], [image], [id]) VALUES (@description, @title, @date, @price, @image, @id)" UpdateCommand="UPDATE [Art] SET [description] = @description, [title] = @title, [date] = @date, [price] = @price, [image] = @image WHERE [id] = @id">
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
    </center>
    <uc1:EndPagesSM runat="server" ID="EndPagesSM" />
</asp:Content>
