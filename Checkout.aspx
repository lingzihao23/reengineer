<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.master" CodeBehind="Checkout.aspx.cs" Inherits="PennyJuice.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <link href="Checkout.css" rel="stylesheet" type="text/css">
    <br /><br /><br /><br /><br /><br />

    <div align="center">
        <hCheckout1>
            Your Order Has Been Made Successfully! Below is your purchase summary:
        </hCheckout1>
        <br /><br /><br />
        <hCheckout>
            Total Amount Paid: &nbsp; <asp:Label ID="checkoutPaidlbl" runat="server" Text=""></asp:Label>
        </hCheckout>
    </div>

    <div class="checkoutDisplay" align="center">
        <asp:DataList ID="checkoutDisplayList" runat="server" DataSourceID="SqlDataSource1" CellSpacing="50">
            <ItemTemplate>
                <table class="checkoutTable">
                    <tr>
                        <td rowspan="3" style="width:40%"><asp:Image Height="140px" Width="140px" runat="server" ImageUrl='<%#Eval("ArtPic") %>' BorderStyle="Ridge" BorderColor="Gray" BorderWidth="5px"></asp:Image></td>
                    </tr>
                    <tr>
                        <td class="cartInfo" style="width:40%">Product Name: </td>
                        <td class="cartInfo"><asp:Label ID="artNameLabel" runat="server" Text='<%# Eval("ArtName") %>' /></td>
                    </tr>
                    <tr>
                        <td class="cartInfo" style="width:40%">Quantity Purchased: </td>
                        <td class="cartInfo"><asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("Quantity") %>' /></td>
                    </tr>
                </table>
            </ItemTemplate>
    </asp:DataList>

    </div>
    
    <div align="center">
        <hCheckout>
            View your purchase history by clicking here:
        </hCheckout>
    </div>

    <br /><br />

    <div align="center">
            <asp:Button ID="viewBuyHistory" CssClass="checkoutBtns" runat="server" Text="View Purchase History" OnClick="viewBuyHistory_click"/>
    </div>

    <br /><br />
        
    <div align="center">
        <hCheckout>
            Print the payment receipt by clicking here:
        </hCheckout>
    </div>

  

    <br /><br />

    <div align="center">
            <asp:Button ID="printReceipt" CssClass="checkoutBtns" runat="server" Text="Print Payment Receipt" OnClick="printReceipt_click"/>
    </div>

    <br /><br />

     <div align="center">
         <hCheckout>
           Return to the menu by clicking here:
        </hCheckout>
    </div>

     <br /><br />

    <div align="center">
            <asp:Button ID="returnHome" CssClass="checkoutBtns" runat="server" Text="Return Menu" OnClick="returnMenu_click"/>
    </div>

    

    <br /><br /><br /><br /><br /><br />

    <div align="center">
        <hCheckout>
            Thank you for your patronage. Have a nice day and may we meet again!
        </hCheckout>
    </div>
    
    <br /><br /><br /><br /><br /><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OrderHistory.Quantity, ArtGalleryData.ArtName, ArtGalleryData.ArtPic FROM (OrderHistory INNER JOIN ArtGalleryData ON OrderHistory.ArtID = ArtGalleryData.ArtID) WHERE OrderHistory.PaymentID = @paymentID"></asp:SqlDataSource>

</asp:Content>
