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
    public partial class ProfileEditUserInfoMain : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["userIdentityType"] != null)
            {
                if (Session["userIdentityType"].ToString() == "A")
                    MasterPageFile = "~/Client.Master";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();

                string strSelect = "SELECT * FROM UserDetail WHERE UserID = @UserID";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataReader dtr = cmdSelect.ExecuteReader();
                if (dtr.HasRows)
                {

                    while (dtr.Read())
                    {
                        txtFirstName.Text = dtr["FirstName"].ToString();
                        txtLastName.Text = dtr["LastName"].ToString();
                        txtEmail.Text = dtr["Email"].ToString();
                    }

                }
                con.Close();
            }

        }



        protected void btnSaveInfo_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection newCon;
                string newStrCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string strUpdateInfo;
                newCon = new SqlConnection(newStrCon);
                newCon.Open();
                strUpdateInfo = "Update UserDetail Set FirstName=@FirstName , LastName=@LastName , Email=@Email WHERE UserID=@UserID";
                SqlCommand cmdUpdate = new SqlCommand(strUpdateInfo, newCon);
                cmdUpdate.Parameters.AddWithValue("@FirstName", txtFirstName.Text.ToString());
                cmdUpdate.Parameters.AddWithValue("@LastName", txtLastName.Text.ToString());
                cmdUpdate.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
                Session["Email"] = txtEmail.Text.ToString();
                cmdUpdate.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdUpdate.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Save Changes');window.location ='../Profile.aspx';", true);
                newCon.Close();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('An error occured while trying to save the details!!')</script>");
            }
        }
    }
}