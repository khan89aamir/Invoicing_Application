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
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="Invoicing_Service.Invoicing_ServiceSoap")]
    public interface Invoicing_ServiceSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/BindState", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindState();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/BindState", ReplyAction="*")]
        System.Threading.Tasks.Task BindStateAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ManageProducts", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void ManageProducts(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ManageProducts", ReplyAction="*")]
        System.Threading.Tasks.Task ManageProductsAsync(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetSKUDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetSKUDetails();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetSKUDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetSKUDetailsAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/DeleteSKU", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void DeleteSKU(int SKUID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/DeleteSKU", ReplyAction="*")]
        System.Threading.Tasks.Task DeleteSKUAsync(int SKUID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ManageCustomers", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void ManageCustomers(string CustomerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, int CustomerID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ManageCustomers", ReplyAction="*")]
        System.Threading.Tasks.Task ManageCustomersAsync(string CustomerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, int CustomerID, int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetCustomerDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetCustomerDetails();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetCustomerDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetCustomerDetailsAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/DeleteCustomer", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void DeleteCustomer(int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/DeleteCustomer", ReplyAction="*")]
        System.Threading.Tasks.Task DeleteCustomerAsync(int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Login", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void Login(string UserName, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Login", ReplyAction="*")]
        System.Threading.Tasks.Task LoginAsync(string UserName, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetCustomerAutoPopulate", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetCustomerAutoPopulate();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetCustomerAutoPopulate", ReplyAction="*")]
        System.Threading.Tasks.Task GetCustomerAutoPopulateAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/BindCustomer", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindCustomer();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/BindCustomer", ReplyAction="*")]
        System.Threading.Tasks.Task BindCustomerAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetSelectedCustomer", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetSelectedCustomer(int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetSelectedCustomer", ReplyAction="*")]
        System.Threading.Tasks.Task GetSelectedCustomerAsync(int CustomerID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/BindProduct", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BindProduct();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/BindProduct", ReplyAction="*")]
        System.Threading.Tasks.Task BindProductAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetSelectedProduct", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetSelectedProduct(int ProductID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetSelectedProduct", ReplyAction="*")]
        System.Threading.Tasks.Task GetSelectedProductAsync(int ProductID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/InsertUpdateSaleInvoiceMaster", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void InsertUpdateSaleInvoiceMaster(int parmSaleInvoiceID, string parmInvoiceNumber, System.DateTime parmInvoiceDate, string parmStateID, string parmPartyID, string parmTotalAmtBeforeTax, string parmDiscountAmount, string parmIGST, string parmCGST, string parmSGST, string parmGST, string parmAmountAfterGST, string parmCreatedBy, string parmModifiedBy);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/InsertUpdateSaleInvoiceMaster", ReplyAction="*")]
        System.Threading.Tasks.Task InsertUpdateSaleInvoiceMasterAsync(int parmSaleInvoiceID, string parmInvoiceNumber, System.DateTime parmInvoiceDate, string parmStateID, string parmPartyID, string parmTotalAmtBeforeTax, string parmDiscountAmount, string parmIGST, string parmCGST, string parmSGST, string parmGST, string parmAmountAfterGST, string parmCreatedBy, string parmModifiedBy);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/InsertUpdateSalesDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void InsertUpdateSalesDetails(string PostedData);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/InsertUpdateSalesDetails", ReplyAction="*")]
        System.Threading.Tasks.Task InsertUpdateSalesDetailsAsync(string PostedData);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ManageMyProfile", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void ManageMyProfile(int UserID, string OwnerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, string Password, string MobileNo, string TNC, string BankName, string AccountNo, string IFSCCode, string BranchName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ManageMyProfile", ReplyAction="*")]
        System.Threading.Tasks.Task ManageMyProfileAsync(int UserID, string OwnerName, string CompanyName, string GSTNo, string EmailID, string Address, int StateID, string Password, string MobileNo, string TNC, string BankName, string AccountNo, string IFSCCode, string BranchName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetMyProfile", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetMyProfile(int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetMyProfile", ReplyAction="*")]
        System.Threading.Tasks.Task GetMyProfileAsync(int UserID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetPartPaymentDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void GetPartPaymentDetails(string InvoiceNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetPartPaymentDetails", ReplyAction="*")]
        System.Threading.Tasks.Task GetPartPaymentDetailsAsync(string InvoiceNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/BINDSKU_Code", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void BINDSKU_Code();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/BINDSKU_Code", ReplyAction="*")]
        System.Threading.Tasks.Task BINDSKU_CodeAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/SaveOtherInfoiceDetails", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void SaveOtherInfoiceDetails(string parmInvoiceID, string parmReverseCharge, string parmTransportation_Mode, string parmVehicle_Number, string parmConsignee_Name, string parmConsignee_GST, string parmConsignee_StateID, string parmConsignee_Address, System.DateTime parmSupplyDate, string parmConsignee_PAN, string parmPlaceofSupply);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/SaveOtherInfoiceDetails", ReplyAction="*")]
        System.Threading.Tasks.Task SaveOtherInfoiceDetailsAsync(string parmInvoiceID, string parmReverseCharge, string parmTransportation_Mode, string parmVehicle_Number, string parmConsignee_Name, string parmConsignee_GST, string parmConsignee_StateID, string parmConsignee_Address, System.DateTime parmSupplyDate, string parmConsignee_PAN, string parmPlaceofSupply);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetReportData", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet GetReportData(string InvoiceID, string PartyID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetReportData", ReplyAction="*")]
        System.Threading.Tasks.Task<System.Data.DataSet> GetReportDataAsync(string InvoiceID, string PartyID);
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
        
        public void ManageProducts(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int UserID) {
            base.Channel.ManageProducts(SKUCode, SKUName, Rate, Description, ProudctID, UserID);
        }
        
        public System.Threading.Tasks.Task ManageProductsAsync(string SKUCode, string SKUName, decimal Rate, string Description, int ProudctID, int UserID) {
            return base.Channel.ManageProductsAsync(SKUCode, SKUName, Rate, Description, ProudctID, UserID);
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
        
        public void Login(string UserName, string Password) {
            base.Channel.Login(UserName, Password);
        }
        
        public System.Threading.Tasks.Task LoginAsync(string UserName, string Password) {
            return base.Channel.LoginAsync(UserName, Password);
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
        
        public void GetSelectedProduct(int ProductID) {
            base.Channel.GetSelectedProduct(ProductID);
        }
        
        public System.Threading.Tasks.Task GetSelectedProductAsync(int ProductID) {
            return base.Channel.GetSelectedProductAsync(ProductID);
        }
        
        public void InsertUpdateSaleInvoiceMaster(int parmSaleInvoiceID, string parmInvoiceNumber, System.DateTime parmInvoiceDate, string parmStateID, string parmPartyID, string parmTotalAmtBeforeTax, string parmDiscountAmount, string parmIGST, string parmCGST, string parmSGST, string parmGST, string parmAmountAfterGST, string parmCreatedBy, string parmModifiedBy) {
            base.Channel.InsertUpdateSaleInvoiceMaster(parmSaleInvoiceID, parmInvoiceNumber, parmInvoiceDate, parmStateID, parmPartyID, parmTotalAmtBeforeTax, parmDiscountAmount, parmIGST, parmCGST, parmSGST, parmGST, parmAmountAfterGST, parmCreatedBy, parmModifiedBy);
        }
        
        public System.Threading.Tasks.Task InsertUpdateSaleInvoiceMasterAsync(int parmSaleInvoiceID, string parmInvoiceNumber, System.DateTime parmInvoiceDate, string parmStateID, string parmPartyID, string parmTotalAmtBeforeTax, string parmDiscountAmount, string parmIGST, string parmCGST, string parmSGST, string parmGST, string parmAmountAfterGST, string parmCreatedBy, string parmModifiedBy) {
            return base.Channel.InsertUpdateSaleInvoiceMasterAsync(parmSaleInvoiceID, parmInvoiceNumber, parmInvoiceDate, parmStateID, parmPartyID, parmTotalAmtBeforeTax, parmDiscountAmount, parmIGST, parmCGST, parmSGST, parmGST, parmAmountAfterGST, parmCreatedBy, parmModifiedBy);
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
        
        public void GetPartPaymentDetails(string InvoiceNo) {
            base.Channel.GetPartPaymentDetails(InvoiceNo);
        }
        
        public System.Threading.Tasks.Task GetPartPaymentDetailsAsync(string InvoiceNo) {
            return base.Channel.GetPartPaymentDetailsAsync(InvoiceNo);
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
    }
}
