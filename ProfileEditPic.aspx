<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProfileEditPic.aspx.cs" Inherits="PennyJuice.ProfileEditPic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ProfileEdit.css" rel="stylesheet" type="text/css">
    <div class="bckground">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div>
        <table class="tableCon">
            <tr>
                <td rowspan="19" style="vertical-align: top; width: 230px;">
                    <div class="side-nav-container">
                        <ul class="side-nav">
                            <li class="profileLayout">
                                <a href="~/ProfileEditUserInfoMain.aspx" runat="server">Edit Profile</a>
                            </li>
                            <ul class="addition-list">
                                <li class="profile">
                                    <a href="~/ProfileEditUserInfoMain.aspx" runat="server" style="text-decoration: none">Change User Info</a>
                                </li>
                                <li class="profile">
                                    <a href="~/ProfileEditAddress.aspx" runat="server">Change Address</a>
                                </li>
                                <li class="profile">
                                    <a href="~/ProfileEditPassword.aspx" runat="server" style="text-decoration: none">Change Password</a>
                                </li>
                                <li class="current">
                                    <a href="~/ProfileEditPic.aspx" runat="server" style="text-decoration: none">Change Picture</a>
                                </li>
                            </ul>
                        </ul>
                    </div>
                </td>
                <td class="title">&nbsp;&nbsp; Update Profile Picture</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="sub-title">&nbsp;&nbsp; Click on the box below to select a picture to upload</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:FileUpload ID="ProfilePic" name="fuArt" accept="image/*" Style="display:block;" runat="server" />
                    <img id="preview_img" src="~/ProfilePic/blank.png" style="width: 160px; height: 180px; cursor: pointer; border: solid; margin-left: 160px;" alt="Profile Picture" runat="server" clientidmode="Static" /><br>
                    <br />
                    <asp:Button ID="btnSubmitPic" runat="server" Text="Submit" class="button_Pic" OnClick="btnSubmitPic_Click"/>
                    <br />
                </td>
                <td>
                    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                    <br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;</td>
            </tr>
            <td style="vertical-align: top; width: 200px;" class="sub-title">&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>&nbsp;</td>
        </table>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
        </div>
</asp:Content>

