<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="PaymentInfo.aspx.cs" Inherits="Invoicing_Application.Webs.PaymentInfo" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <form id="frmPaymentInfo" class="needs-validation" novalidate runat="server">
                    <input type="text" runat="server" class="form-control text" id="txtSaleInvoiceID" value="0" hidden>
                    <div class="form-row">
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="txtSearchCustomerName">Customer Name </label>
                                <input type="text" class="form-control text " id="txtSearchCustomerName" placeholder="Enter Customer Name">
                                <div class="invalid-feedback text-left">
                                    Please Enter Customer Name.
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="txtSearchInvoiceNo">Invoice No </label>
                                <input type="text" class="form-control text " id="txtSearchInvoiceNo" placeholder="Enter Invoice No." required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Invoice No.
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="cmdInvoiceStatus">Invoice Status :</label>
                                <select id="cmdInvoiceStatus" class="custom-select">
                                    <option selected='selected' disabled='disabled'>Please Select</option>
                                    <option>Paid Invoice</option>
                                    <option>UnPaid Invoice</option>
                                    <option>All Invoice</option>

                                </select>
                                <div class="invalid-feedback">
                                    Please select Invoice Status.
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="form-row">
                        <div class="col-md-12 mb-2  text-right">
                            <button id="btnSearch" type="submit" class="btn btn-primary"><i class="fa fa-search mr-1" aria-hidden="true"></i>Search</button>
                            <button id="btnCancel" type="reset" class="btn btn-secondary" onclick="return confirm_reset();"><i class="fa fa-times mr-1" aria-hidden="true"></i>Cancel</button>

                        </div>

                    </div>


                    <div class="row">
                        <div class="col-12">
                            <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>Select</th>
                                        <th>Customer Name</th>
                                        <th>Company</th>
                                        <th>Invoice No</th>
                                        <th>Invoice Date</th>
                                        <th>Bill Amount</th>
                                        <th>Total Amount Paid</th>
                                        <th>Remaining Amount</th>
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
    <div id="ptdetail" class="container d-flex justify-content-center">
        <div class="card border-info" style="width: 100%;">
            <div class="card-header">
                <h5>Partial Payment Details</h5>
            </div>
            <div class="card-body">

                <div class="form-row">

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtCustomerName">Customer Name : </label>
                            <input type="text" runat="server" class="form-control text" id="txtCustomerName" autocomplete="off">
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtCompanyName">Company Name : </label>

                            <input type="text" runat="server" class="form-control text" id="txtCompanyName" autocomplete="off">
                            
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label for="txtGrandTotal">Grand Total : </label>
                            <input runat="server" type="text" class="form-control" id="txtGrandTotal" name="txtGrandTotal" autocomplete="off">
                            
                        </div>
                    </div>

                </div>
                <div class="form-row">

                    <div class="col-md-12  text-right">
                        <button id="btnSave" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o mr-1" aria-hidden="true"></i>Save</button>
                        <button id="btnCancel1" type="reset" formnovalidate="formnovalidate" class="btn btn-secondary"><i class="fa fa-times mr-1" aria-hidden="true"></i>Cancel</button>
                    </div>

                </div>

            </div>

        </div>
    </div>
    <br/>
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
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        else {
                            // if SKU form is submited then call the save  method.
                            if (form.id == "frmPaymentInfo") {
                                // dont submit the form which is default behav
                                event.preventDefault();
                                event.stopPropagation();

                                $.GetPartPaymentDetails();
                            }
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        $(document).ready(function () {

            //$.GetPartPaymentDetails();
        });

        $.GetPartPaymentDetails = function () {

            //$("#ptdetail").attr('disabled', 'disabled');
            //$("#ptdetail").prop('disabled', true);

            var varInvoiceNo = $('#txtInvoiceNo').val();

            InvoiceData = { InvoiceNo: varInvoiceNo };
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

                    url: "../Service/Invoicing_Service.asmx/GetPartPaymentDetails",
                    type: 'POST',
                    data: JSON.stringify(InvoiceData),
                    contentType: "application/json",
                    dataType: 'json',
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
                    { 'data': 'RemaningAmount' }
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
            // table.columns([1, 2]).visible(false);

            table.columns([1, 6]).visible(false);

            //   attaching event on table , then on link ( to be pricese)
            $("#example").on("click", ".lnkSelect", function () {

                event.preventDefault(); // <---------you may want this to stop the link

                // get the link value
                //var addressValue = $(this).attr("href");

                //remove all other selected rows..
                $('#example tr.selected2').removeClass('selected2');

                // set the selected rows.
                $(this).parent().parent().addClass('selected2');

                var currentRow = $(this).closest("tr");
                var data = $('#example').DataTable().row(currentRow).data();

                var varCustomerName = (data['CustomerName']);
                var varCompanyName = (data['CompanyName']);
                var varGrandTotal = (data['AmountAfterGST']);
                var varSaleInvoiceID = (data['SaleInvoiceID']);

                $('#txtCustomerName').val(varCustomerName);
                $('#txtCompanyName').val(varCompanyName);
                $('#txtGSTNo').val(varGrandTotal);
                $('#txtSaleInvoiceID').val(varSaleInvoiceID);

                return false; // <---------or this if you want to prevent bubbling as well
            });
        };

    </script>

</asp:Content>
