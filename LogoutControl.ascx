<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LogoutControl.ascx.cs" Inherits="PennyJuice.LogoutControl" %>
<style>
.loginLabel{
	display:inline-block;
    border: none;
	background: none;
	font-weight: 600;
	font-size: 15px;
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
	color: white;
	}
</style>
<asp:Label ID="loginLabel" CssClass="loginLabel" runat="server" Text="Welcome"></asp:Label><asp:Button ID="Button1" CssClass="loginBtn" runat="server" Text="Logout" OnClick="Button1_Click" />