using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ooo
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
          // Web.config  connection
            string connString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                // sql query check 
                string query = "SELECT COUNT(*) FROM Users WHERE (Username = @User OR Email = @User) AND PasswordHash = @Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@User", txtLoginUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtLoginPassword.Text.Trim());

                    try
                    {
                        con.Open();
                        int userCount = Convert.ToInt16(cmd.ExecuteScalar());
                        con.Close();

                       
                        if (userCount > 0)
                        {
                            // user 
                            Session["User"] = txtLoginUser.Text.Trim();

                            // login success
                            Response.Write("<script>alert('Login Successful!'); window.location='WebForm1.aspx';</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid Username/Email or Password!');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
                    }
                }
            }

        }
    }
}