using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace ooo
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        // 1. Declare Global Variables
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        private ReportDocument cr = new ReportDocument();
        static string Crypath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Dashboard stats code
            }
        }

        // 2. Database Connection Method
        void getcon()
        {
            string s = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        // 3. Button Event: Dynamic XML Creation & PDF Export
        protected void btnWishlistReport_Click(object sender, EventArgs e)
        {
            try
            {
                getcon();

                // Fetch data from database
                da = new SqlDataAdapter("SELECT * FROM Wishlist_tbl", con);
                ds = new DataSet();
                da.Fill(ds, "Wishlist_tbl");

                // Create dynamic XML file schema
                string xmlPath = Server.MapPath("~/WishlistData.xml");
                ds.WriteXmlSchema(xmlPath);

                // Load Crystal Report & Set Data Source
                string path = Server.MapPath("~/WishlistReport.rpt");
                cr.Load(path);
                cr.SetDataSource(ds.Tables[0]);
                cr.Refresh();

                // Clear & Buffer Response to prevent loading errors
                Response.Clear();
                Response.Buffer = true;

                // Export & Download PDF
                cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "WishlistDetails");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
            finally
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        // Memory Unload
        protected void Page_Unload(object sender, EventArgs e)
        {
            if (cr != null)
            {
                cr.Close();
                cr.Dispose();
            }
        }
    }
}