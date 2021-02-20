<%@ Page Title="" Language="C#" MasterPageFile="~/pages/master/Master.Master" AutoEventWireup="true" CodeBehind="AddArtWorkTest.aspx.cs" Inherits="WebApplicationAssigment.pages.main.ArtShop.AddArtWorkTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div>
                <h1>Add Artwork</h1>
                <br />
            </div>
            <table class="auto-style9">
                <tr>
                    <td class="auto-style1">Artwork Image :</td>
                    <td>
                        <br />
                        <asp:FileUpload ID="fuAddImage" runat="server" Height="28px" />
                        <asp:RequiredFieldValidator ID="RequiredImageValidator" runat="server" ErrorMessage="Artwork Image is required!" ForeColor="Red" ControlToValidate="fuAddImage">*</asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Artwork Name :</td>
                    <td>
                        <asp:TextBox ID="txtAddArtsName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredNameValidator" runat="server" ErrorMessage="Artwork Name is required!" ForeColor="Red" ControlToValidate="txtAddArtsName">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <br />
                        Stock Quantity:<br />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddStock" runat="server" Width="59px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredQtyValidator" runat="server" ErrorMessage="Stock Quantity is required!" ForeColor="Red" ControlToValidate="txtAddStock">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="QtyValidator" runat="server" ControlToValidate="txtAddStock" ErrorMessage="Quantity must be in integer type!" ForeColor="Red" MaximumValue="9999" MinimumValue="1">*</asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Artwork Description :</td>
                    <td class="auto-style12">
                        <br />
                        <br />
                        <asp:TextBox ID="txtAddDesc" runat="server" Height="95px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredDescValidator4" runat="server" ErrorMessage="Artwork Desc is required!" ForeColor="Red" ControlToValidate="txtAddDesc">*</asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Artwork Price :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtAddPrice" runat="server" placeHolder="RM"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredPriceValidator" runat="server" ErrorMessage="Artwork Price is required!" ForeColor="Red" ControlToValidate="txtAddPrice">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="PriceValidator" runat="server" ControlToValidate="txtAddPrice" ErrorMessage="Price format should be in currency!" ForeColor="Red" Operator="DataTypeCheck" Type="Currency">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style8">
                        <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="The following problems have been encountered" Width="449px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" Width="94px" OnClick="btnCancelAdd_Click" CausesValidation="False" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnClear" runat="server" Text="Clear" Width="94px" CausesValidation="False" OnClick="btnClear_Click" />
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="btnUploadAdd" runat="server" Text="Upload" Width="95px" OnClick="btnUploadAdd_Click" />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
