<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileArtist.ascx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.Widget.ProfileArtist" %>
<div>
    
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
                    ValidationGroup="ProfileArtist"
                    placeholder="Birthday Date"
                    runat="server" />
            </div>
        </div>
    </div>

    <br>
    
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="form-group">
                    <label for="up">Upload Signature:</label>
                    <asp:FileUpload
                        type="file"
                        name="file"
                        onchange="previewFile2()"
                        CssClass="form-control"
                        ID="FileUploader2"
                         ValidationGroup="ProfileArtist"
                        placeholder="Upload your signature picture"
                        runat="server" />
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6">
                <asp:Image CssClass="center pull-right"
                    ImageUrl="~/assets/image/signature.png"
                    ID="Image2"
                    runat="server"
                    ValidationGroup="ProfileArtist"
                    Height="100px"
                    Width="100%" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12">
                <asp:TextBox 
                    ID="Description" 
                    runat="server"
                    ValidationGroup="ProfileArtist"
                    placeholder="Yours Introduction"
                    CssClass="form-control input-lg"
                    ></asp:TextBox>
            </div>
        </div>
    <hr />
    <asp:Button 
        Class="btn btn-warning pull-right" 
        Style="margin-right: 20px;" 
        ID="Button2" 
        runat="server" 
        Text="Updates"  
        ValidationGroup="ProfileArtist"
        OnClick="Button2_Click" />
</div>