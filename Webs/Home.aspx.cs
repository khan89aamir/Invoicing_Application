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

            System.Data.DataTable dt = objClient.ValidateLogin(txtUserName.Value, txtPassword.Value);
            if (dt != null && dt.Rows.Count > 0)
            {
                Session["UserID"] = dt.Rows[0]["UserID"].ToString();
                Session["UserName"] = txtUserName.Value;
                Session["DefaultValue"] = dt.Rows[0]["StateID"].ToString();
                Session["StateName"] = dt.Rows[0]["StateName"].ToString();
            }
            else
            {
                lblPassMessage.Attributes.Remove("d-none");
                lblPassMessage.Attributes.Add("class", "d -block");

                //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect UserName or Password')", true);
            }
        }

        protected void Test_Click(object sender, EventArgs e)
        {
            Invoicing_Service.Invoicing_ServiceSoapClient objClient = new Invoicing_Service.Invoicing_ServiceSoapClient();
           string result= objClient.TestLastInvoiceNo();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+ result + "')", true);
        }
    }
}