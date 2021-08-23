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
    public partial class Register : System.Web.UI.Page
    {
        int userID1;
        String userID;
        String userName1;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            String userEmail = txtEmail.Text;
            String userUsername = txtUsername.Text;
            String userFirstName = txtFirstName.Text;
            String userLastName = txtLastName.Text;
            String userPassword = txtPassword.Text;
            String userConfirmPassword = txtConfirmPassword.Text;
            Boolean valid = true;
            string strLoginData = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection loginData;
            loginData = new SqlConnection(strLoginData);

            loginData.Open();
            String strUserData = "SELECT TOP 1 * FROM UserDetail ORDER BY UserID DESC";


            SqlCommand cmdUserData = new SqlCommand(strUserData, loginData);
            SqlDataReader dtrUserData = cmdUserData.ExecuteReader();

            String output = "";
            if (dtrUserData.HasRows)
            {
                while (dtrUserData.Read())
                {
                    userID1 = int.Parse(dtrUserData["UserID"].ToString()) + 1;
                    userID = userID1.ToString();
                }

            }
            else
            {
                userID = "0";
            }
            loginData.Close();
           
            loginData.Open();

            SqlCommand cmd = new SqlCommand("select * from UserDetail where UserName=@Name", loginData);
            cmd.Parameters.AddWithValue("@Name", txtUsername.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                lblMsg.Text = output + "UserName existed!";

                valid = false;

            }
            else
            {
                lblMsg.Text = output + "UserName Available";
                valid = true;
            }


            loginData.Close();
            char userIdentityType;

            if (btnList.SelectedItem.Value == "Artist")
            {
                userIdentityType = 'A';
            }
            else
            {
                userIdentityType = 'C';
            }

            if (userPassword != userConfirmPassword)
            {
                //lblMsg.Text = "Please enter the same password!";
            }
            else if (userPassword == userConfirmPassword)
            {
                //lblMsg.Text = "Valid password!";

            }

            if(valid == true)
            {
                loginData.Open();


                SqlCommand userDataInsert = new SqlCommand("insert into UserDetail (UserID ,UserName ,FirstName, LastName, Password, Email, UserIdentityType,ProfilePic) Values (@userID, @userUsername, @userFirstName, @userLastName, @userPassword, @userEmail, @userIdentityType,@ProfilePic)", loginData);
                userDataInsert.Parameters.AddWithValue("@userID", userID);
                userDataInsert.Parameters.AddWithValue("@userUsername", userUsername);
                userDataInsert.Parameters.AddWithValue("@userFirstName", userFirstName);
                userDataInsert.Parameters.AddWithValue("@userLastName", userLastName);
                userDataInsert.Parameters.AddWithValue("@userPassword", userPassword);
                userDataInsert.Parameters.AddWithValue("@userEmail", userEmail);
                userDataInsert.Parameters.AddWithValue("@userIdentityType", userIdentityType);
                userDataInsert.Parameters.AddWithValue("@ProfilePic", "ProfilePic/blank.png");


                userDataInsert.ExecuteNonQuery();


                loginData.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Registered');window.location ='../Homepage.aspx';", true);
                // Response.Redirect("Homepage.aspx");
            }

        }
    }
}