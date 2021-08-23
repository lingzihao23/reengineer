<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MenuDetails.aspx.cs" Inherits="PennyJuice.MenuDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    
    <link href="MenuDetails.css" rel="stylesheet" type="text/css">
    <br /><br /><br /><br />

    <asp:DataList ID="artDetailsList" runat="server" DataKeyField="ArtID" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <br />

            <div align="center">
                <hErrorQuan>
                    <asp:Label ID="validateQuanLbl" runat="server" Text=""></asp:Label>
                </hErrorQuan>
            </div>

            <br />

            <div align="center">
                <hView>
                    <asp:Label ID="nowViewlbl" runat="server" Text="You are now viewing"></asp:Label>
                </hView>
            </div>

            <br />

            <div align="center">
                <hArtNameLbl>
                    <asp:Label ID="artNamelbl" runat="server" Text='<%# Eval("ArtName") %>'></asp:Label>
                </hArtNameLbl>
                <br />
                <hArtIdlbl>
                    <asp:Label ID="artIDlbl" runat="server" Text='<%# Eval("ArtID") %>'></asp:Label>
                </hArtIdlbl>
            </div>
            
            <table class="detailTable">
                <tr>
                    <td class="detailImg" rowspan="5">
                        <asp:Image ID="Image1" runat="server" Height="400px" ImageUrl='<%# Eval("ArtPic") %>' Width="400px" />
                    </td>
                    <td class="detailInfo">Artwork Name:</td>
                    <td class="detailInfo">
                        <asp:Label ID="viewArtNamelbl" runat="server" Text='<%# Eval("ArtName") %>'></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="detailInfo">Price:</td>
                    <td>$
                        <asp:Label ID="viewPricelbl" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="detailInfo">Pieces Available:</td>
                    <td>
                        <asp:Label ID="viewStocklbl" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="detailInfo">Product Description:</td>
                    <td>
                        <asp:Label ID="viewArtDesc" runat="server" Text='<%# Eval("ArtDesc") %>'></asp:Label>
                    </td>
                </tr>
            </table>
            <br /><br />
            <table class="detailBtnTable" align="center">
                <tr><td>&nbsp;</td></tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td class="quantityBox">
                        Enter quantity: <asp:TextBox ID="quantityText" runat="server" TextMode="Number" placeholder='<%# Eval("Stock") %>' AutoPostBack="False"></asp:TextBox>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td class="detailBtn"><asp:linkButton ID="btnAddCart" runat="server" Text="Add To Cart" OnClick="btnAddCart_Click" /></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ([ArtID] = @ArtID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArtID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />

</asp:Content>






