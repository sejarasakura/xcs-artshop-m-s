<%@ Page Title="Create Role" Language="C#" MasterPageFile="~/pages/main/admin/master/Admin.Master" AutoEventWireup="true" CodeBehind="CreateRole.aspx.cs" Inherits="WebApplicationAssigment.pages.main.admin.content.Role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table{
            margin:auto
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ErrorMessage" runat="server">
    </div>
    <div class="pull-center">
        <b>Create a New Role: </b>
        <br />
        <asp:TextBox ID="RoleName" runat="server"></asp:TextBox>
        <asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" OnClick="CreateRoleButton_Click" />
    </div>
    
    <div class="pull-center">
    <asp:GridView 
        ID="RoleList" 
        runat="server" 
        CssClass="table table-hover"
        AutoGenerateColumns="False">
        <Columns>
            <asp:CommandField DeleteText="Delete Role" ShowDeleteButton="True" />
            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label runat="server" ID="RoleNameLabel" Text='<%# Container.DataItem %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
