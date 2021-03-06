﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace Invoicing_Application.Service
{
    /// <summary>
    /// Summary description for Invoicing_Service
    /// </summary>
    [WebService(Namespace = "http://anjacreation.in/Service")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Invoicing_Service : System.Web.Services.WebService
    {
        clsMySQLCoreApp ObjDAL = new clsMySQLCoreApp();

        [WebMethod]
        public string GetSelectedCustomer(int CustomerID)
        {

            string strQ = "SELECT GSTNo,Address,c1.StateID, s1.StateName FROM   anjacreation.tblCustomerMaster c1 inner join " +
                        "   anjacreation.tblStateMaster s1 on c1.StateID = s1.StateID where CustomerID=" + CustomerID;

            DataTable dataTable = ObjDAL.ExecuteSelectStatement(strQ);
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    GSTNo = r.Field<string>("GSTNo"),
                                    Address = r.Field<string>("Address"),
                                    StateID = r.Field<int>("StateID"),
                                    StateName = r.Field<string>("StateName"),
                                });
                string strResponse = JsonConvert.SerializeObject(NameList);

                strResponse = strResponse.Trim().Replace("\r\n", string.Empty);

                return strResponse;

                //Context.Response.Clear();
                //Context.Response.ContentType = "application/json";
                //Context.Response.AddHeader("content-length", strResponse.Length.ToString());
                //Context.Response.Write(strResponse);
                //Context.Response.Flush();
                //Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                clsMessage message = new clsMessage();
                message.strMessage = "No records found";
                message.Result = true;

                return JsonConvert.SerializeObject(message);
                //Context.Response.Clear();
                //this.Context.Response.ContentType = "application/json; charset=utf-8";
                //this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindState()
        {
            string strResponse = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT StateID,StateName FROM   anjacreation.tblStateMaster");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    StateID = r.Field<int>("StateID"),
                                    StateName = r.Field<string>("StateName"),
                                });
                strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.Clear();
                Context.Response.ContentType = "application/json";

                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                //clsMessage message = new clsMessage();
                //message.strMessage = "No records found";
                //message.Result = true;

                Context.Response.Clear();
                Context.Response.ContentType = "application/json";

                //this.Context.Response.ContentType = "application/json; charset=utf-8";
                //this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindHSNCode()
        {
            string strResponse = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT HSNID,HSNCode FROM anjacreation.tblHSNMaster;");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var HSNCodeList = (from r in dataTable.AsEnumerable()
                                   select new
                                   {
                                       HSNID = r.Field<int>("HSNID"),
                                       HSNCode = r.Field<string>("HSNCode"),
                                   });
                strResponse = JsonConvert.SerializeObject(HSNCodeList);
                Context.Response.Clear();
                Context.Response.ContentType = "application/json; charset=utf-8";
                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                Context.Response.Clear();
                Context.Response.ContentType = "application/json";
            }
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ManageProducts(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int HSNID, int UserID)
        {
            clsMessage message = new clsMessage();

            Description = Description.Length == 0 ? "0" : Description.Trim();

            ObjDAL.SetStoreProcedureData("ParmSKUCode", MySqlConnector.MySqlDbType.VarChar, SKUCode.Trim(), clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmSKUName", MySqlConnector.MySqlDbType.VarChar, SKUName.Trim(), clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmRate", MySqlConnector.MySqlDbType.Decimal, Rate, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmDescription", MySqlConnector.MySqlDbType.VarChar, Description, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmProductID", MySqlConnector.MySqlDbType.Int32, ProudctID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmHSNID", MySqlConnector.MySqlDbType.Int32, HSNID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmFlag", MySqlConnector.MySqlDbType.Int32, 0, clsMySQLCoreApp.ParamType.Output);
            ObjDAL.SetStoreProcedureData("ParmMsg", MySqlConnector.MySqlDbType.VarChar, 0, clsMySQLCoreApp.ParamType.Output);

            bool result = ObjDAL.ExecuteStoreProcedure_DML("anjacreation.SPR_Insert_SKUDetails");
            if (result)
            {
                message.Result = false;
                DataTable dtOutput = ObjDAL.GetOutputParmData();
                DataRow[] dflag = dtOutput.Select("ParmName='ParmFlag'");
                DataRow[] dRow = dtOutput.Select("ParmName='ParmMsg'");
                if (dRow.Length > 0)
                {
                    message.strMessage = dRow[0]["Value"].ToString();
                }
                if (dflag.Length > 0)
                {
                    message.Result = Convert.ToBoolean(dflag[0]["Value"]);
                }
                //if (ProudctID == 0)
                //{
                //    message.strMessage = "SKU [" + SKUName + "] has been Created successfully";
                //}
                //else
                //{
                //    message.strMessage = "SKU [" + SKUName + "] has been Updated successfully";
                //}
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to Save SKU " + SKUName + ". Error : " + ObjDAL.strErrorText;
            }
            string strResponse = JsonConvert.SerializeObject(message);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetSKUDetails()
        {
            // System.Threading.Thread.Sleep(2000);
            string jsonData = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("CALL anjacreation.SPR_GetSKUDetails()");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                jsonData = DataTableToJSONWithJSONNet(dataTable);
            }
            //Context.Response.ContentType = "application/json";
            //Context.Response.Write(jsonData);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", jsonData.Length.ToString());
            Context.Response.Write(jsonData);
            Context.Response.Flush();
        }


        public string DataTableToJSONWithJSONNet(DataTable table)
        {
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(table);
            return JSONString;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void DeleteSKU(int SKUID)
        {
            clsMessage message = new clsMessage();

            int result = ObjDAL.ExecuteNonQuery("DELETE FROM  anjacreation.tblSKUMaster WHERE SKUID=" + SKUID);
            if (result > 0)
            {
                message.Result = true;
                message.strMessage = "SKU have been deleted.";
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to Delete SKU.";
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.Write(js.Serialize(message));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void DeleteInvoice(int InvoiceID)
        {
            clsMessage message = new clsMessage();

            ObjDAL.SetStoreProcedureData("parmSaleInvoiceID", MySqlConnector.MySqlDbType.Int16, InvoiceID);
            bool result = ObjDAL.ExecuteStoreProcedure_DML("SPR_DeleteInvoice");


            if (result)
            {
                message.Result = true;
                message.strMessage = "Invoice have been deleted.";
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to delete the invoice.";
            }

            string strResponse = JsonConvert.SerializeObject(message);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ManageCustomers(string CustomerName, string CompanyName, string GSTNo, string EmailID
            , string Address, int StateID, int CustomerID, int UserID)
        {
            clsMessage message = new clsMessage();

            ObjDAL.SetStoreProcedureData("ParmCustomerName", MySqlConnector.MySqlDbType.VarChar, CustomerName.Trim(), clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCompanyName", MySqlConnector.MySqlDbType.VarChar, CompanyName.Trim(), clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmGSTNo", MySqlConnector.MySqlDbType.VarChar, GSTNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmEmailID", MySqlConnector.MySqlDbType.VarChar, EmailID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmAddress", MySqlConnector.MySqlDbType.VarChar, Address, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCustomerID", MySqlConnector.MySqlDbType.Int32, CustomerID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmStateID", MySqlConnector.MySqlDbType.Int32, StateID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmFlag", MySqlConnector.MySqlDbType.Int32, 0, clsMySQLCoreApp.ParamType.Output);
            ObjDAL.SetStoreProcedureData("ParmMsg", MySqlConnector.MySqlDbType.VarChar, 0, clsMySQLCoreApp.ParamType.Output);

            bool result = ObjDAL.ExecuteStoreProcedure_DML("anjacreation.SPR_Insert_CustomerDetails");
            if (result)
            {
                message.Result = false;
                DataTable dtOutput = ObjDAL.GetOutputParmData();
                DataRow[] dflag = dtOutput.Select("ParmName='ParmFlag'");
                DataRow[] dRow = dtOutput.Select("ParmName='ParmMsg'");
                if (dRow.Length > 0)
                {
                    message.strMessage = dRow[0]["Value"].ToString();
                }
                if (dflag.Length > 0)
                {
                    message.Result = Convert.ToBoolean(dflag[0]["Value"]);
                }
                //if (CustomerID == 0)
                //{
                //    message.strMessage = "Customer Name [" + CustomerName + "] has been Created successfully";
                //}
                //else
                //{
                //    message.strMessage = "Customer Name [" + CustomerName + "] has been Updated successfully";
                //}
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to Save Customer Name " + CustomerName + ". Error : " + ObjDAL.strErrorText;
            }
            string strResponse = JsonConvert.SerializeObject(message);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetCustomerDetails()
        {
            // System.Threading.Thread.Sleep(2000);
            string jsonData = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("CALL anjacreation.SPR_GetCustomerDetails()");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                jsonData = DataTableToJSONWithJSONNet(dataTable);
            }
            //Context.Response.ContentType = "application/json";
            //Context.Response.Write(jsonData);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", jsonData.Length.ToString());
            Context.Response.Write(jsonData);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void DeleteCustomer(int CustomerID)
        {
            clsMessage message = new clsMessage();

            int result = ObjDAL.ExecuteNonQuery("DELETE FROM anjacreation.tblCustomerMaster WHERE CustomerID=" + CustomerID);
            if (result > 0)
            {
                message.Result = true;
                message.strMessage = "Customer have been deleted.";
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to Delete Customer.";
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.Write(js.Serialize(message));
        }

        //[WebMethod]
        public bool Login(string UserName, string Password)
        {
            bool LoginResult = false;

            //object result = ObjDAL.ExecuteScalarQuery("SELECT ProfileID FROM   anjacreation.tblMyProfile WHERE UserName='" + UserName + "' AND CAST(AES_DECRYPT(`Password`, 'UserNameEmailID') AS CHAR(255))='" + Password + "'");
            //if (result != null)
            //{
            //    if (Convert.ToInt32(result) > 0)
            //    {
            //        LoginResult = true;
            //    }
            //    else
            //    {
            //        LoginResult = false;
            //    }
            //}
            //else
            //{
            //    LoginResult = false;
            //}
            return LoginResult;
        }

        [WebMethod]
        public DataTable ValidateLogin(string UserName, string Password)
        {
            DataTable dt = new DataTable();
            ObjDAL.SetStoreProcedureData("ParmUserName", MySqlConnector.MySqlDbType.VarChar, UserName.Trim(), clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmPassword", MySqlConnector.MySqlDbType.VarChar, Password.Trim(), clsMySQLCoreApp.ParamType.Input);

            DataSet ds = ObjDAL.ExecuteStoreProcedure_Get("spr_Validate_Login");
            if (ds != null && ds.Tables.Count > 0)
            {
                dt = ds.Tables[0];
            }
            return dt;
        }
        [WebMethod]
        public string TestLastInvoiceNo()
        {
            // get the last taxinvoice no
            string LastInvoiceNo = GetLastTaxInvoiceNumber();

            // add one
            int CurInvoiceNo = Convert.ToInt32(LastInvoiceNo) + 1;

            // set this new, as next tax invoice number
            ObjDAL.SetStoreProcedureData("parmTaxInvoiceNo", MySqlConnector.MySqlDbType.Int32, CurInvoiceNo, clsMySQLCoreApp.ParamType.Input);

            // format the InvoiceNumber as per given format.
            string InvoiceID = "AC" + CurInvoiceNo.ToString().PadLeft(2, '0') + "/";
            string Year = GetCurrentYear().ToString().Substring(2, 2);
            string nextYear = Convert.ToString(Convert.ToInt32(Year) + 1);
            return  InvoiceID + Year + "-" + nextYear;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetDefaultState()
        {
            string result = "0,NA";
            string strq = "SELECT m.StateID,s.StateName from anjacreation.tblMyProfile m join anjacreation.tblStateMaster s " +
                        " on m.StateID = s.StateID";

            DataTable dtStateDetails = ObjDAL.ExecuteSelectStatement(strq);
            if (dtStateDetails.Rows.Count > 0)
            {
                result = dtStateDetails.Rows[0]["StateID"].ToString() + "," + dtStateDetails.Rows[0]["StateName"].ToString();
            }
            return result;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetCustomerAutoPopulate()
        {
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT CustomerID, CustomerName FROM anjacreation.tblCustomerMaster");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    CustomerID = r.Field<int>("CustomerID"),
                                    CustomerName = r.Field<string>("CustomerName"),
                                });

                Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                clsMessage message = new clsMessage();
                message.strMessage = "No records found";
                message.Result = true;

                Context.Response.Clear();
                this.Context.Response.ContentType = "application/json; charset=utf-8";
                this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindCustomer()
        {
            string strResponse = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT CustomerID,CustomerName FROM anjacreation.tblCustomerMaster");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    CustomerID = r.Field<int>("CustomerID"),
                                    CustomerName = r.Field<string>("CustomerName"),
                                });
                strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.Clear();
                Context.Response.ContentType = "application/json";
            }
            else
            {
                //clsMessage message = new clsMessage();
                //message.strMessage = "No records found";
                //message.Result = true;

                Context.Response.Clear();
                Context.Response.ContentType = "application/json; charset=utf-8";
                //Context.Response.Write(JsonConvert.SerializeObject(message));
            }
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public void GetSelectedCustomer(int CustomerID)
        //{
        //    string strResponse = "";
        //    string strQ = "SELECT GSTNo,Address,c1.StateID, s1.StateName FROM anjacreation.tblCustomerMaster c1 inner join " +
        //                " anjacreation.tblStateMaster s1 on c1.StateID = s1.StateID where CustomerID=" + CustomerID + ";";

        //    DataTable dataTable = ObjDAL.ExecuteSelectStatement(strQ);
        //    if (dataTable != null && dataTable.Rows.Count > 0)
        //    {
        //        var NameList = (from r in dataTable.AsEnumerable()
        //                        select new
        //                        {
        //                            GSTNo = r.Field<string>("GSTNo"),
        //                            Address = r.Field<string>("Address"),
        //                            StateID = r.Field<int>("StateID"),
        //                            StateName = r.Field<string>("StateName"),
        //                        });
        //        strResponse = JsonConvert.SerializeObject(NameList);
        //        Context.Response.Clear();
        //        Context.Response.ContentType = "application/json; charset=utf-8";
        //        Context.Response.AddHeader("content-length", strResponse.Length.ToString());
        //        Context.Response.Write(strResponse);
        //        Context.Response.Flush();
        //        //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
        //    }
        //    else
        //    {
        //        clsMessage message = new clsMessage();

        //        message.strMessage = "No records found";
        //        message.Result = true;

        //        strResponse = JsonConvert.SerializeObject(message);

        //        Context.Response.Clear();
        //        Context.Response.ContentType = "application/json; charset=utf-8";
        //        Context.Response.Write(strResponse);
        //        Context.Response.Flush();
        //    }
        //    //HttpContext.Current.ApplicationInstance.CompleteRequest();
        //}

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindProduct()
        {
            string strResponse = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT SKUID,SKUCode,SKUName,Description FROM  anjacreation.tblSKUMaster;");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    SKUID = r.Field<int>("SKUID"),
                                    SKUCode = r.Field<string>("SKUCode"),
                                    SKUName = r.Field<string>("SKUName"),
                                    SKUDescription = r.Field<string>("Description"),
                                });
                strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.Clear();
                Context.Response.ContentType = "application/json";
            }
            else
            {
                //clsMessage message = new clsMessage();
                //message.strMessage = "No records found";
                //message.Result = true;

                Context.Response.Clear();
                Context.Response.ContentType = "application/json; charset=utf-8";
                //Context.Response.Write(JsonConvert.SerializeObject(message));
            }
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetSelectedProduct(int ProductID, int PartyID)
        {
            string OldRate = "0", strResponse = "{}";

            ObjDAL.SetStoreProcedureData("parmProductID", MySqlConnector.MySqlDbType.Int32, ProductID);
            ObjDAL.SetStoreProcedureData("parmPartyID", MySqlConnector.MySqlDbType.Int32, PartyID);
            DataSet dsProductDetails = ObjDAL.ExecuteStoreProcedure_Get("anjacreation.SPR_GetUerProduct");
            if (dsProductDetails.Tables.Count > 0)
            {
                if (dsProductDetails.Tables[1].Rows.Count > 0)
                {
                    OldRate = dsProductDetails.Tables[1].Rows[0]["Rate"].ToString();
                }
            }

            if (dsProductDetails.Tables[0].Rows.Count > 0)
            {
                // if no last record found
                if (OldRate == "0")
                {
                    var NameList = (from r in dsProductDetails.Tables[0].AsEnumerable()
                                    select new
                                    {
                                        SKUID = r.Field<int>("SKUID"),
                                        SKUCode = r.Field<string>("SKUCode"),
                                        SKUName = r.Field<string>("SKUName"),
                                        Rate = r.Field<decimal>("Rate"),
                                        HSNID = r.Field<int>("HSNID"),
                                        HSNCode = r.Field<string>("HSNCode"),
                                        CGST = r.Field<decimal>("CGST"),
                                        SGST = r.Field<decimal>("SGST"),
                                        IGST = r.Field<decimal>("IGST"),
                                        IsOld = "0"
                                    });

                    strResponse = JsonConvert.SerializeObject(NameList);
                    Context.Response.Clear();
                    Context.Response.ContentType = "application/json";
                }
                else
                {
                    var NameList = (from r in dsProductDetails.Tables[0].AsEnumerable()
                                    select new
                                    {
                                        SKUID = r.Field<int>("SKUID"),
                                        SKUCode = r.Field<string>("SKUCode"),
                                        SKUName = r.Field<string>("SKUName"),
                                        Rate =OldRate,
                                        HSNID = r.Field<int>("HSNID"),
                                        HSNCode = r.Field<string>("HSNCode"),
                                        CGST = r.Field<decimal>("CGST"),
                                        SGST = r.Field<decimal>("SGST"),
                                        IGST = r.Field<decimal>("IGST"),
                                        IsOld = "1"
                                    });
                    strResponse = JsonConvert.SerializeObject(NameList);
                    Context.Response.Clear();
                    Context.Response.ContentType = "application/json";
                }
            }
            else
            {
                //clsMessage message = new clsMessage();
                //message.strMessage = "No records found";
                //message.Result = true;
                Context.Response.Clear();
                Context.Response.ContentType = "application/json; charset=utf-8";
                //Context.Response.Write(JsonConvert.SerializeObject(message));
            }
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }
        private int GetCurrentYear()
        {
            int currYear = 0;

            if (DateTime.Now.Month >= 4) // if its April, then consider current year for From Year(date)
            {
                currYear = DateTime.Now.Year;
            }
            else
            {
                // if its Not April the consider previous error
                currYear = DateTime.Now.Year - 1;
            }

            return currYear;
        }
        private string GetLastTaxInvoiceNumber()
        {
            int currYear = GetCurrentYear();

            // get the MAx invoice number for the current Year.. 01-April-Current Year to 31-March-Next Year
            string q = "SELECT MAX(TaxInvoiceNo) FROM anjacreation.tblSalesInvoceMaster  where " +
                       "InvoiceDate between date('" + currYear + "-04-01') and date('" + (currYear + 1) + "-03-31'); ";
            object result = ObjDAL.ExecuteScalarQuery(q);
            if (result == null || result == DBNull.Value)
            {
                return "0";
            }
            else
            {
                return result.ToString();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void InsertUpdateSaleInvoiceMaster(
            int parmSaleInvoiceID,
            string parmInvoiceNumber,
            DateTime parmInvoiceDate,
            string parmStateID,
             string parmPartyID,
            string parmTotalAmtBeforeTax,
            string parmDiscountAmount,
            string parmIGST,
            string parmCGST,
            string parmSGST,
            string parmGST,
            string parmCGST_Percent,
            string parmSGST_Percent,
            string parmIGST_Percent,
            string parmAmountAfterGST,
            string parmCreatedBy,
            string parmModifiedBy

            )
        {
            clsMessage message = new clsMessage();

            if (parmCGST_Percent == null)
            {
                parmCGST_Percent = "0";
            }

            if (parmSGST_Percent == null)
            {
                parmSGST_Percent = "0";
            }

            if (parmIGST_Percent == null)
            {
                parmIGST_Percent = "0";
            }
            string InvoiceNumber = "NA";

            ObjDAL.SetStoreProcedureData("parmSaleInvoiceID", MySqlConnector.MySqlDbType.Int32, parmSaleInvoiceID, clsMySQLCoreApp.ParamType.Input);
          
            // if its New Invoice then check for last Tax invoice number for formating AC01/20-21
            if (parmSaleInvoiceID==0)
            {
                // get the last taxinvoice no
               string LastInvoiceNo=GetLastTaxInvoiceNumber();

                // add one
               int CurInvoiceNo = Convert.ToInt32(LastInvoiceNo) + 1;

                // set this new, as next tax invoice number
                ObjDAL.SetStoreProcedureData("parmTaxInvoiceNo", MySqlConnector.MySqlDbType.Int32, CurInvoiceNo, clsMySQLCoreApp.ParamType.Input);

                // format the InvoiceNumber as per given format.
                string InvoiceID = "AC" + CurInvoiceNo.ToString().PadLeft(2, '0') + "/";
                string Year = GetCurrentYear().ToString().Substring(2, 2);
                string nextYear = Convert.ToString(Convert.ToInt32(Year) + 1);
                 InvoiceNumber = InvoiceID + Year + "-" + nextYear;

                // set the formated invoice number to Invoice number parameter.
                ObjDAL.SetStoreProcedureData("parmInvoiceNumber", MySqlConnector.MySqlDbType.VarChar, InvoiceNumber, clsMySQLCoreApp.ParamType.Input);


            }
            else
            {
                // does't mater we are not going to use it in update.
                ObjDAL.SetStoreProcedureData("parmTaxInvoiceNo", MySqlConnector.MySqlDbType.Int32, "", clsMySQLCoreApp.ParamType.Input);

                // incase of update, you will get the formated invoice number already.
                ObjDAL.SetStoreProcedureData("parmInvoiceNumber", MySqlConnector.MySqlDbType.VarChar, parmInvoiceNumber, clsMySQLCoreApp.ParamType.Input);
            }
            
          
            ObjDAL.SetStoreProcedureData("parmInvoiceDate", MySqlConnector.MySqlDbType.Date, parmInvoiceDate, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmStateID", MySqlConnector.MySqlDbType.Int32, parmStateID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmPartyID", MySqlConnector.MySqlDbType.Int32, parmPartyID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmTotalAmtBeforeTax", MySqlConnector.MySqlDbType.Decimal, parmTotalAmtBeforeTax, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmDiscountAmount", MySqlConnector.MySqlDbType.Decimal, parmDiscountAmount, clsMySQLCoreApp.ParamType.Input);

            ObjDAL.SetStoreProcedureData("parmIGST", MySqlConnector.MySqlDbType.Decimal, parmIGST, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmCGST", MySqlConnector.MySqlDbType.Decimal, parmCGST, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmSGST", MySqlConnector.MySqlDbType.Decimal, parmSGST, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmGST", MySqlConnector.MySqlDbType.Decimal, parmGST, clsMySQLCoreApp.ParamType.Input);


            ObjDAL.SetStoreProcedureData("parmCGST_Percent", MySqlConnector.MySqlDbType.Decimal, parmCGST_Percent, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmSGST_Percent", MySqlConnector.MySqlDbType.Decimal, parmSGST_Percent, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmIGST_Percent", MySqlConnector.MySqlDbType.Decimal, parmIGST_Percent, clsMySQLCoreApp.ParamType.Input);


            ObjDAL.SetStoreProcedureData("parmAmountAfterGST", MySqlConnector.MySqlDbType.Decimal, parmAmountAfterGST, clsMySQLCoreApp.ParamType.Input);

            ObjDAL.SetStoreProcedureData("parmCreatedBy", MySqlConnector.MySqlDbType.Int32, parmCreatedBy, clsMySQLCoreApp.ParamType.Input);

            ObjDAL.SetStoreProcedureData("parmModifiedBy", MySqlConnector.MySqlDbType.Int32, parmModifiedBy, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmAutoInvoiceID", MySqlConnector.MySqlDbType.Int32, 0, clsMySQLCoreApp.ParamType.Output);


            bool result = ObjDAL.ExecuteStoreProcedure_DML("anjacreation.SPR_Insert_SalesInvoiceMaster");

            if (result)
            {
                // get the output value.
                DataTable dtOutput = ObjDAL.GetOutputParmData();
                DataRow[] dRow = dtOutput.Select("ParmName='parmAutoInvoiceID'");
                if (dRow.Length > 0)
                {
                    int AutoInVoiceID = Convert.ToInt32(dRow[0]["Value"]);


                    message.Result = true;
                    message.Value = AutoInVoiceID;
                  
                }
                else
                {
                    message.Result = false;
                    message.strMessage = "Data might be inserted but couldnt get the output value for aut ID.";
                }

            }
            else
            {
                message.Result = false;
                // message.strMessage = "Failed to Insert Customer Name " + CustomerName + ". Error : " + ObjDAL.strErrorText;
            }
            string strResponse = JsonConvert.SerializeObject(message);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());

            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void InsertUpdateSalesDetails(string PostedData)
        {
            clsMessage message = new clsMessage();

            var SalesDetailsObj = Newtonsoft.Json.JsonConvert.DeserializeObject<List<clsSalesDetails>>(PostedData);

            bool result = false;

            ObjDAL.ExecuteNonQuery("DELETE FROM tblSalesDetails WHERE InvoiceID=" + SalesDetailsObj[0].InvID);

            foreach (var item in SalesDetailsObj)
            {
                string parmInvoiceID = item.InvID;
                string parmProductID = item.ProductID;
                string parmSKU_Code = item.SKU_Code;
                string parmHSN = item.HSNID;
                string parmRate = item.Rate;
                string parmQTY = item.QTY;
                string parmCGST = Convert.ToString(Convert.ToDouble(item.CGST) / 100);
                string parmSGST = Convert.ToString(Convert.ToDouble(item.SGST) / 100);
                string parmIGST = Convert.ToString(Convert.ToDouble(item.IGST) / 100);

                ObjDAL.SetStoreProcedureData("parmInvoiceID", MySqlConnector.MySqlDbType.Int32, parmInvoiceID);
                ObjDAL.SetStoreProcedureData("parmProductID", MySqlConnector.MySqlDbType.Int32, parmProductID);
                ObjDAL.SetStoreProcedureData("parmSKU_Code", MySqlConnector.MySqlDbType.VarChar, parmSKU_Code);
                ObjDAL.SetStoreProcedureData("parmHSN", MySqlConnector.MySqlDbType.VarChar, parmHSN);
                ObjDAL.SetStoreProcedureData("parmRate", MySqlConnector.MySqlDbType.Decimal, parmRate);
                ObjDAL.SetStoreProcedureData("parmQTY", MySqlConnector.MySqlDbType.Int32, parmQTY);

                ObjDAL.SetStoreProcedureData("parmCGST", MySqlConnector.MySqlDbType.Decimal, parmCGST);
                ObjDAL.SetStoreProcedureData("parmSGST", MySqlConnector.MySqlDbType.Decimal, parmSGST);
                ObjDAL.SetStoreProcedureData("parmIGST", MySqlConnector.MySqlDbType.Decimal, parmIGST);

                ObjDAL.SetStoreProcedureData("parmCreatedBy", MySqlConnector.MySqlDbType.Int32, item.CreatedBy);
                ObjDAL.SetStoreProcedureData("parmUpdateBy", MySqlConnector.MySqlDbType.Int32, item.CreatedBy);

                result = ObjDAL.ExecuteStoreProcedure_DML("anjacreation.SPR_Insert_SalesDetails");
                if (result == false)
                {
                    break;
                }
                else
                {
                    result = true;
                }
            }

            if (result)
            {
                message.Result = true;
                message.strMessage = "SalesDetails has been created";
            }
            else
            {
                message.Result = false;
            }

            string strResponse = JsonConvert.SerializeObject(message);
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.Write(strResponse);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ManageMyProfile(int UserID, string OwnerName, string CompanyName, string GSTNo, string EmailID
          , string Address, int StateID, string Password, string MobileNo, string TNC, string BankName, string AccountNo, string IFSCCode, string BranchName)
        {
            clsMessage message = new clsMessage();

            Password = Password.Length == 0 ? "0" : Password.Trim();

            ObjDAL.SetStoreProcedureData("ParmOwnerName", MySqlConnector.MySqlDbType.VarChar, OwnerName.Trim(), clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCompanyName", MySqlConnector.MySqlDbType.VarChar, CompanyName.Trim(), clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmGSTNo", MySqlConnector.MySqlDbType.VarChar, GSTNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmEmailID", MySqlConnector.MySqlDbType.VarChar, EmailID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmAddress", MySqlConnector.MySqlDbType.VarChar, Address, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmStateID", MySqlConnector.MySqlDbType.Int32, StateID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmPassword", MySqlConnector.MySqlDbType.VarChar, Password, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmMobileNo", MySqlConnector.MySqlDbType.VarChar, MobileNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmTNC", MySqlConnector.MySqlDbType.VarChar, TNC, clsMySQLCoreApp.ParamType.Input);

            ObjDAL.SetStoreProcedureData("ParmBankName", MySqlConnector.MySqlDbType.VarChar, BankName.Trim(), clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmAccountNo", MySqlConnector.MySqlDbType.VarChar, AccountNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmIFSCCode", MySqlConnector.MySqlDbType.VarChar, IFSCCode, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmBranchName", MySqlConnector.MySqlDbType.VarChar, BranchName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);

            bool result = ObjDAL.ExecuteStoreProcedure_DML("anjacreation.SPR_Update_MyProfile");
            if (result)
            {
                message.Result = true;
                message.strMessage = "Customer Name [" + OwnerName + "] has been Updated successfully";
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to Insert Customer Name " + OwnerName + ". Error : " + ObjDAL.strErrorText;
            }
            string strResponse = JsonConvert.SerializeObject(message);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetMyProfile(int UserID)
        {
            // System.Threading.Thread.Sleep(2000);
            string strResponse = "{}";
            ObjDAL.SetStoreProcedureData("ParmUserID", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);
            DataSet ds = ObjDAL.ExecuteStoreProcedure_Get("anjacreation.SPR_GetMyProfile");
            if (ds != null && ds.Tables.Count > 0)
            {
                strResponse = JsonConvert.SerializeObject(ds);
            }
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetPartPaymentList(string InvoiceNo, int CustomerID, int PaymentStatus)
        {
            // System.Threading.Thread.Sleep(2000);
            string jsonData = "{}";
            ObjDAL.SetStoreProcedureData("ParmInvoiceNo", MySqlConnector.MySqlDbType.VarChar, InvoiceNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCustomerID", MySqlConnector.MySqlDbType.Int32, CustomerID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmPaymentStatus", MySqlConnector.MySqlDbType.Int32, PaymentStatus, clsMySQLCoreApp.ParamType.Input);

            DataSet ds = ObjDAL.ExecuteStoreProcedure_Get("anjacreation.SPR_GetPartPaymentList");
            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dataTable = ds.Tables[0];
                jsonData = JsonConvert.SerializeObject(dataTable);
            }
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.Write(jsonData);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void InsertPartPayment(string InvoiceNo, int InvoiceID, int CustomerID, string PaymentMode, string ChequeNo,
            DateTime TransactionDate, decimal PayAmount, int UserID)
        {
            clsMessage message = new clsMessage();

            ObjDAL.SetStoreProcedureData("ParmInvoiceID", MySqlConnector.MySqlDbType.Int32, InvoiceID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCustomerID", MySqlConnector.MySqlDbType.Int32, CustomerID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmPaymentMode", MySqlConnector.MySqlDbType.VarChar, PaymentMode, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmChequeNo", MySqlConnector.MySqlDbType.VarChar, ChequeNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmTransactionDate", MySqlConnector.MySqlDbType.Date, TransactionDate, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmPayAmount", MySqlConnector.MySqlDbType.Decimal, PayAmount, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);

            bool result = ObjDAL.ExecuteStoreProcedure_DML("anjacreation.SPR_Insert_PartPayment");
            if (result)
            {
                message.Result = true;
                message.strMessage = "Partial Payment for [" + InvoiceNo + "] has been Save successfully";
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to Save Partial Payment for " + InvoiceNo + ". Error : " + ObjDAL.strErrorText;
            }
            string strResponse = JsonConvert.SerializeObject(message);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetPartPaymentDetails(int InvoiceID, int CustomerID)
        {
            // System.Threading.Thread.Sleep(2000);
            string jsonData = "{}";
            ObjDAL.SetStoreProcedureData("ParmInvoiceID", MySqlConnector.MySqlDbType.Int32, InvoiceID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCustomerID", MySqlConnector.MySqlDbType.Int32, CustomerID, clsMySQLCoreApp.ParamType.Input);
            DataSet ds = ObjDAL.ExecuteStoreProcedure_Get("anjacreation.SPR_GetPartPaymentDetails");
            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dataTable = ds.Tables[0];
                jsonData = JsonConvert.SerializeObject(dataTable);
            }
            //Context.Response.ContentType = "application/json";
            //Context.Response.Write(jsonData);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", jsonData.Length.ToString());
            Context.Response.Write(jsonData);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ManageHSNCode(string HSNCode, string HSNDescription, decimal CGST, decimal SGST
            , decimal IGST, int HSNID, int UserID)
        {
            clsMessage message = new clsMessage();

            ObjDAL.SetStoreProcedureData("ParmHSNCode", MySqlConnector.MySqlDbType.VarChar, HSNCode.Trim(), clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmHSNDescription", MySqlConnector.MySqlDbType.VarChar, HSNDescription, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCGST", MySqlConnector.MySqlDbType.Decimal, CGST, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmSGST", MySqlConnector.MySqlDbType.Decimal, SGST, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmIGST", MySqlConnector.MySqlDbType.Decimal, IGST, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmHSNID", MySqlConnector.MySqlDbType.Int32, HSNID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmFlag", MySqlConnector.MySqlDbType.Int32, 0, clsMySQLCoreApp.ParamType.Output);
            ObjDAL.SetStoreProcedureData("ParmMsg", MySqlConnector.MySqlDbType.VarChar, 0, clsMySQLCoreApp.ParamType.Output);

            bool result = ObjDAL.ExecuteStoreProcedure_DML("anjacreation.SPR_Insert_HSNCodeDetails");
            if (result)
            {
                message.Result = false;
                DataTable dtOutput = ObjDAL.GetOutputParmData();
                DataRow[] dflag = dtOutput.Select("ParmName='ParmFlag'");
                DataRow[] dRow = dtOutput.Select("ParmName='ParmMsg'");
                if (dRow.Length > 0)
                {
                    message.strMessage = dRow[0]["Value"].ToString();
                }
                if (dflag.Length > 0)
                {
                    message.Result = Convert.ToBoolean(dflag[0]["Value"]);
                }
                //if (HSNID == 0)
                //{
                //    message.strMessage = "HSN Code [" + HSNCode + "] has been Created successfully";
                //}
                //else
                //{
                //    message.strMessage = "HSN Code [" + HSNCode + "] has been Updated successfully";
                //}
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to Save HSN Code " + HSNID + ". Error : " + ObjDAL.strErrorText;
            }
            string strResponse = JsonConvert.SerializeObject(message);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetHSNDetails()
        {
            // System.Threading.Thread.Sleep(2000);
            string jsonData = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("CALL anjacreation.SPR_GetHSNDetails()");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                jsonData = DataTableToJSONWithJSONNet(dataTable);
            }
            //Context.Response.ContentType = "application/json";
            //Context.Response.Write(jsonData);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", jsonData.Length.ToString());
            Context.Response.Write(jsonData);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void DeletedHSNCode(int HSNID)
        {
            clsMessage message = new clsMessage();

            int result = ObjDAL.ExecuteNonQuery("DELETE FROM anjacreation.tblHSNMaster WHERE HSNID=" + HSNID);
            if (result > 0)
            {
                message.Result = true;
                message.strMessage = "HSN have been deleted.";
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to Delete HSN.";
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.Write(js.Serialize(message));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetInvoiceDetails(DateTime FromDate, DateTime ToDate)
        {
            // System.Threading.Thread.Sleep(2000);
            string jsonData = "{}";

            ObjDAL.SetStoreProcedureData("ParamfrmDate", MySqlConnector.MySqlDbType.Date, FromDate, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParamToDate", MySqlConnector.MySqlDbType.Date, ToDate, clsMySQLCoreApp.ParamType.Input);

            DataSet ds = ObjDAL.ExecuteStoreProcedure_Get("anjacreation.SPR_GetInvoiceDetails");
            //DataTable dataTable = ObjDAL.ExecuteSelectStatement("CALL anjacreation.SPR_GetInvoiceDetails()");
            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dataTable = ds.Tables[0];
                jsonData = DataTableToJSONWithJSONNet(dataTable);
            }
            //Context.Response.ContentType = "application/json";
            //Context.Response.Write(jsonData);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", jsonData.Length.ToString());
            Context.Response.Write(jsonData);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetInvoiceDetailsByID(int InvoiceID)
        {
            // System.Threading.Thread.Sleep(2000);
            string jsonData = "{}";

            ObjDAL.SetStoreProcedureData("ParamInvoiceID", MySqlConnector.MySqlDbType.Int32, InvoiceID, clsMySQLCoreApp.ParamType.Input);

            DataSet ds = ObjDAL.ExecuteStoreProcedure_Get("anjacreation.SPR_GetInvoiceDetailsByID");
            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dataTable = ds.Tables[0];
                jsonData = DataTableToJSONWithJSONNet(dataTable);
            }

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", jsonData.Length.ToString());
            Context.Response.Write(jsonData);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ForgotEmailIDData(string ForgotEmailID)
        {
            // System.Threading.Thread.Sleep(2000);
            string strResponse = "{}";
            ObjDAL.SetStoreProcedureData("ParmForgotEmailID", MySqlConnector.MySqlDbType.VarChar, ForgotEmailID, clsMySQLCoreApp.ParamType.Input);
            DataSet ds = ObjDAL.ExecuteStoreProcedure_Get("anjacreation.SPR_GetForgotPassword");
            if (ds != null && ds.Tables.Count > 0)
            {
                clsMessage message = new clsMessage();
                DataTable dt = ds.Tables[0];
                if (dt != null && dt.Rows.Count > 0)
                {
                    //message.strMessage ="Valid Email ID";
                    message.strMessage = dt.Rows[0]["pass"].ToString();
                    message.Result = true;
                }
                else
                {
                    message.strMessage = "Invalid Email ID";
                    message.Result = false;
                }
                strResponse = JsonConvert.SerializeObject(message);
            }
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SendForgotPass(string ForgotEmailID, string Password)
        {
            // System.Threading.Thread.Sleep(2000);
            string strResponse = "";
            clsMessage message = new clsMessage();

            string bodyHTML = string.Empty;
            //bodyHTML = "Hi, This is Test Message.";
            bodyHTML = "<p>Dear Anja Creation,</p>";
            bodyHTML += "<p>We've received a request to reset your password.</p>";
            bodyHTML += "<p>PFB Reset Password for " + ForgotEmailID + ".</p>";
            bodyHTML += @" <html><table width = '300' cellpadding = '0' cellspacing = '0' align = 'left' border = '1' >"
             + "<tr>"
             + "<td align ='center'>"
             + "<tr>"
             + " <td> Email ID </td>"
             + "<td> Password </td>"
             + " </tr>"
             + "<tr>"
             + "<td> " + ForgotEmailID + " </td>"
             + "<td> " + Password + " </td>"
             + " </tr>"
             + " </td>"
             + " </tr>"
             + " </table>"
             + " </html>";
            CoreApp.SendMail snd = new CoreApp.SendMail();
            //snd.From = stremail;
            snd.Sub = "Forgot Password";
            snd.Body = bodyHTML;
            snd.To = ForgotEmailID;
            snd.SendEMail();

            message.Result = snd.IsMail;
            if (message.Result)
                message.strMessage = "Email Send Successfully";

            else
                message.strMessage = "Unable to Send an Email\n" + snd.Message;

            strResponse = JsonConvert.SerializeObject(message);
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        //[WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindSKU_Code()
        {
            //string strResponse = "{}";
            //DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT SKUID,SKUCode FROM anjacreation.tblSKUMaster WHERE IF(SKUCode IS NULL || SKUCode='',0,1)=1;");
            //if (dataTable != null && dataTable.Rows.Count > 0)
            //{
            //    var NameList = (from r in dataTable.AsEnumerable()
            //                    select new
            //                    {
            //                        SKUID = r.Field<int>("SKUID"),
            //                        SKUCode = r.Field<string>("SKUCode"),
            //                    });
            //    strResponse = JsonConvert.SerializeObject(NameList);
            //    Context.Response.Clear();
            //    Context.Response.ContentType = "application/json";
            //}
            //else
            //{
            //    Context.Response.Clear();
            //    Context.Response.ContentType = "application/json; charset=utf-8";
            //}
            //Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            //Context.Response.Write(strResponse);
            //Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SaveOtherInfoiceDetails(
            string parmInvoiceID,
            string parmReverseCharge,
            string parmTransportation_Mode,
            string parmVehicle_Number,
            string parmConsignee_Name,
            string parmConsignee_GST,
            string parmConsignee_StateID,
            string parmConsignee_Address,
                DateTime parmSupplyDate,
             string parmConsignee_PAN,
             string parmPlaceofSupply


            )
        {
            clsMessage message = new clsMessage();

            ObjDAL.SetStoreProcedureData("parmInvoiceID", MySqlConnector.MySqlDbType.VarChar, parmInvoiceID);
            ObjDAL.SetStoreProcedureData("parmReverseCharge", MySqlConnector.MySqlDbType.VarChar, parmReverseCharge);
            ObjDAL.SetStoreProcedureData("parmTransportation_Mode", MySqlConnector.MySqlDbType.VarChar, parmTransportation_Mode);
            ObjDAL.SetStoreProcedureData("parmVehicle_Number", MySqlConnector.MySqlDbType.VarChar, parmVehicle_Number);
            ObjDAL.SetStoreProcedureData("parmConsignee_GST", MySqlConnector.MySqlDbType.VarChar, parmConsignee_GST);
            ObjDAL.SetStoreProcedureData("parmConsignee_StateID", MySqlConnector.MySqlDbType.VarChar, parmConsignee_StateID);
            ObjDAL.SetStoreProcedureData("parmConsignee_Address", MySqlConnector.MySqlDbType.VarChar, parmConsignee_Address);

            ObjDAL.SetStoreProcedureData("parmConsignee_PAN", MySqlConnector.MySqlDbType.VarChar, parmConsignee_PAN);
            ObjDAL.SetStoreProcedureData("parmConsignee_Name", MySqlConnector.MySqlDbType.VarChar, parmConsignee_Name);
            ObjDAL.SetStoreProcedureData("parmSupplyDate", MySqlConnector.MySqlDbType.Date, parmSupplyDate);
            ObjDAL.SetStoreProcedureData("parmPlaceofSupply", MySqlConnector.MySqlDbType.Date, parmPlaceofSupply);

            bool result = ObjDAL.ExecuteStoreProcedure_DML("anjacreation.SPR_Insert_OtherInvoiceDetails");
            if (result)
            {
                message.Result = true;

                message.strMessage = "Data saved";
            }
            else
            {
                message.Result = false;
                message.strMessage = "Failed to save the data";
            }
            string strResponse = JsonConvert.SerializeObject(message);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());

            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        public DataSet GetReportData(string InvoiceID, string PartyID)
        {
            ObjDAL.SetStoreProcedureData("parmSaleInvoiceID", MySqlConnector.MySqlDbType.Int32, InvoiceID);
            ObjDAL.SetStoreProcedureData("parmPartyID", MySqlConnector.MySqlDbType.Int32, PartyID);
            return ObjDAL.ExecuteStoreProcedure_Get("SPR_GetReportData");
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindCGST()
        {
            string strResponse = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT CGST as CGSTValue,CGST FROM anjacreation.tblHSNMaster;");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    CGSTValue = r.Field<decimal>("CGSTValue"),
                                    CGST = r.Field<decimal>("CGST").ToString("0.0") + "%"
                                });
                strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.Clear();
                Context.Response.ContentType = "application/json";

                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                //clsMessage message = new clsMessage();
                //message.strMessage = "No records found";
                //message.Result = true;

                Context.Response.Clear();
                Context.Response.ContentType = "application/json; charset=utf-8";
                //this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindSGST()
        {
            string strResponse = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT SGST, SGST as SGSTValue FROM anjacreation.tblHSNMaster;");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    SGSTValue = r.Field<decimal>("SGSTValue"),
                                    SGST = r.Field<decimal>("SGST").ToString("0.0") + "%"

                                });
                strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.Clear();
                Context.Response.ContentType = "application/json";
                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                //clsMessage message = new clsMessage();
                //message.strMessage = "No records found";
                //message.Result = true;

                Context.Response.Clear();
                Context.Response.ContentType = "application/json; charset=utf-8";
                //Context.Response.Write(JsonConvert.SerializeObject(message));
            }
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindIGST()
        {
            string strResponse = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT IGST, IGST as IGSTValue FROM anjacreation.tblHSNMaster;");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    IGSTValue = r.Field<decimal>("IGSTValue"),
                                    IGST = r.Field<decimal>("IGST").ToString("0.0") + "%"
                                });
                strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.Clear();
                Context.Response.ContentType = "application/json";
                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                //clsMessage message = new clsMessage();
                //message.strMessage = "No records found";
                //message.Result = true;

                Context.Response.Clear();
                Context.Response.ContentType = "application/json; charset=utf-8";
                //Context.Response.Write(JsonConvert.SerializeObject(message));
            }
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetSalesDetails(string InvoiceID)
        {
            // System.Threading.Thread.Sleep(2000);
            string jsonData = "{}";

            ObjDAL.SetStoreProcedureData("parmInvoiceID", MySqlConnector.MySqlDbType.Int32, InvoiceID);
            DataSet dsSalesDetails = ObjDAL.ExecuteStoreProcedure_Get("anjacreation.SPR_GetSalesDetails");
            if (dsSalesDetails.Tables.Count > 0)
            {
                DataTable dataTable = dsSalesDetails.Tables[0];

                if (dataTable != null && dataTable.Rows.Count > 0)
                {
                    jsonData = DataTableToJSONWithJSONNet(dataTable);
                }
            }
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", jsonData.Length.ToString());
            Context.Response.Write(jsonData);
            Context.Response.Flush();
        }

        [WebMethod]
       
        public string GetInvoiceNumber(string invoiceID)
        {
          return  ObjDAL.ExecuteScalarQuery("SELECT InvoiceNumber FROM anjacreation.tblSalesInvoceMaster where SaleInvoiceID="+ invoiceID).ToString();
        }


            [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetBindInvoiceDetails(string invoiceID)
        {
            // get invoice master and invoice other details
            string strQ = "select *,sm.StateName,sm.GSTStateCode  from anjacreation.tblSalesInvoceMaster im left join  " +
                            " anjacreation.tblInvoiceOtherDetails ot on im.SaleInvoiceID = ot.InvoiceID " +
                            " left join anjacreation.tblStateMaster sm  on ot.Consignee_StateID = sm.StateID " +
                             " where im.InvoiceNumber ='" + invoiceID+"'";

            DataTable dtInvoiceMaster = ObjDAL.ExecuteSelectStatement(strQ);

            string jsonData = "{}";

            if (dtInvoiceMaster != null && dtInvoiceMaster.Rows.Count > 0)
            {
                jsonData = DataTableToJSONWithJSONNet(dtInvoiceMaster);
            }
            else
            {
                clsMessage clsMessageo = new clsMessage();
                clsMessageo.Result = false;
                jsonData= JsonConvert.SerializeObject(clsMessageo);


            }

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", jsonData.Length.ToString());
            Context.Response.Write(jsonData);
            Context.Response.Flush();
        }
    }

    public class Customer
    {
        public string GSTNo { get; set; }
        public string Address { get; set; }
        public int StateID { get; set; }
        public string StateName { get; set; }
    }
}