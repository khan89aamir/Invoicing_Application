using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invoicing_Application.Webs
{
    public partial class RequestHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string SetLoginSession(string UserName, string DefaulStatetValue, int UserID)
        {
            //HttpContext.Current.Session["UserID"] = UserID;
            //HttpContext.Current.Session["UserName"] = UserName;
            //HttpContext.Current.Session["DefaultValue"] = DefaulStatetValue;

            //return "Session Set Successfully. Deafult :"+ DefaulStatetValue;
            return "";
        }

        [System.Web.Services.WebMethod]
        public static string LogOut()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();

            return "Session destoryed";
        }
    }
}