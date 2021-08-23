using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PennyJuice
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control loginControl;
            if (Session["UserID"] == null)
                loginControl = LoadControl("LoginButtonControl.ascx");
            else
                loginControl = LoadControl("LogoutControl.ascx");

            LoginButtons.Controls.Add(loginControl);
        }
    }
}