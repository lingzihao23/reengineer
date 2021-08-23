using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PennyJuice
{

    public partial class Checkout : System.Web.UI.Page
    {
        string username;
        string myName = "Penny Juice";
        string myAddress = "utopiArt@outlook.my";
        string myPassword = "Assignment1234";
        string targetAddress;
        protected void Page_Load(object sender, EventArgs e)
        {
            targetAddress = Session["Email"].ToString();
            username = Session["Username"].ToString();
            string paymentID = Request.QueryString["paymentid"];
            string grandTotal = Request.QueryString["grandTotal"];
            SqlDataSource1.SelectParameters.Add("paymentID", paymentID);

            checkoutPaidlbl.Text = "$" + grandTotal.ToString() + ".00";

            if (!IsPostBack)
                SendMail();

        }



        protected void viewBuyHistory_click(object sender, EventArgs e)
        {
            Response.Redirect("PurchaseHistory.aspx");
        }

        protected void printReceipt_click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('The payment receipt have sent to your email.Thankyou!')</script>");
        }

        protected void returnMenu_click(object sender, EventArgs e)
        {
            
            Response.Redirect("Menu.aspx");
        }

        private void SendMail()
        {
            MailAddress addressFrom = new MailAddress(myAddress, "PennyJuice");
            MailMessage message = GetMail();

            SmtpClient client = new SmtpClient("smtp.office365.com", 587);
            client.Credentials = new System.Net.NetworkCredential(myAddress, myPassword);
            client.TargetName = "STARTTLS/smtp.office365.com";
            client.EnableSsl = true;
            client.Send(message);
        }

        private MailMessage GetMail()
        {
            MailMessage mail = new MailMessage();
            mail.IsBodyHtml = true;
            mail.Body = setHtmlMessage();
            mail.From = new MailAddress(myAddress, myName);
            mail.To.Add(targetAddress);
            mail.Subject = "Payment ID: " + Request.QueryString["paymentid"];

            return mail;
        }

        private string setHtmlMessage()
        {
            DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
            DataTable dt = dv.ToTable();
            string htmlBody = "<p>Dear " + username + "," + @"</p> <p>Below are the items you have purchased: </p>";


            htmlBody += " <table style=" + @"border: 1px solid black" + ">";

            foreach (DataRow row in dt.Rows)
            {
                htmlBody += "<tr><td>" + row["artName"] + "</td>";

                htmlBody += "<td></td><td>" + "x" + row["Quantity"] + "</td></tr>";

            }
            htmlBody += "<tr><td>Total:</td><td>RM</td><td>" + Request.QueryString["grandTotal"] + "</td></tr>";
            htmlBody += "</table>";

            htmlBody += "<br/> <br/><p>Sincerely,<br>Penny Juice</br></p>";

            return htmlBody;
        }
    }
}