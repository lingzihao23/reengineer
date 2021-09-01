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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["userIdentityType"] != null)
            {
                if (Session["userIdentityType"].ToString() == "A")
                    MasterPageFile = "~/Master.Master";

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["userIdentityType"].ToString() == "A")
            {
                //removed wishlist here*
                btnPurchaseHistory.Visible = false;
            }
            else
            { //removed wishlist here*
                btnPurchaseHistory.Visible = true;
            }

            if (IsPostBack == false)
            {

                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();

                // retrieve data
                string strProfilePic = "SELECT * FROM UserDetail WHERE UserDetail.UserID=@UserID";

                SqlCommand cmdProfile = new SqlCommand(strProfilePic, con);

                cmdProfile.Parameters.AddWithValue("@UserID", Session["UserID"]); 
               
                SqlDataReader dtrProfilePic = cmdProfile.ExecuteReader();
                if (dtrProfilePic.HasRows)
                {
                    while (dtrProfilePic.Read())
                    {
                        lblUserName.Text = dtrProfilePic["FirstName"].ToString() + " " + dtrProfilePic["LastName"].ToString();
                        if (dtrProfilePic["ProfilePic"].Equals("~/media files/blank.png"))
                        {
                            
                            lblProfileAddress.Text = "Please edit your address...";
                            lblProfileEmail.Text = dtrProfilePic["Email"].ToString();
                        }
                        else
                        {
                            imgProfile.ImageUrl = dtrProfilePic["ProfilePic"].ToString();
                            lblProfileAddress.Text = dtrProfilePic["Address"].ToString() + ",";
                            lblState.Text = dtrProfilePic["State"].ToString() + ",";
                            lblPostCode.Text = dtrProfilePic["PostCode"].ToString();
                            lblCity.Text = dtrProfilePic["City"].ToString();
                            lblProfileEmail.Text = dtrProfilePic["Email"].ToString();

                        }

                    }
                }
                else
                {
                    lblUserName.Text = "unknown";
                    imgProfile.ImageUrl = "~/media files/blank.png";
                }
                con.Close();
            }

        }

       
    }
}