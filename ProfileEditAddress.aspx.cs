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
    public partial class EditProfile : System.Web.UI.Page
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

                string strSelect = "SELECT * FROM UserDetail WHERE UserDetail.UserID = @UserID";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataReader dtr = cmdSelect.ExecuteReader();
                if (dtr.HasRows)
                {

                    while (dtr.Read())
                    {
                        if (dtr["Address"] == DBNull.Value)
                        {

                        }
                        else
                        {
                            txtAddress.Text = dtr["Address"].ToString();
                            txtCity.Text = dtr["City"].ToString();
                            txtPostCode.Text = dtr["PostCode"].ToString();
                            ddlState.SelectedValue = dtr["State"].ToString();
                        }
                    }

                }
                con.Close();

            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection newCon;
                string newStrCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string strUpdate;
                newCon = new SqlConnection(newStrCon);
                newCon.Open();
                strUpdate = "Update UserDetail Set Address=@Address, City=@City,PostCode=@PostCode,State=@State WHERE UserID=@UserID";
                SqlCommand cmdUpdate = new SqlCommand(strUpdate, newCon);
                cmdUpdate.Parameters.AddWithValue("@Address", txtAddress.Text.ToString());
                cmdUpdate.Parameters.AddWithValue("@City", txtCity.Text.ToString());
                cmdUpdate.Parameters.AddWithValue("@PostCode", txtPostCode.Text.ToString());
                cmdUpdate.Parameters.AddWithValue("@State", ddlState.SelectedItem.Text.ToString());
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