<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="PennyJuice.PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="PurchaseHistory.css" rel="stylesheet" type="text/css">
    <div class="bckground">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Payment.PaymentID, UserDetail.UserID, Payment.OrderDate, Payment.TotalQuantity, Payment.TotalPayment, Payment.Status FROM Payment INNER JOIN UserDetail ON Payment.UserID = UserDetail.UserID WHERE (UserDetail.UserID = @UserID)">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h2 style="text-align:center">Purchase History List</h2>
    <asp:Repeater ID="rptPurchaseHistory" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="layout">
                
                <table class="tableCon">
                    <tr>
                        <td class="row1">The Payment ID :<asp:Label ID="lblPaymentID" runat="server" Text='<%#Eval("PaymentID")%>' href="#"></asp:Label>&nbsp;</td>                  
                        <td class="row2">Status :
                        <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="row1" rowspan="2">
                            Placed on
                        <asp:Label ID="lblOrderDate" runat="server" Text='<%#Eval("OrderDate","{0:dd/MM/yyyy}")%>'></asp:Label></td>
                        <td class="row2">Total Quantity Purchased :
                        <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("TotalQuantity")%>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="row2">Total Amount Paid :
                        <asp:Label ID="lblSubtotal" runat="server" Text='<%#Eval("TotalPayment","{0:C}")%>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="row2">&nbsp;</td>
                    </tr>
 
 


                </table>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            <asp:Panel ID="Panel1" runat="server" Visible='<%#bool.Parse((rptPurchaseHistory.Items.Count==0).ToString())%>'>
            <div class="layout" >
                <table style="width:100%;" >
                    <tr>
                        <td class="historyEmpty">Your History is Empty!</td> 
                    </tr>   
                </table>
            </div>
                </asp:Panel>
        </FooterTemplate>
    </asp:Repeater>
    <br><br>
<asp:LinkButton ID="btnBack" class="button" Text="Menu" runat="server" PostBackUrl="~/CustomerGallery.aspx"></asp:LinkButton>
    <br><br>
        </div>
</asp:Content>
