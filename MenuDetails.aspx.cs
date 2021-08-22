using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Web_Asgm
{
    public partial class ArtDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            foreach (DataListItem Item in artDetailsList.Items)
            {

                ImageButton btnAddWish = (ImageButton)Item.FindControl("btnAddWish");
                Label artIDlbl = (Label)Item.FindControl("artIDlbl");
                int artID = int.Parse(artIDlbl.Text);
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection connect;
                connect = new SqlConnection(strCon);
                connect.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select artID From WishlistData where artID=" + artID, connect);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count.ToString() == "0")
                {
                    btnAddWish.ImageUrl = "media files/wishlistAdd.png";
                }
                else
                {
                    btnAddWish.ImageUrl = "media files/wishlistAdded.png";
                    btnAddWish.Enabled = false;
                }

            }
        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {
    

            foreach (DataListItem Item in artDetailsList.Items)
            {
                TextBox quantityText = (TextBox)Item.FindControl("quantityText");
                LinkButton btnAddCart = (LinkButton)Item.FindControl("btnAddCart");
                Label viewStocklbl = (Label)Item.FindControl("viewStocklbl");
                Label artIDlbl = (Label)Item.FindControl("artIDlbl");
                Label validateQuanLbl = (Label)Item.FindControl("validateQuanLbl");

                if (quantityText.Text == string.Empty)
                {
                    validateQuanLbl.Text = "No value entered. Try again.";
                    Response.Write("<script language=javascript>alert('No value entered. Try again.')</script>");
                }
                else
                {
                    int quanSelected = int.Parse(quantityText.Text);
                    int checkStock = int.Parse(viewStocklbl.Text);
                    int artId = int.Parse(artIDlbl.Text);
                    
                    if (quanSelected <= checkStock && quanSelected > 0 && quanSelected != 0)
                    {
                        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        SqlConnection connect;
                        connect = new SqlConnection(strCon);
                        SqlConnection connect2;
                        connect2 = new SqlConnection(strCon);

                        connect.Open();
                        connect2.Open();

                        SqlCommand cartCheck = new SqlCommand("Select * from CartData where UserID =" + Session["UserID"] + "and ArtID =" + artId, connect);
                        SqlDataReader reader = cartCheck.ExecuteReader();
                        if (reader.HasRows)
                        {
                            SqlCommand cartUpdate = new SqlCommand("Update CartData Set quantity = quantity + " + quanSelected + "where UserID = " + Session["UserID"] + "and ArtID = " + artId, connect2);
                            cartUpdate.ExecuteNonQuery();
                        }
                        else
                        {
                            SqlCommand cartInsert = new SqlCommand("insert into CartData Values (@UserID, @artIDlbl, @quanSelected)", connect2);
                            cartInsert.Parameters.AddWithValue("@UserID", Session["UserID"]);
                            cartInsert.Parameters.AddWithValue("@artIDlbl", artId);
                            cartInsert.Parameters.AddWithValue("@quanSelected", quanSelected);

                            cartInsert.ExecuteNonQuery();
                        }
                        connect.Close();
                        connect2.Close();
                        validateQuanLbl.Style.Add("color", "green");
                        validateQuanLbl.Text = "Successfully added to your cart!";
                        Response.Write("<script language=javascript>alert('Successfully added to your cart!')</script>");
                    }
                    else if (quanSelected > checkStock)
                    {
                        validateQuanLbl.Text = "Please enter a quantity not more than available stock. Try again.";
                        Response.Write("<script language=javascript>alert('Please enter a quantity not more than available stock. Try again.')</script>");
                    }
                    else
                    {
                        validateQuanLbl.Text = "Please enter a valid value (More than 0). Try again.";
                        Response.Write("<script language=javascript>alert('Please enter a valid value (More than 0). Try again.')</script>");
                    }
                }

            }

        }

        protected void btnAddWish_Click(object sender, EventArgs e)
        {

            int userid = Convert.ToInt32(Session["UserID"]);
            foreach (DataListItem Item in artDetailsList.Items)
            {
                ImageButton btnAddWish = (ImageButton)Item.FindControl("btnAddWish");
                Label artIDlbl = (Label)Item.FindControl("artIDlbl");

                int artID = int.Parse(artIDlbl.Text);

                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection connect;
                connect = new SqlConnection(strCon);
                connect.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select artID From WishlistData where artID=" + artID, connect);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count.ToString() == "0")
                {
                    SqlCommand addWishlist = new SqlCommand("Insert into WishlistData Values (@UserID, @artIDlbl)", connect);
                    addWishlist.Parameters.AddWithValue("@artIDlbl", artID);
                    addWishlist.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    addWishlist.ExecuteNonQuery();
                    Response.Write("<script>alert('The item is added in the wishlist')</script>");
                    connect.Close();
                }
                else
                {
                    btnAddWish.ImageUrl = "media files/wishlistAdded.png";
                    btnAddWish.Enabled = false;
                    Response.Write("<script>alert('The item already exist in the wishlist')</script>");

                }

            }
        }

       


    }
}