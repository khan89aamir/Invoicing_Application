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
        string strInvoiceID;
        string strpartyName;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(LoadReport())
            { 
                PrintToPDF(strpartyName, strInvoiceID);
            }
           
        }
        public bool LoadReport()
        {
            string invoiceID = Request.QueryString["InvoiceID"].ToString();
            string PartyID = Request.QueryString["PartyID"].ToString();
            string IGST = Request.QueryString["IGST"].ToString();

            //string invoiceID = "108";
            //string PartyID = "12";
            //string IGST = "0";


            //string invoiceID = "131";
            //string PartyID = "12";
            //string IGST = "1";


            Invoicing_Application.Invoicing_Service.Invoicing_ServiceSoapClient ObjClient = new Invoicing_Service.Invoicing_ServiceSoapClient();

            try
            {
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                if (IGST=="1")
                {
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report/RDLC_Files/InvoiceReport_IGST.rdlc");
                }
                else
                {
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report/RDLC_Files/InvoiceReport.rdlc");
                }
              

                DataSet dsReportData = ObjClient.GetReportData(invoiceID, PartyID);
              
                DataTable dtInvoiceMaster = dsReportData.Tables[0];
                DataTable dtSalesDetails = dsReportData.Tables[1];
                DataTable dtInvoiceOther = dsReportData.Tables[2];
                DataTable dtPartyDetails = dsReportData.Tables[3];
                DataTable dtMyprofile = dsReportData.Tables[4];

                DataTable dtBankDetails = dsReportData.Tables[5];


                strInvoiceID = dtInvoiceMaster.Rows[0]["InvoiceNumber"].ToString();


                ReportParameter pCGST_Percent = new ReportParameter("pCGST_Percent", "(" + dtInvoiceMaster.Rows[0]["CGST_Percent"].ToString()+"%)");
                ReportParameter pSGST_Percent = new ReportParameter("pSGST_Percent", "(" + dtInvoiceMaster.Rows[0]["SGST_Percent"].ToString()+"%)");
                ReportParameter pIGST_Percent = new ReportParameter("pIGST_Percent", "(" + dtInvoiceMaster.Rows[0]["IGST_Percent"].ToString()+"%)");

                ReportParameter pAddress = new ReportParameter("pAddress",  ""+ dtMyprofile.Rows[0]["Address"].ToString());
                ReportParameter pEmail = new ReportParameter("pEmail", "Email :"+ dtMyprofile.Rows[0]["EmailID"].ToString());
                ReportParameter pMobile = new ReportParameter("pMobile","Mobile: "+ dtMyprofile.Rows[0]["MobileNo"].ToString());
                ReportParameter pGST = new ReportParameter("pGST", "GSTIN :"+ dtMyprofile.Rows[0]["GSTNO"].ToString());
               
                ReportParameter pInvoiceNo = new ReportParameter("pInvoiceNo", dtInvoiceMaster.Rows[0]["InvoiceNumber"].ToString());
                ReportParameter pInvoiceDate = new ReportParameter("pInvoiceDate", Convert.ToDateTime(dtInvoiceMaster.Rows[0]["InvoiceDate"]).ToString("dd-MM-yyyy"));
                ReportParameter pOwnerState = new ReportParameter("pOwnerState", dtMyprofile.Rows[0]["StateName"].ToString());
                ReportParameter parmOwnerStateCode = new ReportParameter("parmOwnerStateCode", dtInvoiceMaster.Rows[0]["GSTStateCode"].ToString());


                ReportParameter pPartyState = new ReportParameter("pPartyState", dtPartyDetails.Rows[0]["StateName"].ToString());

                ReportParameter parmNote = new ReportParameter("parmNote", dtMyprofile.Rows[0]["TermCondition"].ToString());


                ReportParameter pReverseCharge;
                ReportParameter pTransportationMode;
                ReportParameter pVechicleNo;
                ReportParameter pDateofSupply;
                ReportParameter pPlaceofSupply;


                ReportParameter pConName;
                ReportParameter pConAddress;
                ReportParameter pConGST;
                ReportParameter pConStateCode;
                ReportParameter pConState;
                string strBankDetails = "";

                if (dtBankDetails.Rows.Count>0)
                {
                    strBankDetails = "Bank Name:" + dtBankDetails.Rows[0]["BankName"].ToString() + ",Account No: " +
                      dtBankDetails.Rows[0]["AccountNo"].ToString() + ",IFSC Code:" +
                       dtBankDetails.Rows[0]["IFSC_Code"].ToString() + ",Branch: " +
                        dtBankDetails.Rows[0]["Branch"].ToString();

                }
               


                ReportParameter pBankDetails = new ReportParameter("pBankDetails", strBankDetails);


                if (dtInvoiceOther.Rows.Count>0)
                {
                     pReverseCharge = new ReportParameter("pReverseCharge", dtInvoiceOther.Rows[0]["ReverseCharge"].ToString());
                     pTransportationMode = new ReportParameter("pTransportationMode", dtInvoiceOther.Rows[0]["Transportation_Mode"].ToString());
                     pVechicleNo = new ReportParameter("pVechicleNo", dtInvoiceOther.Rows[0]["Vehicle_Number"].ToString());
                     pDateofSupply = new ReportParameter("pDateofSupply", Convert.ToDateTime(dtInvoiceOther.Rows[0]["SupplyDate"]).ToString("dd-MM-yyyy"));
                     pPlaceofSupply = new ReportParameter("pPlaceofSupply", dtInvoiceOther.Rows[0]["SupplyPlace"].ToString());

                    pConName = new ReportParameter("pConName", dtInvoiceOther.Rows[0]["Consignee_Name"].ToString());
                    pConAddress = new ReportParameter("pConAddress", dtInvoiceOther.Rows[0]["Consignee_Address"].ToString());
                    pConGST = new ReportParameter("pConGST", dtInvoiceOther.Rows[0]["Consignee_GST"].ToString());
                    pConStateCode = new ReportParameter("pConStateCode", dtInvoiceOther.Rows[0]["GSTStateCode"].ToString());
                    pConState = new ReportParameter("pConState", dtInvoiceOther.Rows[0]["StateName"].ToString());
                }
                else
                {
                    pReverseCharge = new ReportParameter("pReverseCharge", "");
                    pTransportationMode = new ReportParameter("pTransportationMode", "");
                    pVechicleNo = new ReportParameter("pVechicleNo", "");
                    pDateofSupply = new ReportParameter("pDateofSupply", "");
                    pPlaceofSupply = new ReportParameter("pPlaceofSupply", "");


                    pConName = new ReportParameter("pConName", "");
                    pConAddress = new ReportParameter("pConAddress", "");
                    pConGST = new ReportParameter("pConGST", "");
                    pConStateCode = new ReportParameter("pConStateCode", "");

                    pConState = new ReportParameter("pConStateCode", "");

                }


                string GrandTotal = dtInvoiceMaster.Rows[0]["AmountAfterGST"].ToString();
                string NetAmt = new NumberToEnglish().changeCurrencyToWords(GrandTotal)+"/-";

                ReportParameter pNetAmount = new ReportParameter("pNetAmount", NetAmt);

                ReportParameter pPartyName = new ReportParameter("pPartyName", dtPartyDetails.Rows[0]["CustomerName"].ToString());
                ReportParameter pPartyAddress = new ReportParameter("pPartyAddress", dtPartyDetails.Rows[0]["Address"].ToString());
                ReportParameter pPartyGST = new ReportParameter("pPartyGST", dtPartyDetails.Rows[0]["GSTNO"].ToString());
                ReportParameter pPartyStateCode = new ReportParameter("pPartyStateCode", dtPartyDetails.Rows[0]["GSTStateCode"].ToString());
                
                strpartyName = dtPartyDetails.Rows[0]["CustomerName"].ToString();

                ReportViewer1.LocalReport.DataSources.Clear();

                ReportViewer1.LocalReport.SetParameters(pAddress);
                ReportViewer1.LocalReport.SetParameters(pEmail);
                ReportViewer1.LocalReport.SetParameters(pMobile);
                ReportViewer1.LocalReport.SetParameters(pGST);

                ReportViewer1.LocalReport.SetParameters(pInvoiceNo);
                ReportViewer1.LocalReport.SetParameters(pInvoiceDate);
                ReportViewer1.LocalReport.SetParameters(pOwnerState);
                ReportViewer1.LocalReport.SetParameters(pPartyState);
                ReportViewer1.LocalReport.SetParameters(pReverseCharge);
                ReportViewer1.LocalReport.SetParameters(pTransportationMode);
                ReportViewer1.LocalReport.SetParameters(pVechicleNo);
                ReportViewer1.LocalReport.SetParameters(pDateofSupply);
           
                ReportViewer1.LocalReport.SetParameters(pPlaceofSupply);
                ReportViewer1.LocalReport.SetParameters(pPartyName);
                ReportViewer1.LocalReport.SetParameters(pPartyAddress);
                ReportViewer1.LocalReport.SetParameters(pPartyGST);
                ReportViewer1.LocalReport.SetParameters(pPartyStateCode);
                ReportViewer1.LocalReport.SetParameters(pConName);
                ReportViewer1.LocalReport.SetParameters(pConAddress);
                ReportViewer1.LocalReport.SetParameters(pConGST);
                ReportViewer1.LocalReport.SetParameters(pConState);
                ReportViewer1.LocalReport.SetParameters(pConStateCode);
                ReportViewer1.LocalReport.SetParameters(pNetAmount);
                ReportViewer1.LocalReport.SetParameters(pBankDetails);
                ReportViewer1.LocalReport.SetParameters(parmNote);

                ReportViewer1.LocalReport.SetParameters(pCGST_Percent);
                ReportViewer1.LocalReport.SetParameters(pSGST_Percent);
                ReportViewer1.LocalReport.SetParameters(pIGST_Percent);
                ReportViewer1.LocalReport.SetParameters(parmOwnerStateCode);

              

                DataTable dtGST = new DataTable();
                dtGST.Columns.Add("Percent");
                dtGST.Columns.Add("Amount");

                DataRow dRow=  dtGST.NewRow();
                dRow["Percent"] = "Percent";
                dRow["Amount"] = "Amount";

                dtGST.Rows.Add(dRow);
                

                ReportDataSource datasource1 = new ReportDataSource("ds_SalesDetails", dtSalesDetails);
                ReportDataSource datasource2 = new ReportDataSource("ds_TaxCalculation", dtInvoiceMaster);
                ReportDataSource datasource3 = new ReportDataSource("ds_GST", dtGST);

                ReportViewer1.LocalReport.DataSources.Add(datasource1);
                ReportViewer1.LocalReport.DataSources.Add(datasource2);
                ReportViewer1.LocalReport.DataSources.Add(datasource3);

                return true;   
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.ToString() + "');", true); ;
                Response.Write(ex.ToString());
                return false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          //  LoadReport();
        }

        private void PrintToPDF(string PartyName, string invoiceID)
        {
            Warning[] warnings;
            string[] streamIds;
            string contentType;
            string encoding;
            string extension;

            string str = PartyName;
            str = str.Replace(" ", "");
            string fileName = str + "_" + DateTime.Now.Day + "-" + DateTime.Now.Month + "-" + DateTime.Now.Year + "_"+ invoiceID; 


            //Export the RDLC Report to Byte Array.
            byte[] bytes = ReportViewer1.LocalReport.Render("PDF", null, out contentType, out encoding, out extension, out streamIds, out warnings);

            File.WriteAllBytes(Server.MapPath("~/Temp/"+ fileName + ".pdf"), bytes);

            string strURL = "../../Temp/"+ fileName + ".pdf";

            string DefaultURL = "../../Webs/Invoicing.aspx";

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage1", "window.location.href = '" + DefaultURL + "';", true);

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage2", "window.location.href = '" + strURL + "';", true);

            //  ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "  window.open('"+ strURL + "');", true);
            
        }
    }
}