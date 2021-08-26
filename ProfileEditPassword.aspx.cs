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
    public partial class ProfileEditPassword : System.Web.UI.Page
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

        }

        protected void btnSavePassword_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection newCon;
                string newStrCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string strUpdatePassword;
                newCon = new SqlConnection(newStrCon);
                newCon.Open();
                if (txtNewPass.Text == "")
                {
                    strUpdatePassword = "Update UserDetail";
                }
                else
                {
                    strUpdatePassword = "Update UserDetail Set Password=@Password WHERE UserID=@UserID";
                }
                SqlCommand cmdUpdate = new SqlCommand(strUpdatePassword, newCon);
                cmdUpdate.Parameters.AddWithValue("@Password", txtNewPass.Text.ToString());
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