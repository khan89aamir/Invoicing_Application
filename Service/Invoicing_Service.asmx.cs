using Newtonsoft.Json;
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
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Invoicing_Service : System.Web.Services.WebService
    {
        clsMySQLCoreApp ObjDAL = new clsMySQLCoreApp();

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindState()
        {
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT StateID,StateName FROM ztech.tblStateMaster");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    StateID = r.Field<int>("StateID"),
                                    StateName = r.Field<string>("StateName"),
                                });
                string strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.ContentType = "application/json";
                Context.Response.AddHeader("content-length", strResponse.Length.ToString());
                Context.Response.Write(strResponse);
                Context.Response.Flush();
                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                clsMessage message = new clsMessage();

                message.strMessage = "No records found";
                message.Result = true;

                this.Context.Response.ContentType = "application/json; charset=utf-8";
                this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ManageProducts(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int UserID)
        {
            clsMessage message = new clsMessage();

            Description = Description.Length == 0 ? "0" : Description;

            ObjDAL.SetStoreProcedureData("ParmSKUCode", MySqlConnector.MySqlDbType.VarChar, SKUCode, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmSKUName", MySqlConnector.MySqlDbType.VarChar, SKUName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmRate", MySqlConnector.MySqlDbType.Decimal, Rate, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmDescription", MySqlConnector.MySqlDbType.VarChar, Description, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmProductID", MySqlConnector.MySqlDbType.Int32, ProudctID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);

            bool result = ObjDAL.ExecuteStoreProcedure_DML("ztech.SPR_Insert_SKUDetails");
            if (result)
            {
                message.Result = true;
                if (ProudctID == 0)
                {
                    message.strMessage = "SKU [" + SKUName + "] has been Created successfully";
                }
                else
                {
                    message.strMessage = "SKU [" + SKUName + "] has been Updated successfully";
                }
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
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("CALL ztech.SPR_GetSKUDetails()");
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

            int result = ObjDAL.ExecuteNonQuery("DELETE from ztech.tblSKUMaster WHERE SKUID=" + SKUID);
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
            Context.Response.ContentType = "application/json";
            Context.Response.Write(js.Serialize(message));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ManageCustomers(string CustomerName, string CompanyName, string GSTNo, string EmailID
            , string Address, int StateID, int CustomerID, int UserID)
        {
            clsMessage message = new clsMessage();

            ObjDAL.SetStoreProcedureData("ParmCustomerName", MySqlConnector.MySqlDbType.VarChar, CustomerName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCompanyName", MySqlConnector.MySqlDbType.VarChar, CompanyName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmGSTNo", MySqlConnector.MySqlDbType.VarChar, GSTNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmEmailID", MySqlConnector.MySqlDbType.VarChar, EmailID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmAddress", MySqlConnector.MySqlDbType.VarChar, Address, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCustomerID", MySqlConnector.MySqlDbType.Int32, CustomerID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmStateID", MySqlConnector.MySqlDbType.Int32, StateID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);

            bool result = ObjDAL.ExecuteStoreProcedure_DML("ztech.SPR_Insert_CustomerDetails");
            if (result)
            {
                message.Result = true;
                if (CustomerID == 0)
                {
                    message.strMessage = "Customer Name [" + CustomerName + "] has been Created successfully";
                }
                else
                {
                    message.strMessage = "Customer Name [" + CustomerName + "] has been Updated successfully";
                }
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
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("CALL ztech.SPR_GetCustomerDetails()");
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

            int result = ObjDAL.ExecuteNonQuery("DELETE FROM ztech.tblCustomerMaster WHERE CustomerID=" + CustomerID);
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
            Context.Response.ContentType = "application/json";
            Context.Response.Write(js.Serialize(message));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Login(string UserName, string Password)
        {
            clsMessage message = new clsMessage();

            object result = ObjDAL.ExecuteScalarQuery("SELECT ProfileID FROM ztech.tblMyProfile WHERE UserName='" + UserName + "' AND CAST(AES_DECRYPT(Password, 'UserNameEmailID') AS CHAR(255))='" + Password + "'");
            if (result != null)
            {
                if (Convert.ToInt32(result) > 0)
                {
                    message.Result = true;
                    message.strMessage = "User Found.";
                    message.UserID = Convert.ToInt32(result);
                    message.Value = GetDefaultState(message.UserID);
                }
                else
                {
                    message.Result = false;
                    message.strMessage = "Incorrect Username or Password.";
                }
            }
            else
            {
                message.Result = false;
                message.strMessage = "Incorrect Username or Password.";
            }

            string strResponse = JsonConvert.SerializeObject(message);
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", strResponse.Length.ToString());

            Context.Response.Write(strResponse);
            Context.Response.Flush();
        }

        public int GetDefaultState(int UserID)
        {
            int state = ObjDAL.ExecuteScalarInt("SELECT StateID from ztech.tblMyProfile WHERE ProfileID="+ UserID);
            return state;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetCustomerAutoPopulate()
        {
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT CustomerID, CustomerName FROM ztech.tblCustomerMaster");
            if (dataTable!=null && dataTable.Rows.Count > 0)
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

                this.Context.Response.ContentType = "application/json; charset=utf-8";
                this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindCustomer()
        {
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT CustomerID,CustomerName FROM ztech.tblCustomerMaster");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    CustomerID = r.Field<int>("CustomerID"),
                                    CustomerName = r.Field<string>("CustomerName"),
                                });
                string strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.ContentType = "application/json";
                Context.Response.AddHeader("content-length", strResponse.Length.ToString());
                Context.Response.Write(strResponse);
                Context.Response.Flush();
                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                clsMessage message = new clsMessage();

                message.strMessage = "No records found";
                message.Result = true;

                this.Context.Response.ContentType = "application/json; charset=utf-8";
                this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetSelectedCustomer(int CustomerID)
        {

            string strQ = "SELECT GSTNo,Address,c1.StateID, s1.StateName FROM ztech.tblCustomerMaster c1 inner join " +
                        " ztech.tblStateMaster s1 on c1.StateID = s1.StateID where CustomerID="+CustomerID;

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
                Context.Response.ContentType = "application/json";
                Context.Response.AddHeader("content-length", strResponse.Length.ToString());
                Context.Response.Write(strResponse);
                Context.Response.Flush();
                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                clsMessage message = new clsMessage();

                message.strMessage = "No records found";
                message.Result = true;

                this.Context.Response.ContentType = "application/json; charset=utf-8";
                this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BindProduct()
        {
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT SKUID,SKUName FROM ztech.tblSKUMaster;");
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    SKUID = r.Field<int>("SKUID"),
                                    SKUName = r.Field<string>("SKUName"),
                                });
                string strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.ContentType = "application/json";
                Context.Response.AddHeader("content-length", strResponse.Length.ToString());
                Context.Response.Write(strResponse);
                Context.Response.Flush();
                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                clsMessage message = new clsMessage();

                message.strMessage = "No records found";
                message.Result = true;

                this.Context.Response.ContentType = "application/json; charset=utf-8";
                this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetSelectedProduct(int ProductID)
        {

            string strQ = "SELECT SKUID,SKUName,Rate FROM ztech.tblSKUMaster where SKUID=" + ProductID;

            DataTable dataTable = ObjDAL.ExecuteSelectStatement(strQ);
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                var NameList = (from r in dataTable.AsEnumerable()
                                select new
                                {
                                    SKUID = r.Field<int>("SKUID"),
                                    SKUName = r.Field<string>("SKUName"),
                                    Rate = r.Field<decimal>("Rate")
                                   
                                });
                string strResponse = JsonConvert.SerializeObject(NameList);
                Context.Response.ContentType = "application/json";
                Context.Response.AddHeader("content-length", strResponse.Length.ToString());
                Context.Response.Write(strResponse);
                Context.Response.Flush();
                //  Context.Response.Write(JsonConvert.SerializeObject(NameList));
            }
            else
            {
                clsMessage message = new clsMessage();

                message.strMessage = "No records found";
                message.Result = true;

                this.Context.Response.ContentType = "application/json; charset=utf-8";
                this.Context.Response.Write(JsonConvert.SerializeObject(message));
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void InsertUpdateSaleInvoiceMaster(
            int parmSaleInvoiceID,
            string parmInvoiceNumber,
            string parmInvoiceDate,
            string parmStateID,
             string parmPartyID,
            string parmTotalAmtBeforeTax,
            string parmDiscountAmount,
            string parmIGST,
            string parmCGST,
            string parmSGST,
            string parmGST,
            string parmAmountAfterGST,
            string parmCreatedBy,
            string parmModifiedBy

            )
        {
            clsMessage message = new clsMessage();

            ObjDAL.SetStoreProcedureData("parmSaleInvoiceID", MySqlConnector.MySqlDbType.Int32, parmSaleInvoiceID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmInvoiceNumber", MySqlConnector.MySqlDbType.VarChar, parmInvoiceNumber, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmInvoiceDate", MySqlConnector.MySqlDbType.Date, parmInvoiceDate, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmStateID", MySqlConnector.MySqlDbType.Int32, parmStateID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmPartyID", MySqlConnector.MySqlDbType.Int32, parmPartyID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmTotalAmtBeforeTax", MySqlConnector.MySqlDbType.Decimal, parmTotalAmtBeforeTax, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmDiscountAmount", MySqlConnector.MySqlDbType.Decimal, parmDiscountAmount, clsMySQLCoreApp.ParamType.Input);
           
            ObjDAL.SetStoreProcedureData("parmIGST", MySqlConnector.MySqlDbType.Decimal, parmIGST, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmCGST", MySqlConnector.MySqlDbType.Decimal, parmCGST, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmSGST", MySqlConnector.MySqlDbType.Decimal, parmSGST, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmGST", MySqlConnector.MySqlDbType.Decimal, parmGST, clsMySQLCoreApp.ParamType.Input);

            ObjDAL.SetStoreProcedureData("parmAmountAfterGST", MySqlConnector.MySqlDbType.Decimal, parmAmountAfterGST, clsMySQLCoreApp.ParamType.Input);

            ObjDAL.SetStoreProcedureData("parmCreatedBy", MySqlConnector.MySqlDbType.Int32, parmCreatedBy, clsMySQLCoreApp.ParamType.Input);

            ObjDAL.SetStoreProcedureData("parmModifiedBy", MySqlConnector.MySqlDbType.Int32, parmModifiedBy, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("parmAutoInvoiceID", MySqlConnector.MySqlDbType.Int32, 0, clsMySQLCoreApp.ParamType.Output);


            bool result = ObjDAL.ExecuteStoreProcedure_DML("ztech.SPR_Insert_SalesInvoiceMaster");
           
            if (result)
            {
                // get the output value.
                DataTable dtOutput = ObjDAL.GetOutputParmData();
                DataRow [] dRow= dtOutput.Select("ParmName='parmAutoInvoiceID'");
                if (dRow.Length>0)
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
            //ObjDAL.SetStoreProcedureData("parmInvoiceID", MySqlConnector.MySqlDbType.Int32, parmInvoiceID);
            //ObjDAL.SetStoreProcedureData("parmProductID", MySqlConnector.MySqlDbType.Int32, parmProductID);
            //ObjDAL.SetStoreProcedureData("parmRate", MySqlConnector.MySqlDbType.Decimal, parmRate);
            //ObjDAL.SetStoreProcedureData("parmQTY", MySqlConnector.MySqlDbType.Int32, parmQTY);
            //ObjDAL.SetStoreProcedureData("parmCreatedBy", MySqlConnector.MySqlDbType.Int32, parmCreatedBy);
            //ObjDAL.SetStoreProcedureData("parmUpdateBy", MySqlConnector.MySqlDbType.Int32, parmUpdateBy);

            //bool result = ObjDAL.ExecuteStoreProcedure_DML("ztech.SPR_Insert_SalesDetails");

            //if (result)
            //{
            //    message.Result = true;
            //    if (parmInvoiceID == 0)
            //    {
            //        message.strMessage = "SalesDetails has been created";
            //    }
            //    else
            //    {
            //        message.strMessage = "SalesDetails has been update";
            //    }
            //}
            //else
            //{
            //    message.Result = false;

            //}
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ManageMyProfile(int UserID, string OwnerName, string CompanyName, string GSTNo, string EmailID
          , string Address, int StateID, string Password, string MobileNo, string TNC, string BankName, string AccountNo, string IFSCCode, string BranchName)
        {
            clsMessage message = new clsMessage();

            Password = Password.Length == 0 ? "0" : Password;

            ObjDAL.SetStoreProcedureData("ParmOwnerName", MySqlConnector.MySqlDbType.VarChar, OwnerName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCompanyName", MySqlConnector.MySqlDbType.VarChar, CompanyName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmGSTNo", MySqlConnector.MySqlDbType.VarChar, GSTNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmEmailID", MySqlConnector.MySqlDbType.VarChar, EmailID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmAddress", MySqlConnector.MySqlDbType.VarChar, Address, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmStateID", MySqlConnector.MySqlDbType.Int32, StateID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmPassword", MySqlConnector.MySqlDbType.VarChar, Password, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmMobileNo", MySqlConnector.MySqlDbType.VarChar, MobileNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmTNC", MySqlConnector.MySqlDbType.VarChar, TNC, clsMySQLCoreApp.ParamType.Input);

            ObjDAL.SetStoreProcedureData("ParmBankName", MySqlConnector.MySqlDbType.VarChar, BankName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmAccountNo", MySqlConnector.MySqlDbType.VarChar, AccountNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmIFSCCode", MySqlConnector.MySqlDbType.VarChar, IFSCCode, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmBranchName", MySqlConnector.MySqlDbType.VarChar, BranchName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);

            bool result = ObjDAL.ExecuteStoreProcedure_DML("ztech.SPR_Update_MyProfile");
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
            //DataTable dataTable = ObjDAL.ExecuteSelectStatement("CALL ztech.SPR_GetMyProfile()");
            ObjDAL.SetStoreProcedureData("ParmUserID", MySqlConnector.MySqlDbType.Int32, UserID, clsMySQLCoreApp.ParamType.Input);
            DataSet ds= ObjDAL.ExecuteStoreProcedure_Get("ztech.SPR_GetMyProfile");
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
        public void GetPartPaymentDetails()
        {
            // System.Threading.Thread.Sleep(2000);
            string jsonData = "{}";
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("CALL ztech.SPR_GetPartPaymentDetails()");
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
    }
}