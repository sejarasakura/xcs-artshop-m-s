﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileWidget.ascx.cs" Inherits="WebApplicationAssigment.pages.widget.ProfileWidget" %>


<hr />
<div class="container bootstrap snippet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <div class="row">
        <div class="col-sm-10">
            <h1>User name</h1>
        </div>
        <div class="col-sm-2"><a href="/users" class="pull-right">
            <img title="profile image" class="img-circle img-responsive" src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a></div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <!--left col-->


            <div class="text-center">
                <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                <h6>Upload a different photo...</h6>
                <input type="file" class="text-center center-block file-upload">
            </div>
            <hr />
            <br>


            <div class="panel panel-default">
                <div class="panel-heading">Website <i class="fa fa-link fa-1x"></i></div>
                <div class="panel-body"><a href="http://bootnipets.com">bootnipets.com</a></div>
            </div>


        </div>
        <!--/col-3-->
        <div class="col-sm-9">
            <ul class="nav nav-tabs">

                <asp:LoginView ID="LoginView2" runat="server">
                    <LoggedInTemplate>
                        <% string[] role = Roles.GetRolesForUser(); %>

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
                        <% string[] role = Roles.GetRolesForUser(); %>

                        <div class="tab-pane active" id="general">
                            <hr>
                            <form class="form" action="##" method="post" id="registrationForm">
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <label for="first_name">
                                            <h4>First name</h4>
                                        </label>
                                        <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any.">
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <label for="last_name">
                                            <h4>Last name</h4>
                                        </label>
                                        <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any.">
                                    </div>
                                </div>

                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Phone</h4>
                                        </label>
                                        <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="mobile">
                                            <h4>Mobile</h4>
                                        </label>
                                        <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <label for="email">
                                            <h4>Email</h4>
                                        </label>
                                        <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <label for="email">
                                            <h4>Location</h4>
                                        </label>
                                        <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <label for="password">
                                            <h4>Password</h4>
                                        </label>
                                        <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <label for="password2">
                                            <h4>Verify</h4>
                                        </label>
                                        <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <br>
                                        <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i>Save</button>
                                        <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i>Reset</button>
                                    </div>
                                </div>
                            </form>

                            <hr>
                        </div>

                        <% if (role.Contains("Artist"))
                            { %>
                        <div class="tab-pane" id="artist">

                            <h2></h2>

                            <hr>
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
