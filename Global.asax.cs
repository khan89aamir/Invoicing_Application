using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Invoicing_Application.Webs
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Response.Redirect("~/Webs/Home.aspx");
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception exception = Server.GetLastError();

            //Redirect HTTP errors to Your Error page
            //Server.Transfer("~/CustomErrors/not_found_404.html");
            //Response.Redirect("~/CustomErrors/not_found_404.html");
            // Clear the error from the server to avoid infinite looping
            //Server.ClearError();
        }

        protected void Session_End(object sender, EventArgs e)
        {
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}