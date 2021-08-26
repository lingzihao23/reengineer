<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="PennyJuice.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Profile.css" rel="stylesheet" type="text/css">
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
    <div class="layout">

        <div class="title"><strong>PROFILE</strong></div>
        <table>
            <tr>
                <th class="row1" rowspan="8">
                    <div class="imglayout">
                        <asp:Image ID="imgProfile" runat="server" Height="100%" Width="100%" Alt="Profile Picture" />
                    </div>
                </th>
                <td class="row2">Name</td>
                <td>: </td>
                <td class>
                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="row2">Email&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>: </td>
                <td>
                    <asp:Label ID="lblProfileEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="row2">Address<br />
                    &nbsp;<br />
                    &nbsp;</td>
                <td>:
                <br />
                    &nbsp;<br />
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblProfileAddress" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblState" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblPostCode" runat="server"></asp:Label>
                    <asp:Label ID="lblCity" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>

                <td colspan="5" class="row2">
                    <asp:LinkButton class="purchase_history_btn" ID="btnPurchaseHistory" runat="server" Text="Purchase History" PostBackUrl="~/PurchaseHistory.aspx"></asp:LinkButton>
                </td>

            </tr>
            <tr>
                <td colspan="5" class="row2">
                    <asp:LinkButton class="edit_profile_btn" ID="btnEditProfile" runat="server" Text="Edit Profile Details" PostBackUrl="~/ProfileEditUserInfoMain.aspx"></asp:LinkButton>
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
    <br>
    <br>
    <br>
        </div>
</asp:Content>


