<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentGateway.aspx.cs" Inherits="PennyJuice.PaymentGateway" %>

<!DOCTYPE html>
<link href="PaymentGateway.css" rel="stylesheet" type="text/css">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Payment Gateway</title>

</head>
    <script language="JavaScript">
        this.history.forward(-1);
    </script>
<body>
    <form id="form1" runat="server">
        <div align="center" class="container">

          <br />

          <hPayment>Secure Payment Gateway</hPayment>

         
          <table align="center" style="width:80%; height:80%" class="paymentTable" >
               <tr class="tableRows">
                <td style="width:50%">
                    <asp:Label ID="paymentQuanDetail" runat="server" Text="Total Amount of Items: "></asp:Label><asp:Label ID="paymentQuan" CssClass="paymentTQ" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="paymentTotalDetail" runat="server" Text="Total Amount to Pay: "></asp:Label><asp:Label ID="paymentTotal" CssClass="paymentTQ" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="width:50%">
                    <asp:Image ID="visaImg" runat="server" ImageUrl="~/media files/visa.png" Height="50px" Width="70px" ImageAlign="Right" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="masterImg" runat="server" ImageUrl="~/media files/mastercard.png" Height="50px" Width="70px" ImageAlign="Right" />
                </td>
            </tr>    
            <tr class="tableRows">
                <td>
                    <asp:Label ID="recAddress" class="paymentLbls" runat="server" Text="Recipient Address: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="recAddressInput" class="addressTextbox" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>   
                    <asp:RequiredFieldValidator ID="addReqValidator" runat="server" ErrorMessage="Recipient Address is required!" ControlToValidate="recAddressInput" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
              <tr class="tableRows">
                <td>
                    <asp:Label ID="email" class="paymentLbls" runat="server" Text="Email: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" class="paymentTextbox"  ></asp:TextBox>   
                    <asp:RequiredFieldValidator ID="emailValidator" runat="server" ErrorMessage="Email is Required" ControlToValidate="txtEmail" ForeColor="Red" >*</asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr class="tableRows">
                <td>
                    <asp:Label ID="cardName" class="paymentLbls" runat="server" Text="Cardholder Name: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="cardNameInput" class="paymentTextbox" runat="server"></asp:TextBox>         
                    <asp:RequiredFieldValidator ID="nameReqValidator" runat="server" ErrorMessage="Cardholder name is required!" ControlToValidate="cardNameInput" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="validateName" runat="server" ErrorMessage="Is that really your name?!" ControlToValidate="cardNameInput" ValidationExpression="^[a-zA-Z\s]+$" ForeColor="Red">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr class="tableRows">
                <td>
                    <asp:Label ID="cardNumber" class="paymentLbls" runat="server" Text="Card Number: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="cardNumberInput" class="paymentTextbox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="numReqValidator" runat="server" ErrorMessage="Card number is required!" ControlToValidate="cardNumberInput" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="validateCard" runat="server" ErrorMessage="Invalid credit card number, must be start with 4 or 5 with 16 digit!" ControlToValidate="cardNumberInput" ValidationExpression="([4|5]\d{15})" ForeColor="Red">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr class="tableRows">
                <td>
                    <asp:Label ID="cardCvv" class="paymentLbls" runat="server" Text="CVV Number: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="cardCvvInput" class="paymentTextbox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="cvvReqValidator" runat="server" ErrorMessage="CVV number is required!" ControlToValidate="cardCvvInput" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="validateCvv" runat="server" ErrorMessage="Invalid CVV number! Must be 3 digit" ControlToValidate="cardCvvInput" ValidationExpression="^[0-9]{3}$" ForeColor="Red">*</asp:RegularExpressionValidator>
                </td>
            </tr>
             <br /><br /><br />
               <tr class="tableRows">
                <td class="paymentBtns"><asp:linkButton ID="paymentCancelBtn" runat="server" Text="Cancel" OnClientClick="return confirm('Cancel Payment?')" OnClick="paymentCancelBtn_Click" CausesValidation="False" /></td>
                <td class="paymentBtns"><asp:linkButton ID="paymentConfirmBtn" runat="server" Text="Confirm" OnClientClick="return confirm('Confirm Payment?')" OnClick="paymentConfirmBtn_Click" /></td>
            </tr>
        </table>
            </div>
      
        <div class="paymentVS">
            <asp:ValidationSummary ID="paymentValidationSummary" HeaderText="The following details were missing:" ShowSummary="False" ShowMessageBox="True" runat="server" ForeColor="Red" />
        </div>
    </form>
</body>
</html>
