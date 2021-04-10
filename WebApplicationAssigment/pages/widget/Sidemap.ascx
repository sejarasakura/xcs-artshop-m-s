<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidemap.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.Sidemap" %>

<div style="padding-top: 10px;padding-left:50px;">
    <asp:SiteMapPath SiteMapProvider="MasterProvider" ID="SiteMapPath1" runat="server"
        CurrentNodeStyle-ForeColor="#333333" 
        NodeStyle-ForeColor="#333333" 
        RootNodeStyle-ForeColor="#333333">
    </asp:SiteMapPath>
    <asp:SiteMapDataSource SiteMapProvider="MasterProvider" ID="SiteMapDataSource1" runat="server" />
</div>
