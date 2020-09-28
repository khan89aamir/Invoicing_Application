﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Invoicing_Application.Invoicing_Service {
    using System.Data;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://anjacreation.in/Service", ConfigurationName="Invoicing_Service.Invoicing_ServiceSoap")]
    public interface Invoicing_ServiceSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindState", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindState();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindState", ReplyAction="*")]
        System.Threading.Tasks.Task BindStateAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindHSNCode", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindHSNCode();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindHSNCode", ReplyAction="*")]
        System.Threading.Tasks.Task BindHSNCodeAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ManageProducts", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void ManageProducts(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int HSNID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ManageProducts", ReplyAction="*")]
        System.Threading.Tasks.Task ManageProductsAsync(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int HSNID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetSKUDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetSKUDetails();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetSKUDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetSKUDetailsAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/DeleteSKU", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void DeleteSKU(int SKUID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/DeleteSKU", ReplyAction="*")]
        System.Threading.Tasks.Task DeleteSKUAsync(int SKUID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/DeleteInvoice", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void DeleteInvoice(int InvoiceID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/DeleteInvoice", ReplyAction="*")]
        System.Threading.Tasks.Task DeleteInvoiceAsync(int InvoiceID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ManageCustomers", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void ManageCustomers(string CustomerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, int CustomerID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ManageCustomers", ReplyAction="*")]
        System.Threading.Tasks.Task ManageCustomersAsync(string CustomerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, int CustomerID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetCustomerDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetCustomerDetails();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetCustomerDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetCustomerDetailsAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/DeleteCustomer", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void DeleteCustomer(int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/DeleteCustomer", ReplyAction="*")]
        System.Threading.Tasks.Task DeleteCustomerAsync(int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/Login", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        bool Login(string UserName, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/Login", ReplyAction="*")]
        System.Threading.Tasks.Task<bool> LoginAsync(string UserName, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ValidateLogin", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataTable ValidateLogin(string UserName, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ValidateLogin", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataTable> ValidateLoginAsync(string UserName, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetDefaultState", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        string GetDefaultState();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetDefaultState", ReplyAction="*")]
        System.Threading.Tasks.Task<string> GetDefaultStateAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetCustomerAutoPopulate", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetCustomerAutoPopulate();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetCustomerAutoPopulate", ReplyAction="*")]
        System.Threading.Tasks.Task GetCustomerAutoPopulateAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindCustomer", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindCustomer();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindCustomer", ReplyAction="*")]
        System.Threading.Tasks.Task BindCustomerAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetSelectedCustomer", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetSelectedCustomer(int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetSelectedCustomer", ReplyAction="*")]
        System.Threading.Tasks.Task GetSelectedCustomerAsync(int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindProduct", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindProduct();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindProduct", ReplyAction="*")]
        System.Threading.Tasks.Task BindProductAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetSelectedProduct", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetSelectedProduct(int ProductID, int PartyID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetSelectedProduct", ReplyAction="*")]
        System.Threading.Tasks.Task GetSelectedProductAsync(int ProductID, int PartyID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/InsertUpdateSaleInvoiceMaster", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void InsertUpdateSaleInvoiceMaster(
                    int parmSaleInvoiceID, 
                    string parmInvoiceNumber, 
                    System.DateTime parmInvoiceDate, 
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
                    string parmModifiedBy);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/InsertUpdateSaleInvoiceMaster", ReplyAction="*")]
        System.Threading.Tasks.Task InsertUpdateSaleInvoiceMasterAsync(
                    int parmSaleInvoiceID, 
                    string parmInvoiceNumber, 
                    System.DateTime parmInvoiceDate, 
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
                    string parmModifiedBy);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/InsertUpdateSalesDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void InsertUpdateSalesDetails(string PostedData);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/InsertUpdateSalesDetails", ReplyAction="*")]
        System.Threading.Tasks.Task InsertUpdateSalesDetailsAsync(string PostedData);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ManageMyProfile", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void ManageMyProfile(int UserID, string OwnerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, string Password, string MobileNo, string TNC, string BankName, string AccountNo, string IFSCCode, string BranchName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ManageMyProfile", ReplyAction="*")]
        System.Threading.Tasks.Task ManageMyProfileAsync(int UserID, string OwnerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, string Password, string MobileNo, string TNC, string BankName, string AccountNo, string IFSCCode, string BranchName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetMyProfile", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetMyProfile(int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetMyProfile", ReplyAction="*")]
        System.Threading.Tasks.Task GetMyProfileAsync(int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetPartPaymentList", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetPartPaymentList(string InvoiceNo, int CustomerID, int PaymentStatus);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetPartPaymentList", ReplyAction="*")]
        System.Threading.Tasks.Task GetPartPaymentListAsync(string InvoiceNo, int CustomerID, int PaymentStatus);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/InsertPartPayment", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void InsertPartPayment(string InvoiceNo, int InvoiceID, int CustomerID, string PaymentMode, string ChequeNo, System.DateTime TransactionDate, decimal PayAmount, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/InsertPartPayment", ReplyAction="*")]
        System.Threading.Tasks.Task InsertPartPaymentAsync(string InvoiceNo, int InvoiceID, int CustomerID, string PaymentMode, string ChequeNo, System.DateTime TransactionDate, decimal PayAmount, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetPartPaymentDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetPartPaymentDetails(int InvoiceID, int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetPartPaymentDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetPartPaymentDetailsAsync(int InvoiceID, int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ManageHSNCode", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void ManageHSNCode(string HSNCode, string HSNDescription, decimal CGST, decimal SGST, decimal IGST, int HSNID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ManageHSNCode", ReplyAction="*")]
        System.Threading.Tasks.Task ManageHSNCodeAsync(string HSNCode, string HSNDescription, decimal CGST, decimal SGST, decimal IGST, int HSNID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetHSNDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetHSNDetails();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetHSNDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetHSNDetailsAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/DeletedHSNCode", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void DeletedHSNCode(int HSNID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/DeletedHSNCode", ReplyAction="*")]
        System.Threading.Tasks.Task DeletedHSNCodeAsync(int HSNID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetInvoiceDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetInvoiceDetails(System.DateTime FromDate, System.DateTime ToDate);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetInvoiceDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetInvoiceDetailsAsync(System.DateTime FromDate, System.DateTime ToDate);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ForgotEmailIDData", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void ForgotEmailIDData(string ForgotEmailID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/ForgotEmailIDData", ReplyAction="*")]
        System.Threading.Tasks.Task ForgotEmailIDDataAsync(string ForgotEmailID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/SendForgotPass", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void SendForgotPass(string ForgotEmailID, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/SendForgotPass", ReplyAction="*")]
        System.Threading.Tasks.Task SendForgotPassAsync(string ForgotEmailID, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BINDSKU_Code", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BINDSKU_Code();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BINDSKU_Code", ReplyAction="*")]
        System.Threading.Tasks.Task BINDSKU_CodeAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/SaveOtherInfoiceDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void SaveOtherInfoiceDetails(string parmInvoiceID, string parmReverseCharge, string parmTransportation_Mode, string parmVehicle_Number, string parmConsignee_Name, string parmConsignee_GST, string parmConsignee_StateID, string parmConsignee_Address, System.DateTime parmSupplyDate, string parmConsignee_PAN, string parmPlaceofSupply);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/SaveOtherInfoiceDetails", ReplyAction="*")]
        System.Threading.Tasks.Task SaveOtherInfoiceDetailsAsync(string parmInvoiceID, string parmReverseCharge, string parmTransportation_Mode, string parmVehicle_Number, string parmConsignee_Name, string parmConsignee_GST, string parmConsignee_StateID, string parmConsignee_Address, System.DateTime parmSupplyDate, string parmConsignee_PAN, string parmPlaceofSupply);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetReportData", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet GetReportData(string InvoiceID, string PartyID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetReportData", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataSet> GetReportDataAsync(string InvoiceID, string PartyID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindCGST", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindCGST();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindCGST", ReplyAction="*")]
        System.Threading.Tasks.Task BindCGSTAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindSGST", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindSGST();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindSGST", ReplyAction="*")]
        System.Threading.Tasks.Task BindSGSTAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindIGST", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindIGST();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/BindIGST", ReplyAction="*")]
        System.Threading.Tasks.Task BindIGSTAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetSalesDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetSalesDetails(string InvoiceID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetSalesDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetSalesDetailsAsync(string InvoiceID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetBindInvoiceDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetBindInvoiceDetails(string invoiceID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://anjacreation.in/Service/GetBindInvoiceDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetBindInvoiceDetailsAsync(string invoiceID);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface Invoicing_ServiceSoapChannel : Invoicing_Application.Invoicing_Service.Invoicing_ServiceSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class Invoicing_ServiceSoapClient : System.ServiceModel.ClientBase<Invoicing_Application.Invoicing_Service.Invoicing_ServiceSoap>, Invoicing_Application.Invoicing_Service.Invoicing_ServiceSoap {
        
        public Invoicing_ServiceSoapClient() {
        }
        
        public Invoicing_ServiceSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public Invoicing_ServiceSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public Invoicing_ServiceSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public Invoicing_ServiceSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public void BindState() {
            base.Channel.BindState();
        }
        
        public System.Threading.Tasks.Task BindStateAsync() {
            return base.Channel.BindStateAsync();
        }
        
        public void BindHSNCode() {
            base.Channel.BindHSNCode();
        }
        
        public System.Threading.Tasks.Task BindHSNCodeAsync() {
            return base.Channel.BindHSNCodeAsync();
        }
        
        public void ManageProducts(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int HSNID, int UserID) {
            base.Channel.ManageProducts(SKUCode, SKUName, Rate, Description, ProudctID, HSNID, UserID);
        }
        
        public System.Threading.Tasks.Task ManageProductsAsync(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int HSNID, int UserID) {
            return base.Channel.ManageProductsAsync(SKUCode, SKUName, Rate, Description, ProudctID, HSNID, UserID);
        }
        
        public void GetSKUDetails() {
            base.Channel.GetSKUDetails();
        }
        
        public System.Threading.Tasks.Task GetSKUDetailsAsync() {
            return base.Channel.GetSKUDetailsAsync();
        }
        
        public void DeleteSKU(int SKUID) {
            base.Channel.DeleteSKU(SKUID);
        }
        
        public System.Threading.Tasks.Task DeleteSKUAsync(int SKUID) {
            return base.Channel.DeleteSKUAsync(SKUID);
        }
        
        public void DeleteInvoice(int InvoiceID) {
            base.Channel.DeleteInvoice(InvoiceID);
        }
        
        public System.Threading.Tasks.Task DeleteInvoiceAsync(int InvoiceID) {
            return base.Channel.DeleteInvoiceAsync(InvoiceID);
        }
        
        public void ManageCustomers(string CustomerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, int CustomerID, int UserID) {
            base.Channel.ManageCustomers(CustomerName, CompanyName, GSTNo, EmailID, Address, StateID, CustomerID, UserID);
        }
        
        public System.Threading.Tasks.Task ManageCustomersAsync(string CustomerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, int CustomerID, int UserID) {
            return base.Channel.ManageCustomersAsync(CustomerName, CompanyName, GSTNo, EmailID, Address, StateID, CustomerID, UserID);
        }
        
        public void GetCustomerDetails() {
            base.Channel.GetCustomerDetails();
        }
        
        public System.Threading.Tasks.Task GetCustomerDetailsAsync() {
            return base.Channel.GetCustomerDetailsAsync();
        }
        
        public void DeleteCustomer(int CustomerID) {
            base.Channel.DeleteCustomer(CustomerID);
        }
        
        public System.Threading.Tasks.Task DeleteCustomerAsync(int CustomerID) {
            return base.Channel.DeleteCustomerAsync(CustomerID);
        }
        
        public bool Login(string UserName, string Password) {
            return base.Channel.Login(UserName, Password);
        }
        
        public System.Threading.Tasks.Task<bool> LoginAsync(string UserName, string Password) {
            return base.Channel.LoginAsync(UserName, Password);
        }
        
        public System.Data.DataTable ValidateLogin(string UserName, string Password) {
            return base.Channel.ValidateLogin(UserName, Password);
        }
        
        public System.Threading.Tasks.Task<System.Data.DataTable> ValidateLoginAsync(string UserName, string Password) {
            return base.Channel.ValidateLoginAsync(UserName, Password);
        }
        
        public string GetDefaultState() {
            return base.Channel.GetDefaultState();
        }
        
        public System.Threading.Tasks.Task<string> GetDefaultStateAsync() {
            return base.Channel.GetDefaultStateAsync();
        }
        
        public void GetCustomerAutoPopulate() {
            base.Channel.GetCustomerAutoPopulate();
        }
        
        public System.Threading.Tasks.Task GetCustomerAutoPopulateAsync() {
            return base.Channel.GetCustomerAutoPopulateAsync();
        }
        
        public void BindCustomer() {
            base.Channel.BindCustomer();
        }
        
        public System.Threading.Tasks.Task BindCustomerAsync() {
            return base.Channel.BindCustomerAsync();
        }
        
        public void GetSelectedCustomer(int CustomerID) {
            base.Channel.GetSelectedCustomer(CustomerID);
        }
        
        public System.Threading.Tasks.Task GetSelectedCustomerAsync(int CustomerID) {
            return base.Channel.GetSelectedCustomerAsync(CustomerID);
        }
        
        public void BindProduct() {
            base.Channel.BindProduct();
        }
        
        public System.Threading.Tasks.Task BindProductAsync() {
            return base.Channel.BindProductAsync();
        }
        
        public void GetSelectedProduct(int ProductID, int PartyID) {
            base.Channel.GetSelectedProduct(ProductID, PartyID);
        }
        
        public System.Threading.Tasks.Task GetSelectedProductAsync(int ProductID, int PartyID) {
            return base.Channel.GetSelectedProductAsync(ProductID, PartyID);
        }
        
        public void InsertUpdateSaleInvoiceMaster(
                    int parmSaleInvoiceID, 
                    string parmInvoiceNumber, 
                    System.DateTime parmInvoiceDate, 
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
                    string parmModifiedBy) {
            base.Channel.InsertUpdateSaleInvoiceMaster(parmSaleInvoiceID, parmInvoiceNumber, parmInvoiceDate, parmStateID, parmPartyID, parmTotalAmtBeforeTax, parmDiscountAmount, parmIGST, parmCGST, parmSGST, parmGST, parmCGST_Percent, parmSGST_Percent, parmIGST_Percent, parmAmountAfterGST, parmCreatedBy, parmModifiedBy);
        }
        
        public System.Threading.Tasks.Task InsertUpdateSaleInvoiceMasterAsync(
                    int parmSaleInvoiceID, 
                    string parmInvoiceNumber, 
                    System.DateTime parmInvoiceDate, 
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
                    string parmModifiedBy) {
            return base.Channel.InsertUpdateSaleInvoiceMasterAsync(parmSaleInvoiceID, parmInvoiceNumber, parmInvoiceDate, parmStateID, parmPartyID, parmTotalAmtBeforeTax, parmDiscountAmount, parmIGST, parmCGST, parmSGST, parmGST, parmCGST_Percent, parmSGST_Percent, parmIGST_Percent, parmAmountAfterGST, parmCreatedBy, parmModifiedBy);
        }
        
        public void InsertUpdateSalesDetails(string PostedData) {
            base.Channel.InsertUpdateSalesDetails(PostedData);
        }
        
        public System.Threading.Tasks.Task InsertUpdateSalesDetailsAsync(string PostedData) {
            return base.Channel.InsertUpdateSalesDetailsAsync(PostedData);
        }
        
        public void ManageMyProfile(int UserID, string OwnerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, string Password, string MobileNo, string TNC, string BankName, string AccountNo, string IFSCCode, string BranchName) {
            base.Channel.ManageMyProfile(UserID, OwnerName, CompanyName, GSTNo, EmailID, Address, StateID, Password, MobileNo, TNC, BankName, AccountNo, IFSCCode, BranchName);
        }
        
        public System.Threading.Tasks.Task ManageMyProfileAsync(int UserID, string OwnerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, string Password, string MobileNo, string TNC, string BankName, string AccountNo, string IFSCCode, string BranchName) {
            return base.Channel.ManageMyProfileAsync(UserID, OwnerName, CompanyName, GSTNo, EmailID, Address, StateID, Password, MobileNo, TNC, BankName, AccountNo, IFSCCode, BranchName);
        }
        
        public void GetMyProfile(int UserID) {
            base.Channel.GetMyProfile(UserID);
        }
        
        public System.Threading.Tasks.Task GetMyProfileAsync(int UserID) {
            return base.Channel.GetMyProfileAsync(UserID);
        }
        
        public void GetPartPaymentList(string InvoiceNo, int CustomerID, int PaymentStatus) {
            base.Channel.GetPartPaymentList(InvoiceNo, CustomerID, PaymentStatus);
        }
        
        public System.Threading.Tasks.Task GetPartPaymentListAsync(string InvoiceNo, int CustomerID, int PaymentStatus) {
            return base.Channel.GetPartPaymentListAsync(InvoiceNo, CustomerID, PaymentStatus);
        }
        
        public void InsertPartPayment(string InvoiceNo, int InvoiceID, int CustomerID, string PaymentMode, string ChequeNo, System.DateTime TransactionDate, decimal PayAmount, int UserID) {
            base.Channel.InsertPartPayment(InvoiceNo, InvoiceID, CustomerID, PaymentMode, ChequeNo, TransactionDate, PayAmount, UserID);
        }
        
        public System.Threading.Tasks.Task InsertPartPaymentAsync(string InvoiceNo, int InvoiceID, int CustomerID, string PaymentMode, string ChequeNo, System.DateTime TransactionDate, decimal PayAmount, int UserID) {
            return base.Channel.InsertPartPaymentAsync(InvoiceNo, InvoiceID, CustomerID, PaymentMode, ChequeNo, TransactionDate, PayAmount, UserID);
        }
        
        public void GetPartPaymentDetails(int InvoiceID, int CustomerID) {
            base.Channel.GetPartPaymentDetails(InvoiceID, CustomerID);
        }
        
        public System.Threading.Tasks.Task GetPartPaymentDetailsAsync(int InvoiceID, int CustomerID) {
            return base.Channel.GetPartPaymentDetailsAsync(InvoiceID, CustomerID);
        }
        
        public void ManageHSNCode(string HSNCode, string HSNDescription, decimal CGST, decimal SGST, decimal IGST, int HSNID, int UserID) {
            base.Channel.ManageHSNCode(HSNCode, HSNDescription, CGST, SGST, IGST, HSNID, UserID);
        }
        
        public System.Threading.Tasks.Task ManageHSNCodeAsync(string HSNCode, string HSNDescription, decimal CGST, decimal SGST, decimal IGST, int HSNID, int UserID) {
            return base.Channel.ManageHSNCodeAsync(HSNCode, HSNDescription, CGST, SGST, IGST, HSNID, UserID);
        }
        
        public void GetHSNDetails() {
            base.Channel.GetHSNDetails();
        }
        
        public System.Threading.Tasks.Task GetHSNDetailsAsync() {
            return base.Channel.GetHSNDetailsAsync();
        }
        
        public void DeletedHSNCode(int HSNID) {
            base.Channel.DeletedHSNCode(HSNID);
        }
        
        public System.Threading.Tasks.Task DeletedHSNCodeAsync(int HSNID) {
            return base.Channel.DeletedHSNCodeAsync(HSNID);
        }
        
        public void GetInvoiceDetails(System.DateTime FromDate, System.DateTime ToDate) {
            base.Channel.GetInvoiceDetails(FromDate, ToDate);
        }
        
        public System.Threading.Tasks.Task GetInvoiceDetailsAsync(System.DateTime FromDate, System.DateTime ToDate) {
            return base.Channel.GetInvoiceDetailsAsync(FromDate, ToDate);
        }
        
        public void ForgotEmailIDData(string ForgotEmailID) {
            base.Channel.ForgotEmailIDData(ForgotEmailID);
        }
        
        public System.Threading.Tasks.Task ForgotEmailIDDataAsync(string ForgotEmailID) {
            return base.Channel.ForgotEmailIDDataAsync(ForgotEmailID);
        }
        
        public void SendForgotPass(string ForgotEmailID, string Password) {
            base.Channel.SendForgotPass(ForgotEmailID, Password);
        }
        
        public System.Threading.Tasks.Task SendForgotPassAsync(string ForgotEmailID, string Password) {
            return base.Channel.SendForgotPassAsync(ForgotEmailID, Password);
        }
        
        public void BINDSKU_Code() {
            base.Channel.BINDSKU_Code();
        }
        
        public System.Threading.Tasks.Task BINDSKU_CodeAsync() {
            return base.Channel.BINDSKU_CodeAsync();
        }
        
        public void SaveOtherInfoiceDetails(string parmInvoiceID, string parmReverseCharge, string parmTransportation_Mode, string parmVehicle_Number, string parmConsignee_Name, string parmConsignee_GST, string parmConsignee_StateID, string parmConsignee_Address, System.DateTime parmSupplyDate, string parmConsignee_PAN, string parmPlaceofSupply) {
            base.Channel.SaveOtherInfoiceDetails(parmInvoiceID, parmReverseCharge, parmTransportation_Mode, parmVehicle_Number, parmConsignee_Name, parmConsignee_GST, parmConsignee_StateID, parmConsignee_Address, parmSupplyDate, parmConsignee_PAN, parmPlaceofSupply);
        }
        
        public System.Threading.Tasks.Task SaveOtherInfoiceDetailsAsync(string parmInvoiceID, string parmReverseCharge, string parmTransportation_Mode, string parmVehicle_Number, string parmConsignee_Name, string parmConsignee_GST, string parmConsignee_StateID, string parmConsignee_Address, System.DateTime parmSupplyDate, string parmConsignee_PAN, string parmPlaceofSupply) {
            return base.Channel.SaveOtherInfoiceDetailsAsync(parmInvoiceID, parmReverseCharge, parmTransportation_Mode, parmVehicle_Number, parmConsignee_Name, parmConsignee_GST, parmConsignee_StateID, parmConsignee_Address, parmSupplyDate, parmConsignee_PAN, parmPlaceofSupply);
        }
        
        public System.Data.DataSet GetReportData(string InvoiceID, string PartyID) {
            return base.Channel.GetReportData(InvoiceID, PartyID);
        }
        
        public System.Threading.Tasks.Task<System.Data.DataSet> GetReportDataAsync(string InvoiceID, string PartyID) {
            return base.Channel.GetReportDataAsync(InvoiceID, PartyID);
        }
        
        public void BindCGST() {
            base.Channel.BindCGST();
        }
        
        public System.Threading.Tasks.Task BindCGSTAsync() {
            return base.Channel.BindCGSTAsync();
        }
        
        public void BindSGST() {
            base.Channel.BindSGST();
        }
        
        public System.Threading.Tasks.Task BindSGSTAsync() {
            return base.Channel.BindSGSTAsync();
        }
        
        public void BindIGST() {
            base.Channel.BindIGST();
        }
        
        public System.Threading.Tasks.Task BindIGSTAsync() {
            return base.Channel.BindIGSTAsync();
        }
        
        public void GetSalesDetails(string InvoiceID) {
            base.Channel.GetSalesDetails(InvoiceID);
        }
        
        public System.Threading.Tasks.Task GetSalesDetailsAsync(string InvoiceID) {
            return base.Channel.GetSalesDetailsAsync(InvoiceID);
        }
        
        public void GetBindInvoiceDetails(string invoiceID) {
            base.Channel.GetBindInvoiceDetails(invoiceID);
        }
        
        public System.Threading.Tasks.Task GetBindInvoiceDetailsAsync(string invoiceID) {
            return base.Channel.GetBindInvoiceDetailsAsync(invoiceID);
        }
    }
}
