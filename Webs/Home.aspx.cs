using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invoicing_Application.Webs
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserID"] == null && IsPostBack)
            //{
            //    Response.Redirect("Home.aspx");
            //}
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Invoicing_Service.Invoicing_ServiceSoapClient objClient = new Invoicing_Service.Invoicing_ServiceSoapClient();

            if (objClient.Login(txtUserName.Value, txtPassword.Value))
            {
                Session["UserID"] = "1";
                Session["UserName"] = txtUserName.Value;


                Session["DefaultValue"] = objClient.GetDefaultState();

            }
            else
            {
                lblPassMessage.Attributes.Remove("d-none");
                lblPassMessage.Attributes.Add("class","d -block");

              //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect UserName or Password')", true);
            }
           

        }
     
    }
}
