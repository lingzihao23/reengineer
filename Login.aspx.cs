using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Asgm
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.Cookies["Username"]!=null && Request.Cookies["Password"] != null)
                {
                    txtUsername.Text = Request.Cookies["Username"].Value;
                    txtPassword.Attributes["Value"] = Request.Cookies["Password"].Value;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection loginData;
            string strLoginData = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            loginData = new SqlConnection(strLoginData);
            loginData.Open();

            String userUsername = txtUsername.Text;
            String userPassword = txtPassword.Text;

            String strUserData = "SELECT * FROM UserDetail";
            SqlCommand cmdUserData = new SqlCommand(strUserData, loginData);
            SqlDataReader dtrUserData = cmdUserData.ExecuteReader();

            String output = "";
            int userType = btnList.SelectedIndex;
            String userUserType = "";



            if (dtrUserData.HasRows)
            {
                while (dtrUserData.Read())
                {
                    if (dtrUserData["Username"].ToString() == userUsername)
                    {
                        if (dtrUserData["Password"].ToString() == userPassword)
                        {
                            if (userType == 0)
                            {
                                userUserType = "C";

                            }
                            else if (userType == 1)
                            {
                                userUserType = "A";

                            }
                            if (dtrUserData["userIdentityType"].ToString() == userUserType)
                                {

                                if (dtrUserData["userIdentityType"].ToString() == "A")
                                {
                                   if (boxRmb.Checked)
                                    {
                                        Response.Cookies["Username"].Value = txtUsername.Text;
                                        Response.Cookies["Password"].Value = txtPassword.Text;
                                        Response.Cookies["Username"].Expires = DateTime.Now.AddMinutes(1);
                                        Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(1);

                                    }
                                    else
                                    {
                                        Response.Cookies["Username"].Expires = DateTime.Now.AddMinutes(-1);
                                        Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(-1);
                                    }
                                    Session["UserID"] = dtrUserData["UserID"];
                                    Session["UserName"] = dtrUserData["Username"];
                                    Session["userIdentityType"] = dtrUserData["userIdentityType"];
                                    Session["Email"] = dtrUserData["Email"];
                                    Response.Redirect("ClientGallery.aspx");
                                }
                                else if (dtrUserData["userIdentityType"].ToString() == "C")
                                {
                                  if (boxRmb.Checked)
                                    {
                                        Response.Cookies["Username"].Value = txtUsername.Text;
                                        Response.Cookies["Password"].Value = txtPassword.Text;
                                        Response.Cookies["Username"].Expires = DateTime.Now.AddMinutes(1);
                                        Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(1);

                                    }
                                    else
                                    {
                                        Response.Cookies["Username"].Expires = DateTime.Now.AddMinutes(-1);
                                        Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(-1);
                                    }
                                    Session["UserID"] = dtrUserData["UserID"];
                                    Session["UserName"] = dtrUserData["Username"];
                                    Session["userIdentityType"] = dtrUserData["userIdentityType"];
                                    Session["Email"] = dtrUserData["Email"];
                                    Response.Redirect("CustomerGallery.aspx");
                                }

                            }
                            else
                            {
                                lblMsg.Text = "User Does Not Exixt !";
                            }
                              
                        }
                        else
                        {
                            lblMsg.Text = "Wrong Password";
                        }
                    }
                    else
                    {
                        lblMsg.Text = "User Does Not Exixt !";
                    }
                }

            }

            loginData.Close();
        }
    }
}
