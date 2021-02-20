<%@ Page Title="User" Language="C#" MasterPageFile="~/pages/main/admin/master/Admin.Master" AutoEventWireup="true" CodeBehind="UserPages.aspx.cs" Inherits="WebApplicationAssigment.pages.main.admin.content.UserPages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        string role = Request.QueryString["role"];
    %>
    
    <table id="datatable" class="stripe row-border order-column" style="width: 100%">
        <thead>
            <tr>
                <th>======</th>
                <th>Id.</th>
                <th>Email</th>
                <th>Name</th>
                <th>Phone number</th>
                <th>Gender</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <span id="A10001">
                        <a href="#">
                            <span class="glyphicon glyphicon-trash" data-id="A10001">
                            </span>
                        </a>
                        <a href="/WebApplication/admin/edit/Admin?id=A10001#A10001">
                            <span class="glyphicon glyphicon-pencil">
                            </span>
                        </a>
                    </span>
                </td>
                <td>61</td>
                <td>tiger@gmail.com</td>
                <td>Nixon</td>
                <td>+60183927135</td>
                <td>&male;</td>
            </tr>
            <tr>
                <td>
                    <span id="A10001">
                        <a href="#">
                            <span class="glyphicon glyphicon-trash" data-id="A10001">
                            </span>
                        </a>
                        <a href="/WebApplication/admin/edit/Admin?id=A10001#A10001">
                            <span class="glyphicon glyphicon-pencil">
                            </span>
                        </a>
                    </span>
                </td>
                <td>61</td>
                <td>tiger@gmail.com</td>
                <td>Nixon</td>
                <td>+60183927135</td>
                <td>&female;</td>
            </tr>
            <tr>
                <td>
                    <span id="A10001">
                        <a href="#">
                            <span class="glyphicon glyphicon-trash" data-id="A10001">
                            </span>
                        </a>
                        <a href="/WebApplication/admin/edit/Admin?id=A10001#A10001">
                            <span class="glyphicon glyphicon-pencil">
                            </span>
                        </a>
                    </span>
                </td>
                <td>62</td>
                <td>bhh@gmail.com</td>
                <td>Lim sai keat</td>
                <td>+60183927135</td>
                <td>&female;</td>
            </tr>
            <tr>
                <td>
                    <span id="A10001">
                        <a href="#">
                            <span class="glyphicon glyphicon-trash" data-id="A10001">
                            </span>
                        </a>
                        <a href="/WebApplication/admin/edit/Admin?id=A10001#A10001">
                            <span class="glyphicon glyphicon-pencil">
                            </span>
                        </a>
                    </span>
                </td>
                <td>613</td>
                <td>haha@gmail.com</td>
                <td>Lim sai jie</td>
                <td>+60183927135</td>
                <td>&female;</td>
            </tr>
            <tr>
                <td>
                    <span id="A10001">
                        <a href="#">
                            <span class="glyphicon glyphicon-trash" data-id="">
                            </span>
                        </a>
                        <a href="/WebApplication/admin/edit/Admin?id=A10001#A10001">
                            <span class="glyphicon glyphicon-pencil">
                            </span>
                        </a>
                    </span>
                </td>
                <td>64</td>
                <td>dddd@gmail.com</td>
                <td>Loo wei wei</td>
                <td>+60183927135</td>
                <td>&male;</td>
            </tr>
            <tr>
                <td></td>
                <td>615</td>
                <td>tigedasafr@gmail.com</td>
                <td>Hong wah</td>
                <td>+60183927135</td>
                <td>&male;</td>
            </tr>
        </tbody>
    </table>
    <style>
        tfoot input {
            width: 100%;
            padding: 3px;
            box-sizing: border-box;
        }
    </style>
    <script>
        $(document).ready(function () {

            $('#datatable tfoot th').each(function () {
                var title = $(this).text();
                $(this).html('<input class="form-control" type="text" placeholder="Search ' + title + '" />');
            });

            var table = $('#datatable').DataTable({
                scrollY: "300px",
                scrollX: true,
                scrollCollapse: true,
                fixedColumns: {
                    leftColumns: 1
                },      
                initComplete: function () {
                // Apply the search
                this.api().columns().every(function () {
                    var that = this;

                    $('input', this.footer()).on('keyup change clear', function () {
                        if (that.search() !== this.value) {
                            that
                                .search(this.value)
                                .draw();
                        }
                    });
                });
            }
            });
        });
    </script>
</asp:Content>
