using System;
using System.Data.SqlClient;
using System.Configuration;

namespace ooo
{
    public partial class Checkout : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderTotals();
            }
        }

         void LoadOrderTotals()
        {
            int userId = Session["UserID"] != null ? Convert.ToInt16(Session["UserID"]) : 1;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // CAST() function text (nchar) type ne numeric ma convert karse jethi SUM() chaale
                string query = "SELECT SUM(CAST(Total AS DECIMAL(18,2))) FROM Cart_tbl WHERE Cart_user_id = @UserId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                con.Open();
                object result = cmd.ExecuteScalar();

                if (result != DBNull.Value && result != null)
                {
                    decimal grandTotal = Convert.ToDecimal(result);
                    lblSubtotal.Text = grandTotal.ToString("F2");
                    lblTotal.Text = grandTotal.ToString("F2");
                }
                else
                {
                    lblSubtotal.Text = "0.00";
                    lblTotal.Text = "0.00";
                }
            }
        }

         void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            int userId = Session["UserID"] != null ? Convert.ToInt16(Session["UserID"]) : 1;

            string paymentMode = "Direct Bank Transfer";
            if (rbCheck.Checked) paymentMode = "Check Payment";
            else if (rbCOD.Checked) paymentMode = "Cash on Delivery";
            else if (rbPaypal.Checked) paymentMode = "PayPal";

            string fullAddress = txtAddress1.Text + " " + txtAddress2.Text;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // 1. Get Grand Total with CAST conversion
                string totalQuery = "SELECT SUM(CAST(Total AS DECIMAL(18,2))) FROM Cart_tbl WHERE Cart_user_id = @UserId";
                SqlCommand cmdTotal = new SqlCommand(totalQuery, con);
                cmdTotal.Parameters.AddWithValue("@UserId", userId);
                object totalResult = cmdTotal.ExecuteScalar();
                decimal totalAmount = (totalResult != DBNull.Value && totalResult != null) ? Convert.ToDecimal(totalResult) : 0;

                if (totalAmount > 0)
                {
                    // 2. Insert into Orders_tbl
                    string insertOrder = @"INSERT INTO Orders_tbl (UserId, FirstName, LastName, Address, City, State, ZipCode, Phone, Email, TotalAmount, PaymentMode, OrderDate) 
                                           VALUES (@UserId, @FName, @LName, @Address, @City, @State, @Zip, @Phone, @Email, @Total, @PaymentMode, GETDATE())";

                    SqlCommand cmdInsert = new SqlCommand(insertOrder, con);
                    cmdInsert.Parameters.AddWithValue("@UserId", userId);
                    cmdInsert.Parameters.AddWithValue("@FName", txtFirstName.Text);
                    cmdInsert.Parameters.AddWithValue("@LName", txtLastName.Text);
                    cmdInsert.Parameters.AddWithValue("@Address", fullAddress);
                    cmdInsert.Parameters.AddWithValue("@City", txtCity.Text);
                    cmdInsert.Parameters.AddWithValue("@State", ddlState.SelectedValue);
                    cmdInsert.Parameters.AddWithValue("@Zip", txtZip.Text);
                    cmdInsert.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmdInsert.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmdInsert.Parameters.AddWithValue("@Total", totalAmount);
                    cmdInsert.Parameters.AddWithValue("@PaymentMode", paymentMode);
                    cmdInsert.ExecuteNonQuery();

                    // 3. Clear Cart
                    string clearCart = "DELETE FROM Cart_tbl WHERE Cart_user_id = @UserId";
                    SqlCommand cmdClear = new SqlCommand(clearCart, con);
                    cmdClear.Parameters.AddWithValue("@UserId", userId);
                    cmdClear.ExecuteNonQuery();

                    // 4. Redirect with confirmation
                    Response.Write("<script>alert('Order Placed Successfully!'); window.location='ShopSidebar.aspx';</script>");
                }
            }
        }
    }
}