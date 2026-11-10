using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ooo
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

            if (!currentPage.Equals("Adminlogin.aspx", StringComparison.OrdinalIgnoreCase))
            {
                if (Session["AdminUser"] == null)
                {
                    Response.Redirect("Adminlogin.aspx");
                }
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("AdminLogin.aspx");
        }
    }
}



