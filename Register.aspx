<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PennyJuice.Register" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Register Page</title>
    <link rel="stylesheet" href="login.css" />
    <style type="text/css">
        .auto-style1 {
            height: 836px;
            width: 305px;
            margin: 7% auto;
            background-color: white;
            padding: 5px;
            position: relative;
            -webkit-animation: fadein 2s;
            text-align: center;
            left: 0px;
            top: 0px;
        }
        .auto-style2 {
            width: 77px;
        }
    </style>
</head>
<body>
    <div class="loginBackground">
        <div class="auto-style1">
            <form id="form1" runat="server" class="input-group">
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
                         <h3>Register</h3>
                         <p>&nbsp;</p>
                     </td>
                 </tr>
                 <tr>
                     <td>
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                         <br />
                     </td>
                 </tr>
                 <tr>
                     <td>
                          <asp:TextBox ID="txtUsername" runat="server" class="input-field" placeholder="Username" MinLength="6" MaxLenght="100" Height="30px" Style="margin-top: 10px" required></asp:TextBox>                                                  <br />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername" ForeColor="Red" ValidationGroup="registerUser">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Username must contain min 6 characrter" ControlToValidate="txtUsername" ForeColor="Red" ValidationExpression="^[\s\S]{6,30}$" ValidationGroup="registerUser">*</asp:RegularExpressionValidator>       
 </td>
                 </tr>
                 <tr>
                     <td>
                       &nbsp;<asp:TextBox ID="txtEmail" runat="server" class="input-field" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                    
                    &nbsp;<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is Required" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="registerUser">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="registerUser">*</asp:RegularExpressionValidator>
               
                     </td>
                 </tr>
                 <tr>
                     <td>
                          <asp:TextBox ID="txtFirstName" runat="server" class="input-field" placeholder="First Name"  MinLength="3" MaxLenght="100" Height="30px" Style="margin-top: 10px"></asp:TextBox>
                    &nbsp;<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is Required" ControlToValidate="txtFirstName" ForeColor="Red" ValidationGroup="registerUser">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter a maximum of 30 characters for First Name" ControlToValidate="txtFirstName" ForeColor="Red" ValidationExpression="^[\s\S]{0,30}$" ValidationGroup="registerUser">*</asp:RegularExpressionValidator>
          
                     </td>
                 </tr>
                 <tr>
                     <td>
                          <asp:TextBox ID="txtLastName" runat="server" class="input-field" placeholder="Last Name"  MinLength="3" MaxLenght="100" Height="30px" Style="margin-top: 10px"></asp:TextBox>
                     &nbsp;<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is Required" ControlToValidate="txtLastName" ForeColor="Red" ValidationGroup="registerUser">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter a maximum of 30 characters for Last Name" ControlToValidate="txtLastName" ForeColor="Red" ValidationExpression="^[\s\S]{0,30}$" ValidationGroup="registerUser">*</asp:RegularExpressionValidator>
                    
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:TextBox ID="txtPassword" runat="server" class="input-field" placeholder="Password" type="password"  MinLength="8" MaxLenght="100" Height="30px" Style="margin-top: 10px" required ></asp:TextBox> 
                         <br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="registerUser">*</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="The password must contain at least 1 number and 1 letter with minimum 8 character maximum 12 character" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="registerUser" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}">*</asp:RegularExpressionValidator>
                     </td>
                 </tr>
                 <tr>
                     <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" class="input-field" placeholder="Confirm Password" type="password"  MinLength="8" MaxLenght="100" Height="30px" Style="margin-top: 10px" required></asp:TextBox>
                         <br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirm Password is required" ControlToValidate="txtConfirmPassword" ForeColor="Red" ValidationGroup="registerUser">*</asp:RequiredFieldValidator>
                         <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirm Password is not match, Please Re-enter again!" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" ValidationGroup="registerUser">*</asp:CompareValidator>
                     </td>
                 </tr>
             </table>
                                          
                <table style="width:100%;">
                    <tr>
                        <td>Account Type:</td>
                        <td>
               <asp:RadioButtonList ID="btnList" runat="server" DataTextField="UserIdentityTypeName" DataValueField="UserIdentityTypeName">
                    <asp:ListItem Value="Customer" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Admin"></asp:ListItem>
                </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ValidationGroup="registerUser" ForeColor="Red" ShowSummary="False" />
                <br />
                <asp:Button ID="btnRegister" runat="server" Text="Register" class="button" OnClick="btnRegister_Click" ValidationGroup="registerUser"/>
                <br />

                <a href="Login.aspx">Have an account? Login now!</a>
                </form>
        </div>
        <br />
    </div>

</body>
</html>
