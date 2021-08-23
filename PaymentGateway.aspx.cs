using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PennyJuice
{
    public class History
    {
        public int ArtID { get; set; }
        public int quantity { get; set; }
    }
    public partial class PaymentGateway : System.Web.UI.Page
    {
        private String paymentID;
        List<History> history = new List<History>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string grandTotal = Request.QueryString["grandTotal"];
            string grandQuan = Request.QueryString["grandQuan"];
            paymentTotal.Text = "$" + grandTotal.ToString() + ".00";
            paymentQuan.Text = grandQuan.ToString();
        }

   

        protected void paymentCancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void paymentConfirmBtn_Click(object sender, EventArgs e)
        {
            SqlConnection getPaymentID;
            string conPayment = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            getPaymentID = new SqlConnection(conPayment);

            getPaymentID.Open();
            string strSelectPayment = "SELECT TOP 1 * FROM Payment ORDER BY PaymentID DESC";
            SqlCommand cmdPaymentID = new SqlCommand(strSelectPayment, getPaymentID);
            SqlDataReader dtrPaymentID = cmdPaymentID.ExecuteReader();

            if (dtrPaymentID.HasRows)
            {
                while (dtrPaymentID.Read())
                {
                    int tempID;
                    paymentID = dtrPaymentID["PaymentID"].ToString();
                    tempID = int.Parse(paymentID.Substring(3, 5)) + 1;
                    paymentID = "PID" + tempID;

                }

            }
            else
            {
                paymentID = "PID10001";
            }
            getPaymentID.Close();

            SqlConnection getCart;
            string conCart = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            getCart = new SqlConnection(conCart);

            getCart.Open();
            string strSelectCart = "SELECT ArtID,quantity FROM CartData WHERE CartData.UserID = @UserID";
            SqlCommand cmdSelect = new SqlCommand(strSelectCart, getCart);
            cmdSelect.Parameters.AddWithValue("@UserID", Session["UserID"]);
            SqlDataReader dtr = cmdSelect.ExecuteReader();
            if (dtr.HasRows)
            {

                while (dtr.Read())
                {
                    history.Add(new History()
                    {
                        ArtID = dtr.GetInt32(dtr.GetOrdinal("ArtID")),
                        quantity = dtr.GetInt32(dtr.GetOrdinal("quantity")),
                    });
                    
                }

            }

            getCart.Close();

            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection connect;
            connect = new SqlConnection(strConn);

            connect.Open();

            SqlCommand cmdInsert = new SqlCommand("INSERT INTO [Payment] ([PaymentID], [UserID], [OrderDate], [TotalQuantity], [TotalPayment], [Status]) VALUES (@PaymentID, @UserID, @OrderDate, @TotalQuantity, @TotalPayment, @Status)", connect);

            cmdInsert.Parameters.AddWithValue("@PaymentID", paymentID.ToString());
            cmdInsert.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            cmdInsert.Parameters.AddWithValue("@OrderDate", DateTime.Parse(System.DateTime.Now.ToShortDateString()));
            cmdInsert.Parameters.AddWithValue("@TotalQuantity", int.Parse(paymentQuan.Text.ToString()));
            cmdInsert.Parameters.AddWithValue("@TotalPayment", decimal.Parse(Request.QueryString["grandTotal"]));
            cmdInsert.Parameters.AddWithValue("@Status", "Pending");
            cmdInsert.ExecuteNonQuery();

            int length=history.Count();
            int counter=0;
            while (counter != length)
            {
                SqlCommand cmdInsertHistory = new SqlCommand("INSERT INTO [OrderHistory] ([PaymentID], [ArtID], [Quantity]) VALUES (@PaymentID, @ArtID, @Quantity)", connect);
                cmdInsertHistory.Parameters.AddWithValue("@PaymentID", paymentID.ToString());
                cmdInsertHistory.Parameters.AddWithValue("@ArtID", history[counter].ArtID);
                cmdInsertHistory.Parameters.AddWithValue("@Quantity", history[counter].quantity);
                cmdInsertHistory.ExecuteNonQuery();
                counter++;
            }

            int secondCounter = 0;
            while (secondCounter != length)
            {
                SqlCommand quantityReduce = new SqlCommand("UPDATE ArtGalleryData SET Stock = Stock - @quantityCart WHERE ArtID =" + history[secondCounter].ArtID, connect);
                quantityReduce.Parameters.AddWithValue("@quantityCart", history[secondCounter].quantity);
                quantityReduce.ExecuteNonQuery();
                secondCounter++;
            }


            SqlCommand checkOutCmd = new SqlCommand("DELETE FROM CartData WHERE UserID =" + Session["userID"].ToString(), connect);

            checkOutCmd.ExecuteNonQuery();
            connect.Close();



            Response.Redirect("Checkout.aspx?paymentid=" + paymentID + "&grandTotal=" + Session["grandTotalVal"]);
        }

     
    }
}