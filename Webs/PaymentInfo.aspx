<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="PaymentInfo.aspx.cs" Inherits="Invoicing_Application.Webs.PaymentInfo" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../assets/js/select2.js"></script>
    <link href="../assets/css/select2.css" rel="stylesheet" />
    <style>
        h5 {
            background-color: #f7f7f7;
            border-radius: 6px;
            padding: 5px;
        }

    </style>
    <br />

    <div class="container  d-flex justify-content-start">
        <div class="card border-info" style="width: 100%">
            <div class="card-header">
                <h5>Payment Info</h5>
            </div>
            <div class="card-body">
                <h5>Search Filter :</h5>
                <form id="frmPaymentFilter" class="needs-validation" novalidate>
                    <input type="text" runat="server" class="form-control text" id="txtSaleInvoiceID" value="0" hidden>
                    <input type="text" runat="server" class="form-control text" id="txtCustomerID" value="0" hidden>

                    <div class="form-row">
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="cmbCustomer">Customer Name </label>
                                <select id="cmbCustomer" class="custom-select">
                                </select>
                                <div class="invalid-feedback text-left">
                                    Please Enter Customer Name.
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="txtSearchInvoiceNo">Invoice No </label>
                                <input type="text" class="form-control text " id="txtSearchInvoiceNo" placeholder="Enter Invoice No." autocomplete="off" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Invoice No.
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="cmdInvoiceStatus">Invoice Status :</label>
                                <select id="cmdInvoiceStatus" class="custom-select">
                                    <option value="-1" selected='selected' disabled='disabled'>Please Select</option>
                                    <option value="1">Paid Invoice</option>
                                    <option value="0">UnPaid Invoice</option>
                                    <option value="2">All Invoice</option>

                                </select>
                                <div class="invalid-feedback">
                                    Please select Invoice Status.
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="col-md-12 mb-2  text-right">
                            <button id="btnSearch" type="button" class="btn btn-primary"><i class="fa fa-search mr-1" aria-hidden="true"></i>Search</button>
                            <button id="btnCancel" type="reset" class="btn btn-secondary"><i class="fa fa-times mr-1" aria-hidden="true"></i>Cancel</button>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>Select</th>
                                        <th>SaleInvoiceID</th>
                                        <th>Customer Name</th>
                                        <th>Company</th>
                                        <th>Invoice No</th>
                                        <th>Invoice Date</th>
                                        <th>PartyID</th>
                                        <th>Bill Amount</th>
                                        <th>Total Amount Paid</th>
                                        <th>Remaining Amount</th>
                                        <th>Payment Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </div>
    <br />


    <div class="container  d-flex justify-content-start">
        <div class="card border-info" style="width: 100%">
            <a id="collap" class="btn btn-info mb-2 w-100 " data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Payment Details <i class="fa fa-chevron-circle-down" aria-hidden="true"></i>
            </a>
            <div class="collapse" id="collapseExample">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <table id="paymentdetails" class="table table-hover table-responsive-md" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>Sr No.</th>
                                        <th>SaleInvoiceID</th>
                                        <th>CustomerID</th>
                                        <th>Customer Name</th>
                                        <th>Invoice No</th>
                                        <th>Payment Mode</th>
                                        <th>Cheque No</th>
                                        <th>Payment Date</th>
                                        <th>Amount Paid</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br />


    <div id="ptdetail" class="container d-flex justify-content-center">
        <div class="card border-info" style="width: 100%;">
            <div class="card-header">
                <h5>Partial Payment Details</h5>
            </div>
            <div class="card-body">
                <form id="frmPaymentInfo" class="needs-validation" novalidate runat="server">
                    <div class="form-row">

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtInvoiceNo">Invoice Number : </label>
                                <input type="text" runat="server" class="form-control text" id="txtInvoiceNo" disabled tabindex="-1" autocomplete="off">
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtCustomerName">Customer Name : </label>
                                <input type="text" runat="server" class="form-control text" id="txtCustomerName" disabled tabindex="-1" autocomplete="off">
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtCompanyName">Company Name : </label>

                                <input type="text" runat="server" class="form-control text" id="txtCompanyName" disabled tabindex="-1" autocomplete="off">
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">

                                <label for="txtRemaningAmt">Remaining Amt : </label>
                                <input runat="server" type="text" class="form-control" id="txtRemainingAmt" name="txtRemainingAmt" disabled tabindex="-1" autocomplete="off">
                            </div>
                        </div>

                        <div class="col-md-3">

                            <div class="form-group">
                                <label for="cmdPayment">Payment Mode :</label>
                                <select id="cmdPayment" class="form-control">
                                    <option value="-1" selected='selected' disabled='disabled'>Please Select</option>
                                    <option value="0">Cheque</option>
                                    <option value="1">Cash</option>
                                    <option value="2">Net Banking</option>
                                    <option value="3">UPI</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please Select Payment Mode.
                                </div>
                            </div>

                        </div>

                        <div class="col-md-3">
                            <div class="form-group">

                                <label for="txtChequeNo">Cheque No : </label>
                                <input runat="server" type="text" class="form-control" id="txtChequeNo" name="txtChequeNo" placeholder="Enter Cheque No" autocomplete="off" disabled="disabled">
                                <div class="invalid-feedback text-left">
                                    Please Enter Cheque No.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">

                                <label for="dtpTranDate">Transaction Date : </label>
                                <input type="text" class="form-control text " autocomplete="off" id="dtpTranDate" name="dtpTranDate" placeholder="Select Transaction Date" required>
                                <div class="invalid-feedback">
                                    Please Select Transaction Date.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">

                                <label for="txtPayAmount">Pay Amount : </label>
                                <input runat="server" type="text" class="form-control" id="txtPayAmount" name="txtPayAmount" placeholder="Enter Payment Amount" autocomplete="off" required>
                                <div class="invalid-feedback">
                                    Please Enter Payment Amount.
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-row">

                        <div class="col-md-12  text-right">
                            <button id="btnSave" type="submit" class="btn btn-primary" disabled><i class="fa fa-floppy-o mr-1" aria-hidden="true"></i>Save</button>
                            <button id="btnCancel1" type="reset" formnovalidate="formnovalidate" class="btn btn-secondary" onclick="return ClearPartPayment();"><i class="fa fa-times mr-1" aria-hidden="true"></i>Cancel</button>
                        </div>

                    </div>
                </form>
            </div>

        </div>
    </div>
    <br />
    <script>
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

                            cmdPaymentCustomeValidate();

                            event.preventDefault();
                            event.stopPropagation();
                        }
                        else {

                            // if payment form is submited then call the save  method.
                            if (form.id == "frmPaymentInfo") {
                                // dont submit the form which is default behave
                                if (PartPaymentValidate()) {

                                    $.InsertPartPayment();
                                }
                                event.preventDefault();
                                event.stopPropagation();
                            }
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        function ClearPartPayment() {

            $("#txtChequeNo").val("");
            $("#txtPayAmount").val("");
            $("#txtChequeNo").prop("disabled", "disabled");
            return true;
        };

        function ResetSearch() {

            $("#txtInvoiceNo").val("");
            $("#txtCustomerName").val("");
            $("#txtCompanyName").val("");
            $("#txtRemainingAmt").val("");
            $("#txtChequeNo").val("");
            $("#txtPayAmount").val("");
            $("#txtChequeNo").prop("disabled", "disabled");
            return true;
        };

        function cmdPaymentCustomeValidate() {

            var result = false;
            var paymentValue = $('#cmdPayment').val();

            if (paymentValue == -1 || paymentValue == null) {

                $("#cmdPayment").addClass("is-invalid");
                //let jsContactForm = document.getElementById('frmPaymentInfo');
                //jsContactForm.classList.remove('was-validated');
                result = false;
            }
            else {
                $("#cmdPayment").removeClass("is-invalid");
                $("#cmdPayment").addClass("is-valid");
                result = true;
            }
            //console.log('result ' + result);

            return result;
        };
        function PartPaymentValidate() {

            var result = false;
            var varpayamt = $("#txtPayAmount").val();
            var varRemainingamt = $("#txtRemainingAmt").val();

            if (varpayamt > varRemainingamt) {

                //alert('Payment amount cant be greater then actual bill amount');
                $('#lblMessage').text('Payment amount cant be greater then actual bill amount');
                error();
                $('#mdlNormalMessage').modal('show');
                result = false;
            }
            else {
                result = true;
            }
            return result;
        };
        function isNumeric(evt, element) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            //alert('event '+charCode);
            if (
                //(charCode != 45 || $(element).val().indexOf('-') != -1) &&      // “-” CHECK MINUS, AND ONLY ONE.
                (charCode != 46 || $(element).val().indexOf('.') != -1) &&      // “.” CHECK DOT, AND ONLY ONE.
                (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        };

        function isINT(evt, element) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            //alert('event '+charCode);
            if (
                (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        };

        $(function () {
            $("#dtpTranDate").datepicker({
                maxDate: 0
            }).attr('Readonly', 'Readonly');

        });

        function sucess() {
            $('#iconMsg').css('color', 'green');
            $('#iconMsg').removeClass('fa-times-circle').addClass('fa-check-circle');
        };

        function error() {
            $('#iconMsg').removeClass('fa-check-circle').addClass('fa-times-circle');
            $('#iconMsg').css('color', 'red');
        };

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
        };

        $(document).ready(function () {

            $("#txtPayAmount").keypress(function (event) {
                return isNumeric(event, this);
            });

            $("#txtChequeNo").keypress(function (event) {
                return isINT(event, this);
            });

            $('#example').DataTable().columns([1, 6]).visible(false);
            $('#paymentdetails').DataTable().columns([1, 2]).visible(false);

            BindCustomer();
        });

        $("#btnSearch").click(function () {

            $.GetPartPaymentList();

            if ($('#paymentdetails').DataTable() != null) {

                //Destroy the old Datatable
                $('#paymentdetails  ').DataTable().clear().destroy();
                $('#paymentdetails').DataTable().columns([1, 2]).visible(false);
            }
            ResetSearch();
        });

        $("#btnCancel").click(function () {

            $("#select2-cmbCustomer-container").text(varCustomerNameDefault);
        });
        var varInvoiceNo
        $.GetPartPaymentList = function () {

            varInvoiceNo = $('#txtSearchInvoiceNo').val();
            var varSearchCustomerID = $('#cmbCustomer').val();
            var varPaymentStatus = $('#cmdInvoiceStatus').val();

            //alert('varInvoiceNo ' + varInvoiceNo + ' varCustomerName ' + varSearchCustomerID + ' varPaymentStatus ' + varPaymentStatus);
            // clear first
            if ($('#example').DataTable() != null) {

                //Destroy the old Datatable
                $('#example').DataTable().clear().destroy();
            }
            if (varInvoiceNo != "" || varSearchCustomerID != null || varPaymentStatus != null) {

                if (varPaymentStatus == null || varPaymentStatus == 2) {
                    varPaymentStatus = -1;
                }
                if (varSearchCustomerID == null) {
                    varSearchCustomerID = -1;
                }

                var SearchFilterData = { InvoiceNo: varInvoiceNo, CustomerID: varSearchCustomerID, PaymentStatus: varPaymentStatus };

                var table = $('#example').DataTable({
                    fixedHeader: true,
                    processing: true,
                    responsive: true,
                    stateSave: true,
                    aLengthMenu: [
                        [10, 25, 50, 100, 200, -1],
                        [10, 25, 50, 100, 200, "All"]
                    ],
                    ajax: {

                        url: "../Service/Invoicing_Service.asmx/GetPartPaymentList",
                        type: 'POST',
                        //data: { InvoiceNo: varInvoiceNo },
                        data: SearchFilterData,
                        dataType: 'json',
                        beforeSend: function () {

                            $('#lblLoadingtxt').text("Fetching Part Payment List....");
                            $('#loadingBox').modal('show');
                        },
                        complete: function () {

                            $('#loadingBox').modal('hide');
                        },
                        dataSrc: function (d) {
                            return d
                        }
                    },
                    columns: [
                        {
                            data: 'Select',
                            render: function (data, type, row) {

                                return "<a class='lnkSelect btn btn btn-primary' href='" + data + "'>Select</a>";
                            }
                        },
                        { 'data': 'SaleInvoiceID' },
                        { 'data': 'CustomerName' },
                        { 'data': 'CompanyName' },
                        { 'data': 'InvoiceNumber' },
                        { 'data': 'InvoiceDate' },
                        { 'data': 'PartyID' },
                        { 'data': 'AmountAfterGST' },
                        { 'data': 'TotalPaid' },
                        { 'data': 'RemaningAmount' },
                        { 'data': 'PaymentStatus' }
                    ],
                }); // table ends here

                $('#example tbody').on('click', 'tr', function () {

                    if ($(this).hasClass('selected')) {
                        $(this).removeClass('selected');
                    }
                    else {
                        table.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                    }
                });

                //to invisble multipe columns
                table.columns([1, 6]).visible(false);   
            }
            else {
                //alert('Please use any oneof filter..');
                $('#lblMessage').text('Please use any oneof filter..');
                error();
                $('#mdlNormalMessage').modal('show');
            }
        };

        //   attaching event on table , then on link ( to be pricese)
        $("#example").on("click", ".lnkSelect", function () {

            $(document).scrollTop($(document).height() - 100);
            
            event.preventDefault(); // <---------you may want this to stop the link

            // get the link value
            //var addressValue = $(this).attr("href");

            //remove all other selected rows..
            $('#example tr.selected2').removeClass('selected2');

            // set the selected rows.
            $(this).parent().parent().addClass('selected2');

            var currentRow = $(this).closest("tr");
            var data = $('#example').DataTable().row(currentRow).data();

            var varInvoiceNumber = (data['InvoiceNumber']);
            var varCustomerName = (data['CustomerName']);
            var varCompanyName = (data['CompanyName']);
            var varRemainingAmt = (data['RemaningAmount']);
            var varSaleInvoiceID = (data['SaleInvoiceID']);
            var varPaymentStatus = (data['PaymentStatus']);

            $('#txtInvoiceNo').val(varInvoiceNumber);
            $('#txtCustomerName').val(varCustomerName);
            $('#txtCompanyName').val(varCompanyName);
            $('#txtRemainingAmt').val(varRemainingAmt);
            $('#txtSaleInvoiceID').val(varSaleInvoiceID);
            $('#txtCustomerID').val((data['PartyID']));

            if (varPaymentStatus == 'UnPaid') {
                $('#btnSave').prop("disabled", "");
            }
            else {
                $('#btnSave').prop("disabled", "disabled");
            }
            $.GetPartPaymentDetails();

            return false; // <---------or this if you want to prevent bubbling as well
        });

        $.GetPartPaymentDetails = function () {

            varCustomerID = $('#txtCustomerID').val();
            varSaleInvoiceID = $('#txtSaleInvoiceID').val();

            // clear first
            if ($('#paymentdetails').DataTable() != null) {

                //Destroy the old Datatable
                $('#paymentdetails').DataTable().clear().destroy();
            }

            var table = $('#paymentdetails').DataTable({
                fixedHeader: true,
                processing: true,
                responsive: true,
                stateSave: true,
                aLengthMenu: [
                    [10, 25, 50, 100, 200, -1],
                    [10, 25, 50, 100, 200, "All"]
                ],
                ajax: {

                    url: "../Service/Invoicing_Service.asmx/GetPartPaymentDetails",
                    type: 'POST',
                    data: { InvoiceID: varSaleInvoiceID, CustomerID: varCustomerID },
                    //contentType: "application/json",
                    dataType: 'json',
                    beforeSend: function () {

                        $('#lblLoadingtxt').text("Fetching Part Payment Details....");
                        $('#loadingBox').modal('show');
                    },
                    complete: function () {

                        $('#loadingBox').modal('hide');
                    },
                    dataSrc: function (d) {

                        return d
                    }
                },
                columns: [
                    { 'data': 'SRNo' },
                    { 'data': 'SaleInvoiceID' },
                    { 'data': 'CustomerID' },
                    { 'data': 'CustomerName' },
                    { 'data': 'InvoiceNumber' },
                    { 'data': 'PaymentMode' },
                    { 'data': 'ChequeNo' },
                    { 'data': 'PaymentDate' },
                    { 'data': 'PaidAmount' }
                ],
            }); // table ends here

            //to invisble multipe columns
            table.columns([1, 2]).visible(false);
        };

        $.InsertPartPayment = function () {

            varInvoiceNo = $('#txtInvoiceNo').val();
            var TranDate = $('#dtpTranDate').val();
            var cmdpayment = $('#cmdPayment').find("option:selected").text();
            var chequeNo = $('#txtChequeNo').val();
            var payAmount = $('#txtPayAmount').val();
            var saleInvoiceID = $('#txtSaleInvoiceID').val();
            var customerID = $('#txtCustomerID').val();
            var varUserID = <%= Session["UserID"] %>;

            // Create an object:
            var PartPaymentData = {
                InvoiceNo: varInvoiceNo, InvoiceID: saleInvoiceID, CustomerID: customerID, PaymentMode: cmdpayment
                , ChequeNo: chequeNo, TransactionDate: TranDate, PayAmount: payAmount, UserID: varUserID
            };
            //alert(JSON.stringify(PartPaymentData));

            $.ajax({
                url: "../Service/Invoicing_Service.asmx/InsertPartPayment",
                type: 'POST',
                data: JSON.stringify(PartPaymentData),
                contentType: "application/json",
                dataType: "json",
                beforeSend: function () {
                    $('#lblLoadingtxt').text("Saving Partial Payment please wait....");
                    $('#loadingBox').modal('show');
                },
                complete: function () {

                    $('#loadingBox').modal('hide');
                },
                success: function (responseData) {
                    // parse it to java script object so that you can access property
                    // data = $.parseJSON(responseData.d);

                    if (responseData.Result) {

                        $('#loadingBox').modal('hide');

                        $('#lblMessage').text(responseData.strMessage);
                        sucess();
                        $('#mdlNormalMessage').modal('show');

                        $('#frmPaymentInfo').trigger("reset");

                        $('#btnSave').prop("disabled", "disabled");

                        $.GetPartPaymentList();
                        $.GetPartPaymentDetails();
                        // after reset remove the class else it will show validtion message.
                        let jsContactForm = document.getElementById('frmPaymentInfo');// <===
                        jsContactForm.classList.remove('was-validated');
                        //
                    }
                    else {
                        $('#lblMessage').text(responseData.strMessage);
                        //$('#iconMsg').removeClass('fa-check-circle').addClass('fa-times-circle');
                        //$('#iconMsg').css('color', 'red');
                        error();
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
        };
        varCustomerNameDefault = 'Select Customer';
        $("#txtSearchInvoiceNo").focus(function () {
            //this.value = "";
            $("#select2-cmbCustomer-container").text(varCustomerNameDefault);
            $("#cmdInvoiceStatus").val("-1");
        });

        $("#cmdInvoiceStatus").change(function () {
            $("#select2-cmbCustomer-container").text(varCustomerNameDefault);
            $("#txtSearchInvoiceNo").val("");
        });

        $("#cmbCustomer").change(function () {

            $("#txtSearchInvoiceNo").val("");
            $("#cmdInvoiceStatus").val("-1");
        });

        $("#cmdPayment").change(function () {
            var selectedText = $(this).find("option:selected").text();
            var selectedValue = $(this).val();
            //alert("Selected Text: " + selectedText + " Value: " + selectedValue);

            if (selectedText == "Cheque") {
                $("#txtChequeNo").prop("disabled", "");
                $("#txtChequeNo").prop("required", true);
                $("#txtChequeNo").focus();
            }
            else {

                $("#txtChequeNo").prop("disabled", "disabled");
                //$(this).removeClass("is-invalid");
                //$(this).addClass("is-valid");
            }
            $(this).removeClass("is-invalid");
            $(this).addClass("is-valid");
        });

    </script>

</asp:Content>