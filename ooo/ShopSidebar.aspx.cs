using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ooo
{
    public partial class ShopSidebar : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT ProductId, ProductName, Price, ImagePath FROM Products", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                rptProducts.DataSource = dt;
                rptProducts.DataBind();
            }
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int userId = Session["UserID"] != null ? Convert.ToInt32(Session["UserID"]) : 1;

            if (e.CommandName == "AddToCart")
            {
                // Existing Add to Cart logic
            }
            else if (e.CommandName == "AddToWishlist")
            {
                int productId = Convert.ToInt32(e.CommandArgument);

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    // Product wishlist thay ke nay te check kare
                    string checkQuery = "SELECT COUNT(*) FROM Wishlist_tbl WHERE UserId = @UserId AND ProductId = @ProductId";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    checkCmd.Parameters.AddWithValue("@ProductId", productId);

                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (count == 0)
                    {
                        // table ma save thay
                        string insertQuery = "INSERT INTO Wishlist_tbl (UserId, ProductId) VALUES (@UserId, @ProductId)";
                        SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                        insertCmd.Parameters.AddWithValue("@UserId", userId);
                        insertCmd.Parameters.AddWithValue("@ProductId", productId);
                        insertCmd.ExecuteNonQuery();

                       
                        Response.Write("<script>alert('Added to Wishlist!'); window.location='Wishlist.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Product is already in your Wishlist!'); window.location='Wishlist.aspx';</script>");
                    }
                }
            }
        }
    }
}