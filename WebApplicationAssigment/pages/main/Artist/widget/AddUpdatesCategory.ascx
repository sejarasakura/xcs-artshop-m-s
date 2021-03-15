<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddUpdatesCategory.ascx.cs" Inherits="WebApplicationAssigment.pages.main.Artist.widget.AddUpdatesCategory" %>
<%@ Import Namespace="WebApplicationAssigment.commons" %>
<div class="container">
<fieldset class="form-group border p-3">
    <legend class="w-auto px-2">Category</legend>
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <label for="pwd">Category Name:</label>
                <asp:TextBox
                    type="text"
                    CssClass="form-control"
                    ID="txbName"
                    placeholder="eg. Food, danger picture, etc"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ValidationGroup="AddUpdatesCategory"
                    ForeColor="Red"
                    Display="Dynamic"
                    ControlToValidate="txbName"
                    ID="RegularExpressionValidator21"
                    ValidationExpression="[a-zA-Z]{4,50}$"
                    runat="server"
                    ErrorMessage="Name must be only 4 to 50 character only" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <label for="pwd">Descriptions:</label>
                <textarea
                    type="text"
                    class="form-control"
                    id="txbDesc"
                    placeholder="Please Enter descriptions about this catergory"
                    runat="server" 
                    row="3" />
                <asp:RegularExpressionValidator
                    ValidationGroup="AddUpdatesCategory"
                    ForeColor="Red"
                    Display="Dynamic"
                    ControlToValidate="txbName"
                    ID="RegularExpressionValidator2"
                    ValidationExpression="[a-zA-Z]{30,6000}$"
                    runat="server"
                    ErrorMessage="Name must min 30, max 6000 character only" />
            </div>
        </div>
    </div>

    <div class="form-group">
        <label for="pwd">Color: </label>
        <div class="row">
            <div class="col-md-8">
                <asp:TextBox
                    type="number"
                    CssClass="form-control"
                    ID="txbColor"
                    placeholder="Input color"
                    runat="server" />                
                    <script>
                        var input = document.getElementById("<%= txbColor.ClientID%>");

                        // Show label but insert value into the input:
                        var comboplete = new Awesomplete(input, {
                            list: SketchConstant.COLOR_LISTS,
                            minChars: 0,
                            item: function (text, input) {
                                return "<span style='background-color:" + text + "'>&#11036;</span> " + text;
                            },
                        });

                        Awesomplete.$('#<%= txbColor.ClientID%>').addEventListener("click", function () {
                            if (comboplete.ul.childNodes.length === 0) {
                                comboplete.minChars = 0;
                                comboplete.evaluate();
                            }
                            else if (comboplete.ul.hasAttribute('hidden')) {
                                comboplete.open();
                            }
                            else {
                                comboplete.close();
                            }
                        });
                    </script>
            </div>
        </div>
    </div>
    
    <% string[] role = Roles.GetRolesForUser(); %>
    
    <% if (role.Contains("Administrator"))
        { %>
        <div class="row">
            <div class="form-group">
                <div class="col-md-6">
                <asp:TextBox
                    type="number"
                    CssClass="form-control"
                    ID="txtPermissions"
                    placeholder="Permission Levels"
                    runat="server" />
                </div>
                <div class="col-md-6">
                <asp:CheckBox
                    CssClass="form-control"
                    ID="chkEnable"
                     Text=""
                    runat="server" />
                </div>
            </div>
        </div>
    <% } %>
</fieldset>
</div>