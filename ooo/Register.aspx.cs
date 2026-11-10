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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!chkTerms.Checked)
            {
                Response.Write("<script>alert('Please accept the Terms & Conditions to sign up!');</script>");
                return;
            }

            if (txtPassword.Text == txtConfirmPassword.Text)
            {
                string connString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connString))
                {
                   
                    string query = "INSERT INTO Users (Username, Email, PasswordHash, ConfirmPassword) VALUES (@Username, @Email, @Password, @ConfirmPassword)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                       
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim()); 
                        cmd.Parameters.AddWithValue("@ConfirmPassword", txtConfirmPassword.Text.Trim());

                        try
                        {
                            con.Open();
                            cmd.ExecuteNonQuery(); 
                            con.Close();

                            Response.Write("<script>alert('Registration Successful!'); window.location='Account.aspx';</script>");
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
                        }
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
            }
        }
    }
}
