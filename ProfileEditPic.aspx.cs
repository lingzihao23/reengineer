using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;


namespace PennyJuice
{
    public partial class ProfileEditPic : System.Web.UI.Page
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
                        if (dtr["ProfilePic"] == DBNull.Value)
                        {
                            preview_img.Src = "~/media files/blank.png";
                            Session["ProfilePic"] = "~/media files/blank.png";
                        }
                        else
                        {
                            preview_img.Src = dtr["ProfilePic"].ToString();
                            Session["ProfilePic"] = dtr["ProfilePic"].ToString();
                        }
                    }

                }
                con.Close();
            }

        }


        protected void btnSubmitPic_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con;

                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();
                if (!String.IsNullOrEmpty(ProfilePic.PostedFile.FileName))
                {
                    string fileName = Path.GetFileName(ProfilePic.PostedFile.FileName);
                    Session["filePath"] = "ProfilePic/" + fileName;
                    string filePath = "ProfilePic/" + fileName;
                    ProfilePic.PostedFile.SaveAs(Server.MapPath(filePath));
                }
                else
                {
                    Session["filePath"] = Session["tempFilePath"];
                }

                string insertPic = "UPDATE UserDetail SET ProfilePic=@ProfilePic where UserID=@UserID";
                SqlCommand cmd = new SqlCommand(insertPic, con);
                cmd.Parameters.AddWithValue("@ProfilePic", Session["filePath"]);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.ExecuteNonQuery();
                Session["profilePic"] = Session["filePath"];
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Save Profile Picture');window.location ='../Profile.aspx';", true);
                con.Close();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('An error occured while trying to save the details!!')</script>");
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(ProfilePic.PostedFile.FileName))
            {
                string fileName = Path.GetFileName(ProfilePic.PostedFile.FileName);
                string filePath = "ProfilePic/" + fileName;
                ProfilePic.PostedFile.SaveAs(Server.MapPath(filePath));
                preview_img.Src = filePath;
                Session["tempFilePath"] = filePath;


            }
        }
    }
}