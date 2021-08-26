<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProfileEditUserInfoMain.aspx.cs" Inherits="PennyJuice.ProfileEditUserInfoMain" %>

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
                                <li class="current">
                                    <a href="~/ProfileEditUserInfoMain.aspx" runat="server" style="text-decoration: none">Change User Info</a>
                                </li>
                                <li class="profile">
                                    <a href="~/ProfileEditAddress.aspx" runat="server">Change Address</a>
                                </li>
                                <li class="profile">
                                    <a href="~/ProfileEditPassword.aspx" runat="server" style="text-decoration: none">Change Password</a>
                                </li>
                                <li class="profile">
                                    <a href="~/ProfileEditPic.aspx" runat="server" style="text-decoration: none">Change Picture</a>
                                </li>
                            </ul>
                        </ul>
                    </div>
                </td>
                </td>
                    <td class="Title">&nbsp;&nbsp; First Name</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" class="textbox" MinLength="3" MaxLenght="100" Height="30px" Style="margin-top: 10px"></asp:TextBox>
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is Required" ControlToValidate="txtFirstName" ForeColor="Red" ValidationGroup="editUserInfo">*</asp:RequiredFieldValidator>
                   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter a maximum of 30 characters for First Name" ControlToValidate="txtFirstName" ForeColor="Red" ValidationExpression="^[\s\S]{0,30}$" ValidationGroup="editUserInfo">*</asp:RegularExpressionValidator>
                   
                </td>
            </tr>
            <tr>
                <td class="Title">&nbsp;&nbsp; Last Name</td>
                <td style="height: 23px">
                    <asp:TextBox ID="txtLastName" runat="server" class="textbox" MinLength="3" MaxLenght="100" Height="30px"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is Required" ControlToValidate="txtLastName" ForeColor="Red" ValidationGroup="editUserInfo">*</asp:RequiredFieldValidator>
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter a maximum of 30 characters for Last Name" ControlToValidate="txtLastName" ForeColor="Red" ValidationExpression="^[\s\S]{0,30}$" ValidationGroup="editUserInfo">*</asp:RegularExpressionValidator>
                    
                </td>
            </tr>
            <tr>
                <td class="Title">&nbsp;&nbsp; Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" MaxLength="100" runat="server" Width="205px" class="textbox" TextMode="Email" Height="30px" Style="margin-top: 10px"></asp:TextBox>
                    
                    &nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is Required" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="editUserInfo">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="editUserInfo">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="Title">&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" ValidationGroup="editUserInfo" />
                </td>
            </tr>
            </tr>
            <td style="vertical-align: top; width: 200px;" class="sub-title">&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:Button ID="btnSaveInfo" runat="server" Text="Save" class="button" OnClick="btnSaveInfo_Click" ValidationGroup="editUserInfo"/>
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
