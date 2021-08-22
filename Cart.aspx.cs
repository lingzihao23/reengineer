using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace PennyJuice
{
    public partial class Cart : System.Web.UI.Page
    {
        bool cartError = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            int quantityPriceCart;
            int temp = 0;
            int temp2 = 0;
            
            foreach (DataListItem Item in cartDisplayList.Items)
            {
                if (!IsPostBack)
                {
                    Label quantityLabel = (Label)Item.FindControl("quantityLabel");
                    Label PriceLabel = (Label)Item.FindControl("PriceLabel");

                    int quantityCart = int.Parse(quantityLabel.Text);
                    int priceCart;

                    priceCart = int.Parse(PriceLabel.Text.Substring(0, PriceLabel.Text.IndexOf('.')));

                    quantityPriceCart = quantityCart * priceCart;
                    temp2 += quantityCart;
                    temp += quantityPriceCart;

                    int grandTotalAmt;
                    grandTotalAmt = temp;
                    grandTotal.Text = "Grand Total: $ " + grandTotalAmt.ToString() + ".00";
                }
                else
                {
                    TextBox cartQuantityText = (TextBox)Item.FindControl("cartQuantity");
                    Label PriceLabel = (Label)Item.FindControl("PriceLabel");
                    Label JuiceIDlbl = (Label)Item.FindControl("JuiceIDlbl");
                    Label viewStocklbl = (Label)Item.FindControl("stockLbl");
                    int juiceId = int.Parse(JuiceIDlbl.Text);
                    int quantityCart;
                    
                    int checkStock = int.Parse(viewStocklbl.Text);

                    if (cartQuantityText.Text == string.Empty)
                    {
                        Response.Write("<script language=javascript>alert('No value entered. Try again.')</script>");
                        cartError = true;
                        if (int.TryParse(cartQuantityText.Text.Trim(), out quantityCart))
                        {

                        }

                        int priceCart;

                        priceCart = int.Parse(PriceLabel.Text.Substring(0, PriceLabel.Text.IndexOf('.')));

                        quantityPriceCart = quantityCart * priceCart;
                        temp2 += quantityCart;
                        temp += quantityPriceCart;

                        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        SqlConnection connect;
                        connect = new SqlConnection(strCon);
                        connect.Open();
                        SqlCommand cartUpdate = new SqlCommand("Update CartData Set quantity =" + 0 + "where UserID = " + Session["UserID"] + "and ArtID = " + juiceId, connect);
                        cartUpdate.ExecuteNonQuery();
                        connect.Close();
                        cartQuantityText.Text = "0";

                        int grandTotalAmt;
                        grandTotalAmt = temp;
                        grandTotal.Text = "Grand Total: $ " + grandTotalAmt.ToString() + ".00";
                    }
                    else
                    {
                        int cartQuanSelected = int.Parse(cartQuantityText.Text);
                        if (cartQuanSelected <= checkStock && cartQuanSelected > 0 && cartQuanSelected != 0)
                        {
                            if (int.TryParse(cartQuantityText.Text.Trim(), out quantityCart))
                            {

                            }

                            int priceCart;

                            priceCart = int.Parse(PriceLabel.Text.Substring(0, PriceLabel.Text.IndexOf('.')));

                            quantityPriceCart = quantityCart * priceCart;
                            temp2 += quantityCart;
                            temp += quantityPriceCart;
                            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                            SqlConnection connect;
                            connect = new SqlConnection(strCon);
                            connect.Open();
                            SqlCommand cartUpdate = new SqlCommand("Update CartData Set quantity =" + quantityCart + "where UserID = " + Session["UserID"] + "and ArtID = " + juiceId, connect);
                            cartUpdate.ExecuteNonQuery();
                            connect.Close();
                            int grandTotalAmt;
                            int grandQuanAmt;
                            grandQuanAmt = temp2;
                            grandTotalAmt = temp;
                            Session["grandTotalVal"] = grandTotalAmt;
                            Session["grandQuantity"] = grandQuanAmt;
                            grandTotal.Text = "Grand Total: $ " + grandTotalAmt.ToString() + ".00";
                        }
                        else if (cartQuanSelected > checkStock)
                        {
                            Response.Write("<script language=javascript>alert('Please enter a quantity not more than available stock. Try again.')</script>");
                            cartError = true;
                        }
                        else
                        {
                            Response.Write("<script language=javascript>alert('Please enter a valid value (More than 0). Try again.')</script>");
                            cartError = true;
                        }
                    }                 
                }               
            }
        }

        protected void removeCartbtn_Command(object sender, CommandEventArgs e)
        {
            foreach (DataListItem Item in cartDisplayList.Items)
            {
                try
                {
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection connect;
                    connect = new SqlConnection(strCon);

                    connect.Open();

                    string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ';' });
                    string juiceId = commandArgs[0];
                    string userId = commandArgs[1];

                    SqlCommand cartDelete = new SqlCommand("DELETE FROM CartData WHERE UserID =" + userId + "AND ArtID =" + juiceId, connect);

                    cartDelete.ExecuteNonQuery();
                    connect.Close();

                    Response.Write("<script>alert('Item has been removed from your cart')</script>");
                    Response.Write("<script>window.location.href='Cart.aspx';</script>");
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('An error occured while trying to remove this item from your cart!')</script>");
                }
                
            }
        }

        protected void checkOutbtn_Command(object sender, CommandEventArgs e)
        {

            foreach (DataListItem Item in cartDisplayList.Items)
            {
                    if (cartError == true)
                    {
                        
                    }
                    else
                    {
                        Response.Redirect("PaymentGateway.aspx?grandTotal=" + Session["grandTotalVal"] + "&grandQuan=" + Session["grandQuantity"]);
                    }                
            }           
        }
    }
}