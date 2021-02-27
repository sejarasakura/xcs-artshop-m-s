<%@ Page Title="" Language="C#" MasterPageFile="~/pages/main/admin/master/Admin.Master" AutoEventWireup="true" CodeBehind="PaymentDetails.aspx.cs" Inherits="WebApplicationAssigment.pages.main.admin.content.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table id="datatable" class="stripe row-border order-column" style="width: 100%">
        <thead>
            <tr>
                <th>Id.</th>
                <th>Customer</th>
                <th>Payment Method</th>
                <th>Payment Status</th>
                <th>Total Amount</th>
                <th>Payment Date</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Lim Sai Keat</td>
                <td>E-wallate</td>
                <td>Paid</td>
                <td>Payment amount</td>
                <td>12-12-2020</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <th>Id.</th>
                <th>Customer</th>
                <th>Payment Method</th>
                <th>Payment Status</th>
                <th>Total Amount</th>
                <th>Payment Date</th>
            </tr>
        </tfoot>
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
