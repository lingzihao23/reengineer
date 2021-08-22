<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Web_Asgm.CustomerGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <link href="Menu.css" rel="stylesheet" type="text/css">





    <br /><br /> <br /><br />

    <div class="custGalleryFilter">
        <hFilter>
            Filter Juice By Category &nbsp;&nbsp; 
        </hFilter>
        <asp:DropDownList ID="custGalleryFilter" CssClass="filterDropdown" runat="server" OnSelectedIndexChanged="custGalleryFilter_SelectedIndexChanged">
            <asp:ListItem>All</asp:ListItem>
            <asp:ListItem>Natural</asp:ListItem>
            <asp:ListItem>With Flavoring</asp:ListItem>
        </asp:DropDownList>
         
        <hSort>
            Sort Juice By &nbsp;&nbsp; 
        </hSort>
        <asp:DropDownList ID="custGallerySort" CssClass="sortDropdown" runat="server">
            <asp:ListItem>None</asp:ListItem>
            <asp:ListItem>Price Ascending</asp:ListItem>
            <asp:ListItem>Price Descending</asp:ListItem>
            <asp:ListItem>Stock Ascending</asp:ListItem>
            <asp:ListItem>Stock Descending</asp:ListItem>
        </asp:DropDownList>

        <hConfirm>
            <asp:Button ID="filterSortConfirm" CssClass="filterSortConfirm" runat="server" Text="Confirm" OnClick="filterSortConfirm_Click" />
        </hConfirm>        

    </div>
                              
    <br /><br /><br />

    <div align="center">
        <hNowViewing>
            Viewing <hNowViewingLbl><asp:Label ID="custGalleryViewing" CssClass="custGalleryViewing" runat="server" Text=""></asp:Label></hNowViewingLbl> Menu
        </hNowViewing>
    </div>

    <br />

    <div class="galleryDisplay" align="center">
        <asp:DataList ID="custGalleryList" runat="server" RepeatColumns="3" CellPadding="25"  OnItemCommand="custGalleryList_ItemCommand" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table>
                    <tr>
                        <td colspan="2"><asp:Image Height="300px" Width="300px" runat="server" ImageUrl='<%#Eval("ArtPic") %>'></asp:Image></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td  class="artInfo1" style="width:140px">Product Name: </td>
                        <td  class="artInfo2" style="width:140px"><%#Eval("ArtName") %></td>
                        <caption>
                            <br />
                        </caption>
                    </tr>
                    <tr>
                        <td class="artInfo1">Price: </td>
                        <td class="artInfo2">RM <%#Eval("Price") %></td>
                        <caption>
                            <br />
                        </caption>
                    </tr>
                    <tr>
                        <td class="artInfo1">Stock Available: </td>
                        <td class="artInfo2"><%#Eval("Stock") %></td>
                        <caption>
                            <br />
                        </caption>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center" class="galleryBtns" >
                            <asp:linkButton ID="btnViewDetails" runat="server" Text="View More Info" CommandName="viewDetails" CommandArgument='<% #Eval("ArtID") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <br /><br />

</asp:Content>


