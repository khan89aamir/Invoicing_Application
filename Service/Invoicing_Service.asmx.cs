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
        public void ManageProducts(string SKUName, decimal Rate, string Description, int ProudctID)
        {
            clsMessage message = new clsMessage();

            ObjDAL.SetStoreProcedureData("ParmSKUName", MySqlConnector.MySqlDbType.VarChar, SKUName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmRate", MySqlConnector.MySqlDbType.Decimal, Rate, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmDescription", MySqlConnector.MySqlDbType.VarChar, Description, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmProductID", MySqlConnector.MySqlDbType.Int32, ProudctID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, 1, clsMySQLCoreApp.ParamType.Input);

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
                message.strMessage = "Failed to Insert SKU " + SKUName + ". Error : " + ObjDAL.strErrorText;
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
            Context.Response.ContentType = "application/json";
            Context.Response.Write(jsonData);
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
            , string Address, int StateID, int CustomerID)
        {
            clsMessage message = new clsMessage();

            ObjDAL.SetStoreProcedureData("ParmCustomerName", MySqlConnector.MySqlDbType.VarChar, CustomerName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCompanyName", MySqlConnector.MySqlDbType.VarChar, CompanyName, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmGSTNo", MySqlConnector.MySqlDbType.VarChar, GSTNo, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmEmailID", MySqlConnector.MySqlDbType.VarChar, EmailID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmAddress", MySqlConnector.MySqlDbType.VarChar, Address, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCustomerID", MySqlConnector.MySqlDbType.Int32, CustomerID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmStateID", MySqlConnector.MySqlDbType.Int32, StateID, clsMySQLCoreApp.ParamType.Input);
            ObjDAL.SetStoreProcedureData("ParmCreatedBy", MySqlConnector.MySqlDbType.Int32, 1, clsMySQLCoreApp.ParamType.Input);

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
                message.strMessage = "Failed to Insert Customer Name " + CustomerName + ". Error : " + ObjDAL.strErrorText;
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
            Context.Response.ContentType = "application/json";
            Context.Response.Write(jsonData);
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

            object result = ObjDAL.ExecuteScalarQuery("Select count(*) from ztech.tblMyProfile where UserName='"+UserName+"' AND Password='"+Password+"'");
            if (result!=null)
            {
                if (Convert.ToInt32(result) > 0)
                {
                    message.Result = true;
                    message.strMessage = "User Found.";
                    message.Value = GetDefaultState();
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

        public int GetDefaultState()
        {
          int state=  ObjDAL.ExecuteScalarInt("select State from  ztech.tblMyProfile where profileID=1");
            return state;


        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetCustomerAutoPopulate()
        {
            DataTable dataTable = ObjDAL.ExecuteSelectStatement("SELECT CustomerID, CustomerName FROM ztech.tblCustomerMaster");
            if (dataTable.Rows.Count > 0)
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






    }
}