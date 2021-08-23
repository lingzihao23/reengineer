<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_Asgm.Login" %>

<!DOCTYPE html>


<html>
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="login.css" />
    <style type="text/css">
        .auto-style1 {
            margin: 5px 0px 5px 10px;
            width: 282px;
            height: 442px;
        }
        .auto-style2 {
            width: 73px;
        }
        .auto-style3 {
            height: 517px;
            width: 300px;
            margin: 7% auto;
            background-color: white;
            padding: 5px;
            position: relative;
            -webkit-animation: fadein 2s;
            text-align: center;
            left: 0px;
            top: 0px;
        }
    </style>
</head>
<body>
    <div class="loginBackground">
        <div class="auto-style3">
            <form id="form1" runat="server" class="auto-style1">
             <table style="width:100%;">
                 <tr>
                     <td class="auto-style2">
                         <a href="Homepage.aspx">< Back</a>
                     </td>
                     <td>&nbsp;</td>
                 </tr>


             </table>
             <table style="width:100%;">
                 <tr>
                     <td>
            <h3>Login</h3>
                     </td>
                 </tr>


             </table>
            <br />
            <br />
                <table style="width:100%;">
                    <tr>
                        <td>Account Type:</td>
                        <td>
                <asp:RadioButtonList ID="btnList" runat="server" DataTextField="UserIdentityTypeName" DataValueField="UserIdentityTypeName">
                    <asp:ListItem Value="Customer"  Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Admin"></asp:ListItem>
                </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="txtUsername" runat="server" class="input-field" placeholder="Username" required></asp:TextBox>

                <asp:TextBox ID="txtPassword" runat="server" class="input-field" placeholder="Password" type="password" required></asp:TextBox>
                <br />
                <asp:CheckBox ID="boxRmb" runat="server" Text="Remember Me" />
                <br />
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" class="button" OnClick="btnLogin_Click" />
                <br />
                <br />
                <a href="">Forget Password</a>
                <br />
                <br />
                <a href="Register.aspx">New User? Register Now!</a>

            </form>
        </div>
        <br />
    </div>

</body>
</html>
