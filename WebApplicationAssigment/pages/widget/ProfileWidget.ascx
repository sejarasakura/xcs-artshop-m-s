<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileWidget.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.ProfileWidget" %>


<%@ Import Namespace="WebApplicationAssigment.commons" %>
<hr />
<div class="container bootstrap snippet">
    <link rel="stylesheet" href="<%= Constant.LIB_URL %>/css/bootstrap3.css" />
    <div class="row">
        <div class="col-sm-10">
            <h1><%= this.viewMember.UserName %></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <!--left col-->


            <div class="text-center">
                <img src="<%= Constant.PROFILE_PIC_URL %>?guid=<%= (Guid)viewMember.ProviderUserKey %>" class="avatar img-circle img-thumbnail" alt="avatar">
                <h6>Upload a different photo...</h6>
                <input type="file" class="text-center center-block file-upload">
            </div>
            <hr />
            <br>


            <div class="panel panel-default">
                <div class="panel-heading">Website <i class="fa fa-link fa-1x"></i></div>
                <div class="panel-body"><a href="http://bootnipets.com">bootnipets.com</a></div>
                <div class="panel-body">
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                </div>

            </div>


        </div>
        <!--/col-3-->
        <div class="col-sm-9">
            <ul class="xnav xnav-tabs nav nav-tabs">

                <asp:LoginView ID="LoginView2" runat="server">
                    <LoggedInTemplate>
                        <% string[] role = Roles.GetRolesForUser(viewMember.UserName); %>

                        <li class="active"><a data-toggle="tab" href="#general">General</a></li>

                        <% if (role.Contains("Artist"))
                            { %>
                        <li><a data-toggle="tab" href="#artist">Artist</a></li>
                        <% } %>
                        <% if (role.Contains("Customer"))
                            { %>
                        <li><a data-toggle="tab" href="#customer">Customer</a></li>
                        <% } %>
                        <% if (role.Contains("Administrator"))
                            { %>
                        <li><a data-toggle="tab" href="#staff">Staff</a></li>
                        <% } %>
                    </LoggedInTemplate>
                </asp:LoginView>
            </ul>

            <div class="tab-content">

                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <% string[] role = Roles.GetRolesForUser(viewMember.UserName); %>

                        <div class="tab-pane active" id="general">
                            <hr />
                            <div class="row">
                                <div class="col-sm 12 form-group" style="margin: 0">
                                    <asp:TextBox
                                        runat="server"
                                        ID="Emails"
                                        class="form-control"
                                        placeholder="Emails" />
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="Emails"
                                        ToolTip="Email is a required field."
                                        ID="EmailRequired"
                                        CssClass="text-danger"
                                        ErrorMessage="Email is a required field.">
                                                    <b>* Email is a required field.</b>
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <hr />
                            <div class="form-group">

                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <asp:TextBox
                                            ID="firstName"
                                            runat="server"
                                            placeholder="First Name"
                                            CssClass="form-control" />
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <asp:TextBox
                                            ID="lastName"
                                            runat="server"
                                            placeholder="Last Name"
                                            CssClass="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">

                                <!--Gender-->
                                <div class="row">
                                    <div class="col-md-4">
                                        Gender : 
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-check-inline">
                                            <asp:RadioButton ID="radioMale" runat="server" Text="" GroupName="gender" CssClass="form-check-input"/>
                                            <label class="form-check-label" for="inlineRadio2">Male</label>
                                        </div>
                                         | 
                                        <div class="form-check-inline">
                                            <asp:RadioButton ID="radioFemale" runat="server" Text="" GroupName="gender" CssClass="form-check-input"/>
                                            <label class="form-check-label" for="inlineRadio2">Female</label>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <!--Birthday Date-->
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4">
                                        Birthday Date
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                        <asp:TextBox
                                            type="date"
                                            CssClass="form-control"
                                            ID="birthdayDate"
                                            placeholder="Birthday Date"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>

                            <hr>
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <asp:TextBox
                                        runat="server"
                                        ID="Question"
                                        class="form-control input"
                                        placeholder="Security Question" />
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="Question"
                                        ToolTip="Security Question is a required field."
                                        ID="QuestionRequired"
                                        CssClass="text-danger"
                                        ErrorMessage="Security Question is a required field.">
                                            <b>* Security Question is a required field.</b>
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <asp:TextBox
                                        runat="server"
                                        ID="Answer"
                                        class="form-control input"
                                        TextMode="Password"
                                        placeholder="Answer" />
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="Answer"
                                        ToolTip="Security Answer is a required field."
                                        ID="AnswerRequired"
                                        CssClass="text-danger"
                                        ErrorMessage="Security Answer is a required field.">
                                            <b>* Security Answer is a required field.</b>
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            
                            <hr />
                        </div>

                        <% if (role.Contains("Artist"))
                            { %>
                        <div class="tab-pane" id="artist">
                            <h2></h2>

                            <hr />
                        </div>
                        <!--/tab-pane-->
                        <% } %>
                        <% if (role.Contains("Customer"))
                            { %>
                        <div class="tab-pane" id="customer">
                        </div>
                        <!--/tab-pane-->
                        <% } %>
                        <% if (role.Contains("Administrator"))
                            { %>
                        <div class="tab-pane" id="staff">
                        </div>
                        <!--/tab-pane-->
                        <% } %>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <!--/tab-content-->

        </div>
        <!--/col-9-->
    </div>
</div>
<script>
    $(document).ready(function () {

        var readURL = function (input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.avatar').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $(".file-upload").on('change', function () {
            readURL(this);
        });
    });
</script>
