<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="PaymentInfo.aspx.cs" Inherits="Invoicing_Application.Webs.PaymentInfo" %>

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
                    <input type="text" runat="server" class="form-control text" id="txtCustomerID" value="0" hidden>
                    <div class="form-row">
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="txtCustomerName">Customer Name </label>
                                <input type="text" class="form-control text " id="txtCustomerName" placeholder="Enter Customer Name">
                                <div class="invalid-feedback text-left">
                                    Please Enter Customer Name.
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="txtInvoiceNo">Invoice No </label>
                                <input type="text" class="form-control text " id="txtInvoiceNo" placeholder="Enter Invoice No." required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Invoice No.
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="cmdInvoiceStatus">Option :</label>
                                <select id="cmdInvoiceStatus" class="custom-select">
                                    <option selected='selected' disabled='disabled'>Please Select</option>
                                    <option>Paid Invoice</option>
                                    <option>UnPaid Invoice</option>
                                    <option>All Invoice</option>

                                </select>
                                <div class="invalid-feedback">
                                    Please select your product.
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="form-row">
                        <div class="col-md-12 mb-2  text-right">
                            <button id="btnSearch" type="submit" class="btn btn-primary"><i class="fa fa-search mr-1" aria-hidden="true"></i>Search</button>
                            <button id="btnCancel" type="reset" class="btn btn-secondary" onclick="return confirm_reset();">Cancel</button>

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
                    { 'data': 'CustomerID' },
                    { 'data': 'CustomerName' },
                    { 'data': 'CompanyName' },
                    { 'data': 'GSTNo' },
                    { 'data': 'EmailID' },
                    { 'data': 'Address' },
                    { 'data': 'StateID' },
                    { 'data': 'State' }
                ],
            }); // table ends here

    </script>

</asp:Content>
