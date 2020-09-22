<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Invoicing.aspx.cs" Inherits="Invoicing_Application.Webs.Invoicing" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script src="../assets/js/select2.js"></script>
    <link href="../assets/css/select2.css" rel="stylesheet" />
    <script src="../assets/js/mindmup-editabletable.js"></script>
    <script src="../assets/js/fnFindCellRowIndexes.js"></script>
    <style>
        h5 {
            background-color: #f7f7f7;
            border-radius: 6px;
            padding: 5px;
        }

        .disableValue {
            pointer-events: none;
        }
    </style>

    <br />
    <div class="container">
        <div class="container d-flex justify-content-start">
            <div class="card border-info" style="width: 100%">
                <div class="card-header">
                    <h5>Invoice </h5>
                </div>
                <div class="card-body">
                    <form id="frmInvoice" class="needs-validation" novalidate runat="server">

                        <h5>Invoice Header</h5>
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
                                    <asp:DropDownList ID="cmdState" class="custom-select" name="cmdState" runat="server" required="true">
                                    </asp:DropDownList>

                                    <div class="invalid-feedback">
                                        Please select your product.
                                    </div>


                                </div>
                            </div>
                        </div>
                        <hr />
                        <h5>Bill to  Party</h5>
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
                                    <a href="Customer.aspx" target="_blank"><i class="fa fa-plus mr-1" aria-hidden="true"></i>Add New Customer</a>
                                    <br />
                                    <a id="lnkRefresh" href="#" target="_blank"><i class="fa fa-refresh mr-1" aria-hidden="true"></i>Refresh</a>
                                   
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="form-group">
                                    <input type="text" class="form-control text " autocomplete="off" id="txtPartyStateID" name="txtPartyStateID" placeholder="Enter GST Number" hidden>

                                    <label for="txtFullName">GST No </label>
                                    <input type="text" class="form-control text " autocomplete="off" id="txtGSTNo" name="txtGSTNo" placeholder="Enter GST Number" >

                                    <div class="invalid-feedback text-left">
                                        Please Enter GST No
                                    </div>
                                </div>

                            </div>

                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">State </label>
                                    <input type="text" class="form-control text " id="txtPartyState" name="txtPartyState" autocomplete="off" placeholder="Enter Your State" >
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
                                    <input type="text" class="form-control text " id="txtAddress" name="txtAddress" autocomplete="off" placeholder="Enter Address" >
                                    <div class="invalid-feedback text-left">
                                        Please Enter Address 
                                    </div>
                                </div>

                            </div>


                        </div>

                        <hr />
                        <h5>Product Details</h5>
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
                        </div>

                        <div class="form-row">

                            <div class="col-md-3">
                                <input type="text" class="form-control text " id="txtProductID" name="txtProductID" hidden>
                                <div class="form-group">
                                    <label for="txtFullName">Product Name </label>
                                    <input type="text" class="form-control text disableValue " id="txtProductName" name="txtProductName" autocomplete="off" placeholder="Enter Product Name" >
                                    <div class="invalid-feedback text-left">
                                        Please Enter Product Name
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">QTY </label>
                                    <input type="number" class="form-control text  " id="txtQTY" onchange="OnQTYChange()" name="txtQTY" >
                                    <div class="invalid-feedback text-left">
                                        Please Enter QTY
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Rate </label>
                                    <input type="text" class="form-control text disableValue" id="txtRate" name="txtRate" placeholder="0.00">
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

                            <input type="text" class="form-control text disableValue " id="txtSKUNumber" name="txtSKUNumber" placeholder="0.00" hidden>
                            <input type="text" class="form-control text disableValue" id="txtHSN_No" name="txtHSN_No" placeholder="0.00" hidden>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-2  text-right">
                                <button id="btnAddProduct" type="button" class="btn btn-primary"><i class="fa fa-plus mr-1" aria-hidden="true"></i>Add Item</button>
                                <button id="btnCancel" type="button" formnovalidate="formnovalidate" class="btn btn-secondary"><i class="fa fa-times mr-1" aria-hidden="true"></i>Cancel</button>


                            </div>

                        </div>

                        <div class="row">
                            <div class="col-12">
                                <table id="tblProduct" class="table table-hover table-responsive-md" style="width: 100%">
                                    <thead>

                                        <tr>
                                            <th>ProductID</th>
                                            <th>SKU_No</th>
                                            <th>Product_Name</th>
                                            <th>HSN_No</th>
                                            <th>QTY</th>
                                            <th>Rate</th>
                                            <th>Total</th>
                                            <th>Delete</th>
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
                            <label for="colFormLabel" class="col-sm-3 col-form-label  ">Add: CGST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm " id="txtCGST" placeholder="0.00" onchange="MasterCalculation()">
                            </div>
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Add: SGST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm" id="txtSGST" placeholder="0.00" onchange="MasterCalculation()">
                            </div>

                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Add: IGST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm" id="txtIGST" placeholder="0.00" onchange="MasterCalculation()">
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
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Total Amount After Tax : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm disableValue" id="txtAmountafterTax" placeholder="0.00">
                            </div>


                        </div>


                        <a class="btn btn-info mb-2 w-100 " data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Other Details <i class="fa fa-chevron-circle-down" aria-hidden="true"></i>
                        </a>
                        <div class="collapse" id="collapseExample">
                            <h5>Other Details</h5>
                            <div class="form-group row">

                                <label for="colFormLabel" class="col-sm-3 col-form-label ">Reverse Charge: </label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control form-control-sm " id="txtReverseCharge" placeholder="0.00">
                                </div>

                                <label for="colFormLabel" class="col-sm-3 col-form-label ">Transportation Mode: </label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control form-control-sm " id="txtTransportationMode">
                                </div>

                                <label for="colFormLabel" class="col-sm-3 col-form-label ">Vehicle Number: </label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control form-control-sm " id="txtVehicleNumber">
                                </div>


                                <label for="colFormLabel" class="col-sm-3 col-form-label ">Date of Supply: </label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control form-control-sm " id="txtDateofSupply">
                                </div>


                            </div>
                            <h5>Details of Consignee | Shipped to :</h5>
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
                                <button id="btnSaveInvoice" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o mr-1" aria-hidden="true"></i>Save Invoice</button>

                            </div>

                        </div>

                        <asp:Button ID="Button1" runat="server" Text="Button" />


                    </form>


                </div>

            </div>

        </div>

        <div class="container">
        </div>
    </div>
    <button id="btnTest" class="mb-4" onclick="SaveOtherInvoiceDetials(1)">Test</button>
    <button id="btnReport" type="submit">Report</button>
    <script>

        // for manual validtion
        function CustomValidation() {

            var result = false;


            var custValue = $("#cmbCustomer").val();
            var ProductValue = $("#cmbProduct").val();
            var SKUValue = $("#cmbSKU").val();

            //console.log(custValue);
            //console.log(ProductValue);
            //console.log(SKUValue);

            if (custValue==null) {
                $("#cmbCustomer").addClass("is-invalid");

                result = false;
            }
            else {
                $("#cmbCustomer").removeClass("is-invalid");
                $("#cmbCustomer").addClass("is-valid")
                result = true;
            }


            if (ProductValue ==null && SKUValue==null) {
                $("#cmbProduct").addClass("is-invalid");
                result = false;
            }
            else {
                $("#cmbProduct").removeClass("is-invalid");
                $("#cmbProduct").addClass("is-valid")
                result = true;
            }
           // console.log(result);
           
            return result; 
        }

        function PostSalesInvoiceMaster() {

            var ObjInvoiceMaster = {

                parmSaleInvoiceID: $("#txtInvoiceID").val(),
                parmInvoiceNumber: $("#txtInvoiceNumber").val(),
                parmInvoiceDate: $("#datepicker").val(),
                parmStateID: $("#cmdState").val(),
                parmPartyID: $("#cmbCustomer").val(),
                parmTotalAmtBeforeTax: $("#txtAmountBeforeTax").val(),
                parmDiscountAmount: $("#txtDiscountAmt").val(),
                parmIGST: $("#txtIGST").val(),
                parmCGST: $("#txtCGST").val(),
                parmSGST: $("#txtSGST").val(),
                parmGST: $("#txtGST").val(),
                parmAmountAfterGST: $("#txtAmountafterTax").val(),
                parmCreatedBy: <%= Session["UserID"] %>,
                parmModifiedBy: <%= Session["UserID"] %>
 
            }


            //alert(JSON.stringify(ObjInvoiceMaster))

            $.ajax({
                url: "../Service/Invoicing_Service.asmx/InsertUpdateSaleInvoiceMaster",
                type: 'POST',
                data: JSON.stringify(ObjInvoiceMaster),
                contentType: "application/json",
                dataType: "json",
                beforeSend: function () {


                    $('#lblLoadingtxt').text("Creating Invoice Please wait....");
                    $('#loadingBox').modal('show');
                },
                complete: function () {

                    //$('#loadingBox').modal('hide');
                 // dont hide here as we have many other chain methods to call
                },

                success: function (responseData) {

                    // parse it to java script object so that you can access property
                    // data = $.parseJSON(responseData.d);

                    if (responseData.Result) {


                        $('#lblLoadingtxt').text("Invoice header saved..");


                        // get the auto Invoice ID which is generated
                        var InvoiceID = responseData.Value;
                        


                        // post the product details in another request
                        PostSalesInvioceDetails(InvoiceID);

                    }
                    else {

                        $('#lblMessage').text(responseData.strMessage);

                        $('#iconMsg').removeClass('fa-check-circle').addClass('fa-times-circle');

                        $('#iconMsg').css('color', 'red');
                        $('#mdlNormalMessage').modal('show');
                    }
                },
                error: function (xhr, status, error) {

                    $('#loadingBox').modal('hide');
                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            }).done(function (response) { //

                // alert("Done : " + response);
            });

        }

        function PostSalesInvioceDetails(InvoiceID) {

            var lstSalesDetails = new Array();

            //Loop through the Table rows and build a JSON array.
            $("#tblProduct TBODY TR").each(function () {
                var row = $(this);

                var objSales = {};
                var temp = $('#tblProduct').DataTable().row(row).data();

                objSales.ProductID = temp[0];
                objSales.SKU_Code = temp[1];
                objSales.HSN_NO = temp[3];
                objSales.QTY = temp[4];
                objSales.Rate = temp[5];
                objSales.Total = temp[6];
                
                objSales.InvID = InvoiceID;


                lstSalesDetails.push(objSales);
            });

            //alert(JSON.stringify(lstSalesDetails));

            $.ajax({
                url: "../Service/Invoicing_Service.asmx/InsertUpdateSalesDetails",
                type: 'POST',
                data: { PostedData: JSON.stringify(lstSalesDetails) },

                dataType: "json",
                beforeSend: function () {

                    $('#lblLoadingtxt').text("Saving product details...");
                   // $('#loadingBox').modal('show');
                },
                complete: function () {

                    //$('#loadingBox').modal('hide');
                },

                success: function (responseData) {

                    // parse it to java script object so that you can access property
                    // data = $.parseJSON(responseData.d);

                    if (responseData.Result) {

                      //  $('#loadingBox').modal('hide');

                        $('#lblLoadingtxt').text("Product Details saved.");

                      //  $('#lblMessage').text(responseData.strMessage);

                      //  $('#mdlNormalMessage').modal('show');



                        // save other invoice details
                        SaveOtherInvoiceDetials(InvoiceID);

                     
                     
                    }
                    else {

                        $('#lblMessage').text(responseData.strMessage);

                        $('#iconMsg').removeClass('fa-check-circle').addClass('fa-times-circle');

                        $('#iconMsg').css('color', 'red');
                        $('#mdlNormalMessage').modal('show');
                    }
                },
                error: function (xhr, status, error) {

                    $('#loadingBox').modal('hide');
                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            }).done(function (response) { //

                // alert("Done : " + response);
            });
        }

        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                           
                            event.preventDefault();
                            event.stopPropagation();
                            CustomValidation();
                            form.classList.add('was-validated');
                        }
                        else {

                            // perform custom validtion
                            if (CustomValidation()) {
                              
                                event.preventDefault();
                                event.stopPropagation();


                                PostSalesInvoiceMaster();
                            }
                           
                        }
                      
                    }, false);
                });
            }, false);
        })();

        function SaveOtherInvoiceDetials(InvoiceID) {


            var flag = false;

            // if any of the following fields are set then go ahead and save the data.
            if (document.getElementById("txtReverseCharge").value != "") {
                flag = true;
            }

            if (document.getElementById("txtTransportationMode").value != "") {
                flag = true;
            }


            if (document.getElementById("txtDateofSupply").value != "") {
                flag = true;
            }

            if (document.getElementById("txtConsigneeName").value != "") {
                flag = true;
            }


            if (document.getElementById("txtConsigneeGST").value != "") {
                flag = true;
            }

            console.log("cmdConsigneeState :"+document.getElementById("cmdConsigneeState").value);

            if (document.getElementById("cmdConsigneeState").value != "-1") {
                flag = true;
            }


            if (flag){
                var ReverseCharge = $("#txtReverseCharge").val();
                var TransportationMode = $("#txtTransportationMode").val();
                var VehicleNumber = $("#txtVehicleNumber").val();
                var DateofSupply = $("#txtDateofSupply").val();
                var ConsigneeName = $("#txtConsigneeName").val();
                var ConsigneeGST = $("#txtConsigneeGST").val();
                var ConsigneeState = $("#cmdConsigneeState").val();
                var ConsigneeAddress = $("#txtConsigneeAddress").val();


                var ObjOtherInvoiceData = {
                    parmInvoiceID: InvoiceID,
                    parmReverseCharge: ReverseCharge,
                    parmTransportation_Mode: TransportationMode,
                    parmVehicle_Number: VehicleNumber,
                    parmConsignee_Name: ConsigneeName,
                    parmConsignee_GST: ConsigneeGST,
                    parmConsignee_StateID: ConsigneeState,
                    parmConsignee_Address: ConsigneeAddress,
                    parmSupplyDate: DateofSupply,
                    parmConsignee_PAN: "NA"
                };


                alert(JSON.stringify(ObjOtherInvoiceData));

                $.ajax({
                    url: "../Service/Invoicing_Service.asmx/SaveOtherInfoiceDetails",
                    type: 'POST',
                    data: JSON.stringify(ObjOtherInvoiceData),
                    contentType: "application/json",
                    dataType: "json",
                    beforeSend: function () {


                        $('#lblLoadingtxt').text("Saving Other details....");
                      
                    },
                    complete: function () {


                        $('#loadingBox').modal('hide');
                    },

                    success: function (responseData) {


                        // parse it to java script object so that you can access property
                        // data = $.parseJSON(responseData.d);

                        if (responseData.Result) {

                            $('#loadingBox').modal('hide');

                            $('#lblMessage').text("Invoice have been created successfully.");

                            $('#mdlNormalMessage').modal('show');

                            $('#frmInvoice').trigger("reset");
                            // after reset remove the class else it will show validtion message.
                            let jsContactForm = document.getElementById('frmInvoice');                   // <=== 
                            jsContactForm.classList.remove('was-validated');  

                            // clear the data table
                            $('#tblProduct').DataTable().clear().draw();

                            window.location.href = "../Report/Report_Pages/Invoice_Report.aspx";

                        }
                        else {

                            $('#lblMessage').text(responseData.strMessage);

                            $('#iconMsg').removeClass('fa-check-circle').addClass('fa-times-circle');

                            $('#iconMsg').css('color', 'red');
                            $('#mdlNormalMessage').modal('show');


                        }


                    },
                    error: function (xhr, status, error) {

                        $('#loadingBox').modal('hide');
                        alert("Error : " + error);
                        alert("Error Text: " + xhr.responseText);


                    },
                    failure: function (r) {
                        alert("Fail:" + r.responseText);
                    }
                }).done(function (response) { //

                    // alert("Done : " + response);
                });
            }
            else {

                $('#loadingBox').modal('hide');

                $('#lblMessage').text("Invoice have been created successfully.");

                $('#mdlNormalMessage').modal('show');

                $('#frmInvoice').trigger("reset");
                // after reset remove the class else it will show validtion message.
                let jsContactForm = document.getElementById('frmInvoice');                   // <=== 
                jsContactForm.classList.remove('was-validated');  

                window.location.href = "../Report/Report_Pages/Invoice_Report.aspx";
            }



        }



        $(function () {
            $("#datepicker").datepicker();
            $("#txtDateofSupply").datepicker();
        });

        $("#lnkRefresh").click(function () {
            event.preventDefault();
            BindCustomer();
            alert("customer loaded");

        });

        $("#btnCancel").click(function () {

            $("#txtProductName").val("");
            $("#txtQTY").val("");
            $("#txtRate").val("");
            $("#txtProductID").val("");
            $("#txtTotal").val("");

        });

        // add new row to the list.
        $("#btnAddProduct").click(function () {

            var PName = $("#txtProductName").val();
            var PQTY = $("#txtQTY").val();
            var PRate = $("#txtRate").val();
            var PTotal = $("#txtTotal").val();
            var PID = $("#txtProductID").val();
            var SKUNumber = $("#txtSKUNumber").val();
            var HSN_No = $("#txtHSN_No").val();

            // if product ID already exists
            var rowId = $('#tblProduct').dataTable().fnFindCellRowIndexes(PID, 0);

            if (rowId == '') {

                // add new record

                $('#tblProduct').DataTable().row.add([
                    PID,
                    SKUNumber,
                    PName,
                    HSN_No,
                    PQTY,
                    PRate,
                    PTotal,
                    "<a class='lnkDelete btn btn btn-primary btn-sm' href='" + PID + "'>Delete</a>"
                ]).draw(false);

                DoBillCalculation(PTotal);
            }
            else {
                // update the exsting row

                // if item exist then get its row.
                var temp = $('#tblProduct').DataTable().row(rowId).data();

                // get the column value (QTY)
                var ExistingQTY = temp[2];


                // add the qty
                var NewQTY = parseInt(ExistingQTY) + parseInt(PQTY);

                var Total = parseFloat(parseFloat(PRate) * parseFloat(NewQTY)).toFixed(2);

                // update the new QTY
                temp[2] = NewQTY;
                temp[4] = Total;


                // add the row back to table
                $('#tblProduct').DataTable().row(rowId).data(temp).invalidate();
                DoBillCalculation(PTotal);

            }

            // QTY Column is Editable only , rest of the columns are read only . this is done inside js file.
            $('#tblProduct').editableTableWidget();

            // very important event, the QTY gets changed this fires..
            $(".lnkChange").change(function () {

                // get the Total amount value before you delete
                var temp = $('#tblProduct').DataTable().row(RowNumber).data();


                // access the currently change QTY like this
                // Dont get it from DataTable as its not upate there on change.
                var QTY = $(this).val();

                // you can get the rate from data table.
                var rate = temp[5];

                var Totalamt = QTY * rate;

                temp[6] = Number(Totalamt).toFixed(2);

                //   var rowId = $(this).parent().parent().children().index($(this).parent());

                // add the row back to table
                $('#tblProduct').DataTable().row(RowNumber).data(temp).invalidate();

                DoBillCalculation(Totalamt);

            });


            HideProductIDColumn();
        });


        function HideProductIDColumn() {
            //var header = 1;
            //var colno = 0;
            //// Hide column as well as header
            //$('#tblProduct th:nth-child(' + header + ')').hide();
            //$('#tblProduct td:nth-child(' + colno + ')').hide();
        }
        function DoBillCalculation(currAmount) {

            var SubTotal = 0;

            $("#tblProduct TBODY TR").each(function () {
                var row = $(this);

                // get the Total amount value before you delete
                var temp = $('#tblProduct').DataTable().row(row).data();

                // get the total amount of current row
                var amtTotal = temp[6];

                // alert("Tot : " + amtTotal);

                SubTotal = parseFloat(SubTotal) + parseFloat(amtTotal);

            });


            var NewTotal = parseFloat(SubTotal).toFixed(2);
            $('#txtAmountBeforeTax').val(NewTotal);

            MasterCalculation();

        }

        function MasterCalculation() {

            // calculate the percent first 
            //txtAmountBeforeTax---txtDiscountAmt

            var Percent = $('#txtDiscountAmt').val().replace("%", "");

            var numVal1 = Number(document.getElementById("txtAmountBeforeTax").value);
            var numVal2 = Number(Percent) / 100;
            var totalValue = numVal1 - (numVal1 * numVal2)

            // Sum ALL GST values

            var TotalGSTAmount = Number(document.getElementById("txtCGST").value) +
                Number(document.getElementById("txtSGST").value) +
                Number(document.getElementById("txtIGST").value);

            // show total GST
            document.getElementById("txtGST").value = Number(TotalGSTAmount).toFixed(2);

            var GrandTotal = totalValue + TotalGSTAmount;

            document.getElementById("txtAmountafterTax").value = Number(GrandTotal).toFixed(2);
        }

        function CalculateDiscount() {

            var numVal1 = Number(document.getElementById("txtAmountBeforeTax").value);
            var numVal2 = Number(Percent) / 100;
            var totalValue = numVal1 - (numVal1 * numVal2)

            document.getElementById("txtAmountafterTax").value = totalValue.toFixed(2);

            $('#txtDiscountAmt').val(Percent + "%");
        }

        function OnDiscountFocus() {

            var Percent = $('#txtDiscountAmt').val().replace("%", "");
            $('#txtDiscountAmt').val(Percent);

        }
        var RowNumber = 0;
        // attaching event on table , then on link ( to be pricese)
        $("#tblProduct").on("click", ".lnkDelete", function () {

            event.preventDefault(); // <---------you may want this to stop the link

            // get the Total amount value before you delete
            var temp = $('#tblProduct').DataTable().row($(this).parents('tr')).data();

            var TotaAmount = temp[4]

            var CurrentTotalAmt = $("#txtAmountBeforeTax").val();

            var NewTotal = parseFloat(parseFloat(CurrentTotalAmt) - parseFloat(TotaAmount)).toFixed(2);

            $("#txtAmountBeforeTax").val(NewTotal);

            MasterCalculation();

            // get the column value (QTY)
            var ExistingQTY = temp[2];
            $('#tblProduct').DataTable().row($(this).parents('tr'))
                .remove()
                .draw();

            // if row count is zero then make everything zero
            var length = $('#tblProduct').DataTable().page.info().recordsTotal;
            if (length == 0) {
                $('#txtDiscountAmt').val("");
                $('#txtCGST').val("");
                $('#txtSGST').val("");
                $('#txtGST').val("");
                $('#txtIGST').val("");
                $('#txttxtAmountafterTaxIGST').val("");
            }

            return false; // <---------or this if you want to prevent bubbling as well
        });

        // attaching event on table , then on link ( to be pricese)
        // fire the event when QTY Changes
        $("#tblProduct").on("click", "td", function () {

            var col = $(this).parent().children().index($(this));

            RowNumber = $(this).parent().parent().children().index($(this).parent());
        });

        function OnQTYChange() {

            var QTY = $("#txtQTY").val();
            var Rate = $("#txtRate").val();
            var Total = parseFloat(parseFloat(Rate) * parseFloat(QTY)).toFixed(2);
            $("#txtTotal").val(Total);
        }
        function GetSelectedTextValue(ddlFruits) {
            var selectedText = ddlFruits.options[ddlFruits.selectedIndex].innerHTML;
            var selectedValue = ddlFruits.value;

            alert("Selected Text: " + selectedText + " Value: " + selectedValue);
        }

        // selected event changed
        $("#cmbCustomer").change(function () {
            var selectedText = $(this).find("option:selected").text();
            var selectedValue = $(this).val();

            GetSelectedCustomer(selectedValue);
            //alert("Selected Text: " + selectedText + " Value: " + selectedValue);
        });

        $("#cmbProduct, #cmbSKU").change(function () {
            var selectedText = $(this).find("option:selected").text();
            var selectedValue = $(this).val();

            GetSelectedProduct(selectedValue);
            //alert("Selected Text: " + selectedText + " Value: " + selectedValue);
        });

        $(document).ready(function () {   // dynamic Table

            var table = $('#tblProduct').DataTable({
                responsive: true,
                fixedHeader: true,
                "paging": false,
                searching: false,
                "ordering": false,
                stateSave: true,
                responsive: true

            });

            // dont hide the column if you are gona use it as Auto ID
            table.column(0).visible(false);

            BindCustomer();
            BindProducts();
            BindSKUCode();
            // drop down------
            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/BindState",
                dataType: "json",
                //data: JSON.stringify(ObjMyData),
                contentType: "application/json",
                success: function (res) {

                    $("#cmdState").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select State'));
                    $.each(res, function (data, value) {

                        $("#cmdState").append($("<option></option>").val(value.StateID).html(value.StateName));
                    })

                    // set the deafult state from session
                    var DefaultState = '<%  Response.Write(Session["DefaultValue"].ToString()); %>';

                    $("#cmdState").val(DefaultState)

                    $("#cmdState").prop("disabled", true);


                    // Bind consignee state

                    $("#cmdConsigneeState").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select State'));
                    $.each(res, function (data, value) {

                        $("#cmdConsigneeState").append($("<option></option>").val(value.StateID).html(value.StateName));
                    })






                },
                error: function (xhr, status, error) {

                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            });

            HideProductIDColumn();


        });


        function BindCustomer() {

            // drop down------
            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/BindCustomer",
                dataType: "json",
                //data: JSON.stringify(ObjMyData),
                contentType: "application/json",
                success: function (res) {

                    $("#cmbCustomer").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select Customer'));
                    $.each(res, function (data, value) {

                        $("#cmbCustomer").append($("<option></option>").val(value.CustomerID).html(value.CustomerName));
                    })

                    // set the deafult state from session
                    // Initialize select2
                    $("#cmbCustomer").select2();

                },
                error: function (xhr, status, error) {

                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            });
        }

        function BindProducts() {

            // drop down------
            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/BindProduct",
                dataType: "json",
                //data: JSON.stringify(ObjMyData),
                contentType: "application/json",
                success: function (res) {

                    $("#cmbProduct").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select SKU'));
                    $.each(res, function (data, value) {

                        $("#cmbProduct").append($("<option></option>").val(value.SKUID).html(value.SKUName));
                    })

                    // set the deafult state from session
                    // Initialize select2 : this makes auto popupate
                    $("#cmbProduct").select2();

                },
                error: function (xhr, status, error) {

                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            });
        }
        function BindSKUCode() {

            // drop down------
            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/BINDSKU_Code",
                dataType: "json",
                //data: JSON.stringify(ObjMyData),
                contentType: "application/json",
                success: function (res) {

                    $("#cmbSKU").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select SKU'));
                    $.each(res, function (data, value) {

                        $("#cmbSKU").append($("<option></option>").val(value.SKUID).html(value.SKUName));
                    })

                    // set the deafult state from session
                    // Initialize select2
                    $("#cmbSKU").select2();

                },
                error: function (xhr, status, error) {

                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            });
        }

        function GetSelectedCustomer(custID) {

            var objData = { CustomerID: custID };
            // drop down------
            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/GetSelectedCustomer",
                dataType: "json",
                data: JSON.stringify(objData),
                contentType: "application/json",
                success: function (res) {

                    // single row would come

                    $("#txtPartyState").val(res[0].StateName);
                    $("#txtAddress").val(res[0].Address);
                    $("#txtGSTNo").val(res[0].GSTNo);
                    $("#txtPartyStateID").val(res[0].StateID);
                },
                error: function (xhr, status, error) {

                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            });
        }

        function GetSelectedProduct(PID) {

            var objData = { ProductID: PID };
            // drop down------
            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/GetSelectedProduct",
                dataType: "json",
                data: JSON.stringify(objData),
                contentType: "application/json",
                success: function (res) {

                    // single row would come

                    $("#txtProductName").val(res[0].SKUName);
                    $("#txtQTY").val("1");
                    $("#txtRate").val(res[0].Rate);
                    $("#txtProductID").val(res[0].SKUID);

                    $("#txtTotal").val(res[0].Rate);

                    $("#txtSKUNumber").val(res[0].SKUNumber);
                    $("#txtHSN_No").val(res[0].HSN_No);


                },
                error: function (xhr, status, error) {

                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            });
        }



    </script>
</asp:Content>
