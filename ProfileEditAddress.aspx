<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProfileEditAddress.aspx.cs" Inherits="PennyJuice.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ProfileEdit.css" rel="stylesheet" type="text/css">
     <div class="bckground">
    <br><br><br><br><br><br><br><br><br><br><br><br>

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
                                <li class="current">
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
                <td class="title" style="width: 200px">&nbsp;&nbsp;User Profile Address</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 41px; width: 200px;" class="sub-title">&nbsp;&nbsp;&nbsp; Address :</td>
                <td style="height: 41px"></td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style1">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAddress" runat="server" class="textbox" placeholder="No,Street,Building,etc" Height="40px" Width="600px" MinLength="3" MaxLenght="100"></asp:TextBox>
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Address is required" ControlToValidate="txtAddress" ForeColor="Red" ValidationGroup="editAddress">*</asp:RequiredFieldValidator>
                   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please Enter a maximum of 40 characters for Address" ControlToValidate="txtAddress" ForeColor="Red" ValidationExpression="[\s\S]{0,40}" ValidationGroup="editAddress">*</asp:RegularExpressionValidator>
                   
                </td>
            </tr>
            <tr>
                <td class="sub-title" style="width: 200px">&nbsp;&nbsp;&nbsp; State :</td>
                <td style="height: 41px" class="sub-title">City:</td>
            </tr>
            <tr>
                <td style="width: 200px">&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlState" runat="server" class="dropdownState" type="button" Height="40px" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                    <asp:ListItem>Johor</asp:ListItem>
                    <asp:ListItem>Kedah</asp:ListItem>
                    <asp:ListItem>Kelantan</asp:ListItem>
                    <asp:ListItem>Kuala Lumpur</asp:ListItem>
                    <asp:ListItem>Labuan</asp:ListItem>
                    <asp:ListItem>Melaka</asp:ListItem>
                    <asp:ListItem>Negeri Sembilan</asp:ListItem>
                    <asp:ListItem>Pahang</asp:ListItem>
                    <asp:ListItem>Penang</asp:ListItem>
                    <asp:ListItem>Perak</asp:ListItem>
                    <asp:ListItem>Perlis</asp:ListItem>
                    <asp:ListItem>Putrajaya</asp:ListItem>
                    <asp:ListItem>Sabah</asp:ListItem>
                    <asp:ListItem>Sarawak</asp:ListItem>
                    <asp:ListItem>Selangor</asp:ListItem>
                    <asp:ListItem>Terengganu</asp:ListItem>

                </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" Width="140px" Height="40px" class="textbox" MinLength="3" MaxLenght="50"></asp:TextBox>
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="City is required" ForeColor="Red" ControlToValidate="txtCity" ValidationGroup="editAddress">*</asp:RequiredFieldValidator>
                   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please Enter a maximum of 30 characters for City" ControlToValidate="txtCity" ForeColor="Red" ValidationExpression="[\s\S]{0,30}" ValidationGroup="editAddress">*</asp:RegularExpressionValidator>
                   
                </td>
            </tr>
            <tr>
                    <td class="sub-title" style="width: 200px">&nbsp;&nbsp;&nbsp;Postcode:</td>
                    <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="vertical-align: top; width: 200px;">&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtPostCode" runat="server" Width="140px" Height="40px" class="textbox" MinLength="3" MaxLenght="50"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Only Integer with 5 digit for Malaysia Postcode" ForeColor="Red" ValidationExpression="^[0-9]{5}$" ValidationGroup="editAddress" ControlToValidate="txtPostCode">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Postcode is required" ControlToValidate="txtPostCode" ForeColor="Red" ValidationGroup="editAddress">*</asp:RequiredFieldValidator>
                    <br />
                    &nbsp;&nbsp;&nbsp;
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="vertical-align: top; width: 200px;">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td style="vertical-align: top; width: 200px;">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ValidationGroup="editAddress" ForeColor="Red" ShowSummary="False" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <td style="vertical-align: top; width: 200px;" class="sub-title">&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
            <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" class="button" OnClick="btnSave_Click" ValidationGroup="editAddress"/>
            </td>
            </tr>
        </table>
    
    <br><br><br><br><br><br><br>
         </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            height: 71px;
        }
    </style>
</asp:Content>

