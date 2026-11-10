using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ooo
{
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection con; // Connections 
        SqlCommand cmd; // Insert, update, delete 
        SqlDataAdapter da; // Container 
        DataSet ds; // Select 
        string nm;

        // database connection satup
        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            if (fileImg.HasFile)
            {
                string folderPath = Server.MapPath("~/Images/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                nm = "~/Images/" + fileImg.FileName; // Fetch Filename with Path
                fileImg.SaveAs(Server.MapPath(nm)); // Copy File on Specified Location
            }
        }

        void clear()
        {
            txtName.Text = "";
            ddlCategory.SelectedIndex = 0;
            txtPrice.Text = "";
            txtDesc.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial load logic
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Validation Check
            if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(ddlCategory.SelectedValue) || string.IsNullOrEmpty(txtPrice.Text) || !fileImg.HasFile)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please fill in all details and select an image.";
                return;
            }

            try
            {
                getcon();
                imgupload();

                // Direct insert query 
                cmd = new SqlCommand("INSERT INTO Products(ProductName, Category, Price, Description, ImagePath) VALUES('" + txtName.Text.Trim() + "', '" + ddlCategory.SelectedValue + "', '" + txtPrice.Text.Trim() + "', '" + txtDesc.Text.Trim() + "', '" + nm + "')", con);

                cmd.ExecuteNonQuery(); //run query

                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Product added successfully!";
                clear();
            }
            catch (Exception ex)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Error: " + ex.Message;
            }
        }
    }
}