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
    public partial class ManageProducts : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT ProductID, ProductName, Category, Price, ImagePath FROM Products", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            LoadProducts();
        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            LoadProducts();
        }

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int productId = Convert.ToInt16(gvProducts.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvProducts.Rows[e.RowIndex];

            // Textbox value
            string productName = ((TextBox)row.Cells[1].Controls[0]).Text;
            string category = ((TextBox)row.Cells[2].Controls[0]).Text;
            decimal price = Convert.ToDecimal(((TextBox)row.Cells[3].Controls[0]).Text);

            // Control fileupload
            FileUpload fuProductImage = (FileUpload)row.FindControl("fuProductImage");
            HiddenField hfImagePath = (HiddenField)row.FindControl("hfImagePath");

            string imagePath = hfImagePath.Value;

            // new image save 
            if (fuProductImage != null && fuProductImage.HasFile)
            {
                string fileName = Path.GetFileName(fuProductImage.FileName);
                string folderPath = "~/Images/" + fileName;

                fuProductImage.SaveAs(Server.MapPath(folderPath));
                imagePath = folderPath;
            }

            // database upadate
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Products SET ProductName = @ProductName, Category = @Category, Price = @Price, ImagePath = @ImagePath WHERE ProductID = @ID", con);
                cmd.Parameters.AddWithValue("@ProductName", productName);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                cmd.Parameters.AddWithValue("@ID", productId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvProducts.EditIndex = -1;
            LoadProducts();
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = Convert.ToInt16(gvProducts.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductID = @ID", con);
                cmd.Parameters.AddWithValue("@ID", productId);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadProducts();
        }
    }
}