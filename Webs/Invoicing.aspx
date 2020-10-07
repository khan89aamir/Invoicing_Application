<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Invoicing.aspx.cs" Inherits="Invoicing_Application.Webs.Invoicing" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../assets/js/select2.js"></script>
    <link href="../assets/css/select2.css" rel="stylesheet" />
    <script src="../assets/js/mindmup-editabletable.js"></script>
    <script src="../assets/js/fnFindCellRowIndexes.js"></script>
    <style>
        .PnlHeading {
            background-color: #f7f7f7;
            border-radius: 6px;
            padding: 5px;
        }

        .disableValue {
            pointer-events: none;
        }

        .OldRate {
            background-color: yellow;
        }
        /* For device width smaller than 600px: */
        @media screen and (max-width: 600px) {

          
            .container{
                padding-left:0px!important;
                padding-right:0px!important;
            }
        }
    </style>

    <br />
    <div id="mainContainer" class="container">
        <div class="container d-flex justify-content-start">
            <div class="card border-info" style="width: 100%">
                <div class="card-header">
                    <h5 class="PnlHeading">Invoice </h5>
                </div>
                <div class="card-body">
                    <h5 class="PnlHeading" hidden>Search Invoice :</h5>

                    <div class="form-row">
                        <div class="col-md-4">

                            <div class="form-group">
                                <input type="text" class="form-control-sm text" id="txtBindInvoiceID" runat="server" placeholder="0" />
                                <input type="button" class="btn btn-sm btn-info" id="btnBindInvoice" value="Search Invoice" />
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                            </div>

                        </div>
                        <div class="col-md-4">
                        </div>
                    </div>
                    <form id="frmInvoice" class="needs-validation" novalidate runat="server">

                        <h5 class="PnlHeading">Invoice Header</h5>
                        <div class="form-row">
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">Invoice No : </label>
                                    <input type="text" id="txtInvoiceID" value="0" hidden />
                                    <input type="text" class="form-control text " autocomplete="off" id="txtInvoiceNumber" name="txtInvoiceNumber" value="INV-{AUTO}" placeholder="Enter Invoice Number" disabled required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="form-group">

                                    <label for="txtMail">Invoice Date: </label>
                                    <input type="text" class="form-control text " autocomplete="off" id="datepicker" name="datepicker" placeholder="Enter Invoice Date" required>
                                    <div class="invalid-feedback text-left">
                                        Enter Invoice Date
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <div class="form-row">

                                    <label for="cmdState">State :</label>
                                    <input type="text" id="cmdState" hidden />
                                    <input type="text" id="txtStateName" class="form-control text" disabled />

                                    <%-- <asp:DropDownList ID="cmdState" class="custom-select" name="cmdState" runat="server" required="true">
                                    </asp:DropDownList>--%>

                                    <div class="invalid-feedback">
                                        Please select State.
                                    </div>

                                </div>
                            </div>
                        </div>
                        <hr />
                        <h5 class="PnlHeading">Bill to Party</h5>
                        <div class="form-row">
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">Bill To : </label>
                                    <%--this has custome validtion--%>
                                    <select id='cmbCustomer' class="custom-select">
                                    </select>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Party Name
                                    </div>
                                    <button id="btnGetCustomer" class="btn btn-primary btn-sm mt-1" type="button" hidden>Get Customer Details</button>
                                    <br />
                                    <div id="loadingPartyDiv" class="d-none">
                                        <div class="spinner-border spinner-border-sm text-primary" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        Fetching Party Details Please Wait....
                                    </div>

                                    <a href="Customer.aspx" target="_blank"><i class="fa fa-plus mr-1" aria-hidden="true"></i>Add New Customer</a>
                                    <br />
                                    <a id="lnkRefresh" href="#" target="_blank"><i class="fa fa-refresh mr-1" aria-hidden="true"></i>Refresh</a>

                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="form-group">
                                    <input type="text" class="form-control text " autocomplete="off" id="txtPartyStateID" name="txtPartyStateID" placeholder="Enter GST Number" hidden>

                                    <label for="txtFullName">GST No </label>
                                    <input type="text" class="form-control text disableValue" autocomplete="off" id="txtGSTNo" name="txtGSTNo" placeholder="Enter GST Number">

                                    <div class="invalid-feedback text-left">
                                        Please Enter GST No
                                    </div>
                                </div>

                            </div>

                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">State </label>
                                    <input type="text" class="form-control text disableValue " id="txtPartyState" name="txtPartyState" autocomplete="off" placeholder="Enter Your State">
                                    <div class="invalid-feedback text-left">
                                        Please Enter State 
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="form-row">


                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="txtFullName">Address </label>
                                    <input type="text" class="form-control text disableValue" id="txtAddress" name="txtAddress" autocomplete="off" placeholder="Enter Address">
                                    <div class="invalid-feedback text-left">
                                        Please Enter Address 
                                    </div>
                                </div>

                            </div>

                        </div>

                        <hr />
                        <h5 class="PnlHeading">Product Details</h5>
                        <div class="form-row">
                            <div class="col-md-4">

                                <div class="form-group">

                                    <label for="cmbProduct">Select Product: </label>
                                    <select id='cmbProduct' class="custom-select">
                                    </select>

                                    <div class="invalid-feedback text-left">
                                        Please Select your product.
                                    </div>
                                </div>

                            </div>

                            <div class="col-md-4">

                                <div class="form-group">

                                    <label for="cmbSKU">Select SKU No: </label>
                                    <select id='cmbSKU' class="custom-select">
                                    </select>

                                    <div class="invalid-feedback text-left">
                                        Please Enter SKU.
                                    </div>
                                </div>

                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <div id="loadingProduct" class="invisible mt-2">
                                        <div class="spinner-border spinner-border-sm text-primary" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        Fetching Party Details Please Wait....
                                    </div>
                                    <button type="button" id="btnGetproduct" class="btn btn-primary btn-sm" hidden>Get Product Details</button>
                                </div>

                            </div>
                        </div>

                        <div class="form-row">

                            <div class="col-md-3">
                                <input type="text" class="form-control text " id="txtProductID" name="txtProductID" placeholder="ProductID" hidden>
                                <div class="form-group">
                                    <label for="txtFullName">Product Name </label>
                                    <input type="text" class="form-control text disableValue " id="txtProductName" name="txtProductName" autocomplete="off" placeholder="Enter Product Name">
                                    <div class="invalid-feedback text-left">
                                        Please Enter Product Name
                                    </div>
                                </div>


                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">QTY </label>
                                    <input type="number" class="form-control text  " id="txtQTY" onchange="OnQTYChange()" name="txtQTY">
                                    <div class="invalid-feedback text-left">
                                        Please Enter QTY
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Rate </label>
                                    <input type="text" class="form-control text " id="txtRate" name="txtRate" onchange="OnQTYChange()" autocomplete="off" placeholder="0.00">
                                    <div class="invalid-feedback text-left">
                                        Rate is missing
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Total </label>
                                    <input type="text" class="form-control text disableValue" id="txtTotal" name="txtTotal" autocomplete="off" placeholder="0.00">
                                    <div class="invalid-feedback text-left">
                                        Total Value Missing
                                    </div>
                                </div>

                            </div>

                            <input type="text" class="form-control text disableValue " id="txtSKUNumber" name="txtSKUNumber" placeholder="txtSKUNumber" hidden>
                            <input type="text" class="form-control text disableValue" id="txtHSN_No" name="txtHSN_No" placeholder="txtHSN_No" hidden>

                            <input type="text" class="form-control text " id="txtHSNID" name="txtHSNID" placeholder="txtHSNID" hidden>
                            <input type="text" class="form-control text " id="txtCGST" name="txtCGST" placeholder="txtCGST" hidden>
                            <input type="text" class="form-control text " id="txtSGST" name="txtSGST" placeholder="txtSGST" hidden>
                            <input type="text" class="form-control text " id="txtIGST" name="txtIGST" placeholder="txtIGST" hidden>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-2  text-right">
                                <button id="btnAddProduct" type="button" class="btn btn-primary ui-state-disabled "><i class="fa fa-plus mr-1" aria-hidden="true"></i>Add Item</button>
                                <button id="btnCancel" type="button" formnovalidate="formnovalidate" class="btn btn-secondary"><i class="fa fa-times mr-1" aria-hidden="true"></i>Cancel</button>

                            </div>

                        </div>

                        <div class="row">
                            <div class="col-12">
                                <table id="tblProduct" class="table table-hover table-responsive-md" style="width: 100%">
                                    <thead>

                                        <tr>
                                            <th>ProductID</th>
                                            <th>HSNID</th>
                                            <th>SKU Code</th>
                                            <th>Product Name</th>

                                            <th>HSN Code</th>
                                            <th>QTY</th>
                                            <th>Rate</th>
                                            <th>Total</th>
                                            <th>CGST</th>
                                            <th>SGST</th>
                                            <th>IGST</th>

                                            <th>Delete</th>
                                            <th>CGST_amt</th>
                                            <th>SGST_amt</th>
                                            <th>IGST_amt</th>


                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>

                                </table>
                            </div>
                        </div>


                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Total Amount Before Tax :</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm disableValue" id="txtAmountBeforeTax" value="0.00">
                            </div>
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Discount Amount (%) :</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm " id="txtDiscountAmt" placeholder="0.00" onfocus="OnDiscountFocus()" onchange="MasterCalculation()">
                            </div>
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label  ">Total CGST : </label>
                            <div class="col-sm-2">
                                <%--<input type="text" class="form-control form-control-sm " id="txtCGST" placeholder="0.00" onchange="MasterCalculation()">--%>

                                <input type="text" class="form-control form-control-sm disableValue" id="txtstrCGST" value="0" placeholder="0.00">
                            </div>
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Total SGST : </label>
                            <div class="col-sm-2">

                                <input type="text" class="form-control form-control-sm disableValue" id="txtstrSGST" value="0" placeholder="0.00">
                            </div>

                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Total IGST : </label>
                            <div class="col-sm-2">

                                <input type="text" class="form-control form-control-sm disableValue" id="txtstrIGST" value="0" placeholder="0.00">
                            </div>
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Tax Amount: GST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm disableValue" id="txtGST" placeholder="0.00">
                            </div>
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Total Amount Before Round Off : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm disableValue" id="txtAmountRoundoff" placeholder="0.00">
                            </div>
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Total Amount After Tax : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm disableValue" id="txtAmountafterTax" placeholder="0.00">
                            </div>

                        </div>

                        <a class="btn btn-info mb-2 w-100 " data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Other Details <i class="fa fa-chevron-circle-down" aria-hidden="true"></i>
                        </a>
                        <div class="collapse" id="collapseExample">
                            <h5 class="PnlHeading">Other Details</h5>
                            <div class="form-group row">

                                <label for="colFormLabel" class="col-sm-3 col-form-label ">Reverse Charge: </label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control form-control-sm " id="txtReverseCharge" placeholder="0.00" autocomplete="off">
                                </div>

                                <label for="colFormLabel" class="col-sm-3 col-form-label ">Transportation Mode: </label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control form-control-sm " id="txtTransportationMode" autocomplete="off">
                                </div>

                                <label for="colFormLabel" class="col-sm-3 col-form-label ">Vehicle Number: </label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control form-control-sm " id="txtVehicleNumber" autocomplete="off">
                                </div>


                                <label for="colFormLabel" class="col-sm-3 col-form-label ">Date of Supply: </label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control form-control-sm " id="txtDateofSupply" autocomplete="off">
                                </div>

                                <label for="colFormLabel" class="col-sm-3 col-form-label ">Place of Supply: </label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control form-control-sm " id="txtPlaceofSupply" autocomplete="off">
                                </div>

                            </div>
                            <h5 class="PnlHeading">Details of Consignee | Shipped to :</h5>
                            <div class="form-group row">

                                <div class="col-md-4">
                                    <label for="txtFullName">Name : </label>
                                    <input type="text" class="form-control text form-control-sm" id="txtConsigneeName" autocomplete="off">
                                </div>
                                <div class="col-md-4">
                                    <label for="txtFullName">GST No : </label>
                                    <input type="text" class="form-control text form-control-sm " id="txtConsigneeGST" autocomplete="off">
                                </div>
                                <div class="col-md-4">

                                    <label for="cmdConsigneeState">State :</label>
                                    <select id="cmdConsigneeState" class="form-control form-control-sm" name="cmdConsigneeState">
                                    </select>

                                </div>
                                <div class="col-md-12">
                                    <label for="txtFullName">Address : </label>
                                    <input type="text" class="form-control text form-control-sm" id="txtConsigneeAddress" autocomplete="off">
                                </div>

                            </div>

                        </div>

                        <div class="form-row">
                            <div class="col-md-12 mb-1 text-right">
                                <button id="btnPrint" type="submit" class="btn btn-primary"><i class="fa fa-print mr-1" aria-hidden="true"></i>Print Invoice</button>
                                <button id="btnSaveInvoice" type="reset" class="btn btn-secondary"><i class="fa fa-close mr-1" aria-hidden="true" onclick="ClearProductTable()"></i>Clear Invoice</button>

                            </div>

                        </div>

                        <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
                    </form>

                </div>

            </div>

        </div>

        <div class="container">
        </div>
    </div>
    <%-- <button id="btnTest" class="mb-4" onclick="SaveOtherInvoiceDetials(1)">Test</button>
    <button id="btnReport" type="submit">Report</button>--%>
    <%--<button id="btnTest" class="mb-4" onclick="SetVisbileControl()">Test</button>--%>

    <%--<button id="btnCalculateTax" class="mb-4">CalculateText</button>--%>
    <script>

        var UserID = <% if(Session["UserID"]!=null){ Response.Write(Session["UserID"].ToString());  } %>;
        var StateName = '<% if(Session["StateName"]!=null){ Response.Write(Session["StateName"].ToString());  } %>'; 
        var DefaultState = '<% if(Session["DefaultValue"]!=null){ Response.Write(Session["DefaultValue"].ToString());  } %>'; 

    </script>
    <script src="../assets/js/Invoicing.js"></script>


</asp:Content>
