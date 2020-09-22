using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invoicing_Application.Report.Report_Pages
{
    public partial class Invoice_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadReport();
            PrintToPDF();
        }
        public void LoadReport()
        {

            Invoicing_Application.Invoicing_Service.Invoicing_ServiceSoapClient ObjClient = new Invoicing_Service.Invoicing_ServiceSoapClient();

            try
            {
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report/RDLC_Files/InvoiceReport.rdlc");

                DataTable dt = ObjClient.GetSalesDetails();
                DataTable dtTax = ObjClient.GetTaxCalculation();
                DataTable  dtHeaderAddress=ObjClient.GetOwmnerHeaderInfo();



                ReportParameter pAddress = new ReportParameter("pAddress",  "Location: "+ dtHeaderAddress.Rows[0]["Address"].ToString());
                ReportParameter pEmail = new ReportParameter("pEmail", "Email :"+ dtHeaderAddress.Rows[0]["EmailID"].ToString());
                ReportParameter pMobile = new ReportParameter("pMobile","Mobile: "+dtHeaderAddress.Rows[0]["MobileNo"].ToString());
                ReportParameter pGST = new ReportParameter("pGST", "GSTIN : "+ dtHeaderAddress.Rows[0]["GSTNO"].ToString());

                ReportDataSource datasource1 = new ReportDataSource("ds_SalesDetails", dt);
                ReportDataSource datasource2 = new ReportDataSource("ds_TaxCalculation", dtTax);

                ReportViewer1.LocalReport.DataSources.Clear();

                ReportViewer1.LocalReport.SetParameters(pAddress);
                ReportViewer1.LocalReport.SetParameters(pEmail);
                ReportViewer1.LocalReport.SetParameters(pMobile);
                ReportViewer1.LocalReport.SetParameters(pGST);


                ReportViewer1.LocalReport.DataSources.Add(datasource1);
                ReportViewer1.LocalReport.DataSources.Add(datasource2);


            }
            catch (Exception ex)
            {

                Response.Write(ex.ToString());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          //  LoadReport();
        }

        private void PrintToPDF()
        {
            Warning[] warnings;
            string[] streamIds;
            string contentType;
            string encoding;
            string extension;

            //Export the RDLC Report to Byte Array.
            byte[] bytes = ReportViewer1.LocalReport.Render("PDF", null, out contentType, out encoding, out extension, out streamIds, out warnings);

            File.WriteAllBytes(Server.MapPath("~/Temp/Reprot.pdf"), bytes);

            string strURL = "../../Temp/Reprot.pdf";
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "window.location.href = '" + strURL + "';", true);


        }
    }
}