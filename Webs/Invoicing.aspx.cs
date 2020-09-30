using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invoicing_Application.Webs
{
    public partial class Invoicing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          


            if (Session["UserID"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            if (Page.IsPostBack)
            {
                Response.Write("Page psoted back");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["InvoiceID"]!=null)
                {
                    string InvoiceID = Request.QueryString["InvoiceID"].ToString();
                    txtBindInvoiceID.Value = InvoiceID;
                  
                   // ClientScript.RegisterStartupScript(this.GetType(), "updateProgress", "Test('" + InvoiceID + "');", true);
                }
             
            }


        }
    }
}