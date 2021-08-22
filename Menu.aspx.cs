using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Asgm
{
    public partial class CustomerGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                custGalleryViewing.Text = "All";
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection connect;
                connect = new SqlConnection(strCon);

                string selectQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID";

                SqlCommand artSelect = new SqlCommand(selectQuery, connect);
                connect.Open();

                SqlDataAdapter artAdapt = new SqlDataAdapter();
                artAdapt.SelectCommand = artSelect;
                DataSet artSet = new DataSet();
                artAdapt.Fill(artSet);
                custGalleryList.DataSource = artSet;
                custGalleryList.DataBind();

                connect.Close();
            }
            else
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection connect;
                connect = new SqlConnection(strCon);
                string selectedCategory = custGalleryFilter.SelectedItem.Value;
                string selectedSort = custGallerySort.SelectedItem.Value;
                string combinedQuery = "";
                custGalleryViewing.Text = selectedCategory; 

                if (selectedCategory == "All")
                {
                    if (selectedSort == "None")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID";
                    }
                    else if (selectedSort == "Price Ascending")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID ORDER BY Price";
                    }
                    else if (selectedSort == "Price Descending")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID ORDER BY Price DESC";
                    }
                    else if (selectedSort == "Stock Ascending")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID ORDER BY Stock";
                    }
                    else if (selectedSort == "Stock Descending")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID ORDER BY Stock DESC";
                    }

                    connect.Open();
                    string selectQuery = combinedQuery;
                    SqlCommand artSelect = new SqlCommand(selectQuery, connect);

                    SqlDataAdapter artAdapt = new SqlDataAdapter();
                    artAdapt.SelectCommand = artSelect;
                    DataSet artSet = new DataSet();
                    artAdapt.Fill(artSet);
                    custGalleryList.DataSource = artSet;
                    custGalleryList.DataBind();

                    connect.Close();
                }
                else
                {
                    if (selectedSort == "None")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'";
                    }
                    else if (selectedSort == "Price Ascending")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'" + " ORDER BY Price";
                    }
                    else if (selectedSort == "Price Descending")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'" + " ORDER BY Price DESC";
                    }
                    else if (selectedSort == "Stock Ascending")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'" + " ORDER BY Stock";
                    }
                    else if (selectedSort == "Stock Descending")
                    {
                        combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'" + " ORDER BY Stock DESC";
                    }

                    connect.Open();
                    string selectQuery = combinedQuery;
                    SqlCommand artSelect = new SqlCommand(selectQuery, connect);

                    SqlDataAdapter artAdapt = new SqlDataAdapter();
                    artAdapt.SelectCommand = artSelect;
                    DataSet artSet = new DataSet();
                    artAdapt.Fill(artSet);
                    custGalleryList.DataSource = artSet;
                    custGalleryList.DataBind();

                    connect.Close();
                }
            }
        }

        protected void custGalleryList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName== "viewDetails")
            {
                //Response.Write("<script language=javascript>alert('"+ e.CommandArgument.ToString() +"') </script>");
                Response.Redirect("MenuDetails.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        protected void custGalleryFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            
        }

        protected void filterSortConfirm_Click(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection connect;
            connect = new SqlConnection(strCon);
            string selectedCategory = custGalleryFilter.SelectedItem.Value;
            string selectedSort = custGallerySort.SelectedItem.Value;
            string combinedQuery = "";
            custGalleryViewing.Text = selectedCategory;

            if (selectedCategory == "All")
            {
                if (selectedSort == "None")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID";
                }
                else if (selectedSort == "Price Ascending")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID ORDER BY Price";
                }
                else if (selectedSort == "Price Descending")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID ORDER BY Price DESC";
                }
                else if (selectedSort == "Stock Ascending")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID ORDER BY Stock";
                }
                else if (selectedSort == "Stock Descending")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID ORDER BY Stock DESC";
                }

                connect.Open();
                string selectQuery = combinedQuery;
                SqlCommand artSelect = new SqlCommand(selectQuery, connect);
                
                SqlDataAdapter artAdapt = new SqlDataAdapter();
                artAdapt.SelectCommand = artSelect;
                DataSet artSet = new DataSet();
                artAdapt.Fill(artSet);
                custGalleryList.DataSource = artSet;
                custGalleryList.DataBind();

                connect.Close();
            }
            else
            {
                if (selectedSort == "None")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'";
                }
                else if (selectedSort == "Price Ascending")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'" + " ORDER BY Price";
                }
                else if (selectedSort == "Price Descending")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'" + " ORDER BY Price DESC";
                }
                else if (selectedSort == "Stock Ascending")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'" + " ORDER BY Stock";
                }
                else if (selectedSort == "Stock Descending")
                {
                    combinedQuery = "SELECT * FROM ArtGalleryData INNER JOIN UserDetail ON ArtGalleryData.UserID = UserDetail.UserID WHERE ArtGalleryData.Category = '" + selectedCategory + "'" + " ORDER BY Stock DESC";
                }

                connect.Open();
                string selectQuery = combinedQuery;
                SqlCommand artSelect = new SqlCommand(selectQuery, connect);
                
                SqlDataAdapter artAdapt = new SqlDataAdapter();
                artAdapt.SelectCommand = artSelect;
                DataSet artSet = new DataSet();
                artAdapt.Fill(artSet);
                custGalleryList.DataSource = artSet;
                custGalleryList.DataBind();

                connect.Close();
            }
        }
    }
}