using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace ooo
{
    public partial class Cart : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            int userId = Session["UserID"] != null ? Convert.ToInt16(Session["UserID"]) : 1;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // ImagePath ne TRIM kari check karyu jethi trailing spaces nikde
                string query = @"SELECT c.Cart_user_id, c.Cart_product_id, c.Quantity, c.Total, 
                                        p.ProductName, LTRIM(RTRIM(p.ImagePath)) AS ProductImage, p.Price 
                                 FROM Cart_tbl c 
                                 INNER JOIN Products p ON c.Cart_product_id = p.ProductID 
                                 WHERE c.Cart_user_id = @UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptCart.DataSource = dt;
                rptCart.DataBind();

                decimal grandTotal = 0;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["Total"] != DBNull.Value && row["Total"] != null)
                    {
                        grandTotal += Convert.ToDecimal(row["Total"]);
                    }
                }

                lblSubtotal.Text = grandTotal.ToString("F2");
                lblTotal.Text = grandTotal.ToString("F2");
            }
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int productId = Convert.ToInt16(e.CommandArgument);
            int userId = Session["UserID"] != null ? Convert.ToInt16(Session["UserID"]) : 1;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                if (e.CommandName == "Plus")
                {
                    string query = @"UPDATE Cart_tbl 
                                     SET Quantity = Quantity + 1, 
                                         Total = (Quantity + 1) * (SELECT Price FROM Products WHERE ProductID = @ProductId)
                                     WHERE Cart_user_id = @UserId AND Cart_product_id = @ProductId";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.ExecuteNonQuery();
                }
                else if (e.CommandName == "Minus")
                {
                    string query = @"UPDATE Cart_tbl 
                                     SET Quantity = CASE WHEN Quantity > 1 THEN Quantity - 1 ELSE 1 END, 
                                         Total = CASE WHEN Quantity > 1 THEN (Quantity - 1) * (SELECT Price FROM Products WHERE ProductID = @ProductId) ELSE (SELECT Price FROM Products WHERE ProductID = @ProductId) END
                                     WHERE Cart_user_id = @UserId AND Cart_product_id = @ProductId";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.ExecuteNonQuery();
                }
                else if (e.CommandName == "Remove")
                {
                    string query = "DELETE FROM Cart_tbl WHERE Cart_user_id = @UserId AND Cart_product_id = @ProductId";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.ExecuteNonQuery();
                }
            }

            BindCart();
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            int userId = Session["UserID"] != null ? Convert.ToInt16(Session["UserID"]) : 1;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Repeater ne darek row loop ma check kare
                foreach (RepeaterItem item in rptCart.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        // Plus/Minus Control 
                        LinkButton btnMinus = (LinkButton)item.FindControl("btnMinus");
                        LinkButton btnPlus = (LinkButton)item.FindControl("btnPlus");

                        string pIdString = btnMinus != null ? btnMinus.CommandArgument : (btnPlus != null ? btnPlus.CommandArgument : "");

                        if (!string.IsNullOrEmpty(pIdString))
                        {
                            int productId = Convert.ToInt16(pIdString);

                            // TextBox mathi updated quantity 
                            TextBox txtQty = (TextBox)item.FindControl("txtQuantity");
                            int newQty = 0;

                            if (txtQty != null && int.TryParse(txtQty.Text, out newQty))
                            {
                                if (newQty > 0)
                                {
                                    // Database update query
                                    string query = @"UPDATE Cart_tbl 
                                             SET Quantity = @Qty, 
                                                 Total = @Qty * (SELECT Price FROM Products WHERE ProductID = @ProductId)
                                             WHERE Cart_user_id = @UserId AND Cart_product_id = @ProductId";

                                    SqlCommand cmd = new SqlCommand(query, con);
                                    cmd.Parameters.AddWithValue("@Qty", newQty);
                                    cmd.Parameters.AddWithValue("@UserId", userId);
                                    cmd.Parameters.AddWithValue("@ProductId", productId);
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }
                    }
                }
            }

            // Direct Database mathi navi values re-fetch kari bind kare
            BindCart();
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShopSidebar.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}