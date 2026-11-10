using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace ooo
{
    public partial class Wishlist : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindWishlist();
            }
        }

         void BindWishlist()
        {
            int userId = Session["UserID"] != null ? Convert.ToInt16(Session["UserID"]) : 1;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT w.WishlistId, p.ProductID, p.ProductName, p.Price, p.ImagePath 
                         FROM Wishlist_tbl w
                         INNER JOIN Products p ON w.ProductId = p.ProductID
                         WHERE w.UserId = @UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptWishlist.DataSource = dt;
                rptWishlist.DataBind();
            }
        }

         void rptWishlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int userId = Session["UserID"] != null ? Convert.ToInt16(Session["UserID"]) : 1;

            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt16(e.CommandArgument);

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    // Cart_tbl ma add / update kare
                    string checkQuery = "SELECT Quantity FROM Cart_tbl WHERE Cart_user_id = @UserId AND Cart_product_id = @ProductId";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    checkCmd.Parameters.AddWithValue("@ProductId", productId);

                    object result = checkCmd.ExecuteScalar();

                    if (result != null)
                    {
                        string updateQuery = "UPDATE Cart_tbl SET Quantity = Quantity + 1, Total = (Quantity + 1) * (SELECT Price FROM Products WHERE ProductID = @ProductId) WHERE Cart_user_id = @UserId AND Cart_product_id = @ProductId";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                        updateCmd.Parameters.AddWithValue("@UserId", userId);
                        updateCmd.Parameters.AddWithValue("@ProductId", productId);
                        updateCmd.ExecuteNonQuery();
                    }
                    else
                    {
                        string insertQuery = "INSERT INTO Cart_tbl (Cart_user_id, Cart_product_id, Quantity, Total) VALUES (@UserId, @ProductId, 1, (SELECT Price FROM Products WHERE ProductID = @ProductId))";
                        SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                        insertCmd.Parameters.AddWithValue("@UserId", userId);
                        insertCmd.Parameters.AddWithValue("@ProductId", productId);
                        insertCmd.ExecuteNonQuery();
                    }
                }

                Response.Write("<script>alert('Product moved to Cart!'); window.location='Cart.aspx';</script>");
            }
            else if (e.CommandName == "RemoveWishlist")
            {
                int wishlistId = Convert.ToInt16(e.CommandArgument);

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string deleteQuery = "DELETE FROM Wishlist_tbl WHERE WishlistId = @WishlistId";
                    SqlCommand cmd = new SqlCommand(deleteQuery, con);
                    cmd.Parameters.AddWithValue("@WishlistId", wishlistId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                BindWishlist();
            }
        }
    }
}