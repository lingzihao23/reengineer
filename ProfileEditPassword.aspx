<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProfileEditPassword.aspx.cs" Inherits="PennyJuice.ProfileEditPassword" %>

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
                                <li class="current">
                                    <a href="~/ProfileEditPassword.aspx" runat="server" style="text-decoration: none">Change Password</a>
                                </li>
                                <li class="profile">
                                    <a href="~/ProfileEditPic.aspx" runat="server" style="text-decoration: none">Change Picture</a>
                                </li>
                            </ul>
                        </ul>
                    </div>
                </td>
                <tr>
                    <td class="Title">&nbsp;&nbsp; New Password</td>
                    <td style="height: 23px">
                        <asp:TextBox ID="txtNewPass" runat="server" class="textbox" TextMode="Password" MinLength="8" MaxLenght="100" Height="30px"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="New Password is required " ControlToValidate="txtNewPass" ForeColor="Red" ValidationGroup="editPassword">*</asp:RequiredFieldValidator>
                        
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="The password must contain at least 1 number and 1 letter with minimum 8 character maximum 12 character" ControlToValidate="txtNewPass" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}" ValidationGroup="editPassword">*</asp:RegularExpressionValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td class="Title">&nbsp;Confirm New Password</td>
                    <td>
                        <asp:TextBox ID="txtCfmNew" runat="server" class="textbox" TextMode="Password" MinLength="8" MaxLenght="100" Height="30px"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Confirm New Password" ControlToValidate="txtCfmNew" ForeColor="Red" ValidationGroup="editPassword">*</asp:RequiredFieldValidator>
                        
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtCfmNew" ErrorMessage="Confirm Password is not match, Please Re-enter again!" ValidationGroup="editPassword" ForeColor="Red">*</asp:CompareValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td class="Title" style="height: 40px"></td>
                    <td style="height: 40px">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" ValidationGroup="editPassword" />
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; width: 200px;">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <td style="vertical-align: top; width: 200px;" class="sub-title">&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td>
                    <asp:Button ID="btnSavePassword" runat="server" Text="Save" class="button" OnClick="btnSavePassword_Click" ValidationGroup="editPassword"/>
                </td>
            </tr>
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
