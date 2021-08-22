<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.master" CodeBehind="Cart.aspx.cs" Inherits="PennyJuice.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">

    <link href="Cart.css" rel="stylesheet" type="text/css">

    <br /><br /><br /><br /><br />

    <div align="center">
          <hCartlbl>
              <asp:Label ID="viewCartlbl" runat="server" Text="Your Cart"></asp:Label>
          </hCartlbl>
    </div>
    <br /><br />

    <div class="cartDisplay" align="center">     
               
        <asp:DataList ID="cartDisplayList" runat="server" DataSourceID="SqlDataSource1" CellSpacing="70">
            <ItemTemplate>
                <table class="cartTable">
                    <tr>
                        <td rowspan="7" style="width:40%"><asp:Image Height="280px" Width="280px" runat="server" ImageUrl='<%#Eval("ArtPic") %>' BorderStyle="Ridge" BorderColor="Gray" BorderWidth="5px"></asp:Image></td>
                    </tr>
                    <tr>
                        <td><br /></td>
                    </tr>
                    <tr>
                        <td class="cartInfo" style="width:40%">Juice Name:</td>
                        <td class="cartInfo"><asp:Label ID="JuiceNameLabel" runat="server" Text='<%# Eval("ArtName") %>' /></td>
                        <td class="cartInfo" style="visibility:hidden"><asp:Label ID="JuiceIDlbl" runat="server" Text='<%# Eval("ArtID") %>' /></td>
                        
                    </tr>
                    <tr>
                        <td class="cartInfo">Stock Available: </td>
                        <td class="cartInfo"><asp:Label ID="stockLbl" runat="server" Text='<%# Eval("Stock") %>' /></td>
                        <td class ="removeBtnCell">
                            <asp:ImageButton ID="removeCartbtn" CssClass="removeBtn" runat="server" OnClientClick="return confirm('Remove this item from your cart?')" CommandArgument='<%#Eval("ArtID") + ";" +Eval("UserID")%>' OnCommand="removeCartbtn_Command"  ImageUrl="~/media files/removeBtn1.png" onmouseover="this.src='/media files/removeBtn2.png'" onmouseout="this.src='/media files/removeBtn1.png'"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="cartInfo">Quantity Selected:</td>
                        <td><asp:TextBox ID="cartQuantity" runat="server" TextMode="Number" Value='<%# Eval("quantity") %>' AutoPostBack="True" Width="40%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="cartInfo">Unit Price:</td>
                        <td class="cartInfo">$<asp:Label ID="PriceLabel" runat="server" Text='<%#Eval("Price") %>' /></td>
                    </tr>
                    <tr>
                        <td class="cartInfo" style="visibility:hidden"><asp:Label ID="empty" runat="server" Text='Nothing' /></td>
                        <td class="cartInfo"><asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' Visible="False" /></td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
                <asp:Label Visible='<%#bool.Parse((cartDisplayList.Items.Count==0).ToString())%>' 
                           runat="server" ID="lblCartEmpty" class="cartEmpty" Text="<br/><br/><br/><br/><br/><br/>Your Cart is Empty!<br/><br/><br/><br/><br/><br/>"></asp:Label>
            </FooterTemplate>
        </asp:DataList>

        <div align="right">
            <asp:Label ID="grandTotal" class="grandtotallbl" runat="server" Text=""></asp:Label>
        </div>    
        
        <br /><br />

        <div align="right">
            <asp:Button ID="checkoutBtn" class="checkoutBtn" runat="server" Text="Confirm and Checkout" OnClientClick="return confirm('Confirm and Proceed to Checkout?')" OnCommand="checkOutbtn_Command"/>
        </div>
        
        <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CartData.quantity, CartData.UserID, ArtGalleryData.ArtID, ArtGalleryData.ArtPic, ArtGalleryData.ArtName, ArtGalleryData.Stock, ArtGalleryData.Price, UserDetail.FirstName FROM ((CartData INNER JOIN ArtGalleryData ON CartData.ArtID = ArtGalleryData.ArtID) INNER JOIN UserDetail ON CartData.UserID = UserDetail.UserID) WHERE UserDetail.UserID = @UserID">
        <SelectParameters>                                                                                                            
            <asp:SessionParameter Name="UserID" SessionField="UserID" />
        </SelectParameters>
        </asp:SqlDataSource>
        <br /><br />
    </div>
    </asp:Content>




