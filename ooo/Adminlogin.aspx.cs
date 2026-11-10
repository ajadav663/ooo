using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ooo
{
    public partial class Adminlogin : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial page load logic if needed
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Validation: Check if Username or Password fields are empty
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both Username and Password.";
                return;
            }

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // SQL query to verify Admin credentials[cite: 1]
                string query = "SELECT COUNT(1) FROM Admin WHERE Username = @Username AND Password = @Password";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    con.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count == 1)
                    {
                        // Store logged in admin username in Session
                        Session["AdminUser"] = username;

                        // Redirect to your target page after successful login
                        Response.Redirect("AddProduct.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Username or Password!";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}

