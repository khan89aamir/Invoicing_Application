using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invoicing_Application
{
    public partial class Invoicing : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
          

            string DefaultURL = "Home.aspx";

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage2", "window.location.href = '" + DefaultURL + "';", true);


        }
    }
}