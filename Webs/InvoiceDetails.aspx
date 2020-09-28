<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="InvoiceDetails.aspx.cs" Inherits="Invoicing_Application.Webs.InvoiceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <%--    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="table2excel.js" type="text/javascript"></script>--%>

<%--<script type="text/javascript" src="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"></script>--%>
<%--<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/css/buttons.dataTables.min.css"></script>--%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>

    <div class="container">
        <div class="container d-flex justify-content-start">
            <div class="card border-info" style="width: 100%">
                <div class="card-header">
                    <h5>Invoice Details</h5>
                </div>
                <div class="card-body">
                    <form id="frmInvdetails" class="needs-validation" novalidate runat="server">
                        <div class="form-row">
                            <div class="col-sm-4">
                                <div class="form-group">

                                    <label for="txtMail">From Date: </label>
                                    <input type="text" class="form-control text" autocomplete="off" id="dtpFromDate" required>
                                    <div class="invalid-feedback text-left">
                                        Select Invoice From Date
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">

                                    <label for="txtMail">To Date: </label>
                                    <input type="text" class="form-control text" autocomplete="off" id="dtpToDate" required>
                                    <div class="invalid-feedback text-left">
                                        Select Invoice To Date
                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm-8 text-right">
                                <button id="btnSearch" type="submit" class="btn btn-primary"><i class="fa fa-search mr-1" aria-hidden="true"></i>Search</button>

                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-12">
                                <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                                    <thead>

                                        <tr>
                                            <th>Select</th>
                                            <th>SaleInvoiceID</th>
                                            <th>Invoice No</th>
                                            <th>Invoice Date</th>
                                            <th>Customer Name</th>
                                            <th>Total QTY</th>
                                            <th>Total Amount</th>
                                            <th>Delete</th>
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

    </div>
    <br />
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
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        else {
                            // if SKU form is submited then call the save  method.
                            if (form.id == "frmInvdetails") {
                                // dont submit the form which is default behav
                                event.preventDefault();
                                event.stopPropagation();

                                $.GetInvoiceDetails();
                                
                            }
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        $.GetInvoiceDetails = function () {

            var vardtpFromDate = $('#dtpFromDate').val();
            var vardtpToDate = $('#dtpToDate').val();

            var SearchFilterData = { FromDate: vardtpFromDate, ToDate: vardtpToDate };

            if ($('#example').DataTable() != null) {

                //Destroy the old Datatable
                $('#example').DataTable().clear().destroy();
            }

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

                    url: "../Service/Invoicing_Service.asmx/GetInvoiceDetails",
                    type: 'POST',
                    data: SearchFilterData,
                    dataType: 'json',
                    beforeSend: function () {

                        $('#lblLoadingtxt').text("Fetching Invoice Details....");
                        $('#loadingBox').modal('show');
                    },
                    complete: function () {

                        $('#loadingBox').modal('hide');
                    },
                    dataSrc: function (d) {

                        //var blob = new Blob([d.data], { type: 'data:application/vnd.ms-excel' }); 
                        //var downloadUrl = URL.createObjectURL(blob);
                        //var a = document.createElement("a");
                        //a.href = downloadUrl;
                        //a.download = "downloadFile.xls";
                        //document.body.appendChild(a);
                        //a.click();

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
                    { 'data': 'InvoiceNumber' },
                    { 'data': 'InvoiceDate' },
                    { 'data': 'CustomerName' },
                    { 'data': 'TotalQTY' },
                    { 'data': 'Total Amount' },
                    {
                        data: 'Delete',
                        render: function (data, type, row) {

                            return "<a class='lnkDelete btn btn btn-primary' href='" + data + "'>Delete</a>";
                        }
                    }
                ],

                dom: 'Bfrtip',
                buttons: [
                    //'copyHtml5',
                    'excelHtml5',
                    //'csvHtml5',
                    //'pdfHtml5'
                ]
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
            table.columns([1]).visible(false);

            //var blob = new Blob([table], { type: 'data:application/vnd.ms-excel' }); 
            //var downloadUrl = URL.createObjectURL(blob);
            //var a = document.createElement("a");
            //a.href = downloadUrl;
            //a.download = "downloadFile.xlsx";
            //document.body.appendChild(a);
            //a.click();
        };

        //$("#btnExport").click(function () {
        //    $("#example").table2excel({
        //        filename: "Table.xlsx"
        //    });
        //});

        $(function () {
            $("#dtpFromDate").datepicker({
                maxDate: 0
            });

            $("#dtpToDate").datepicker({
                maxDate: 0
            });
        });

        $("#example").on("click", ".lnkSelect", function () {

            event.preventDefault(); // <---------you may want this to stop the link

            // get the link value
            var addressValue = $(this).attr("href");

            window.location.href = "Invoicing.aspx?InvoiceID=" + addressValue;

            return false; // <---------or this if you want to prevent bubbling as well
        });

        $.DeleteInvoice = function (id) {

            var objData = { InvoiceID: id };

            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/DeleteInvoice",
                dataType: "json",
                data: JSON.stringify(objData),
                contentType: "application/json",
                success: function (res) {

                    $('#lblMessage').text("Invoice have been deleted successfully.");
                    $('#mdlNormalMessage').modal('show');

                    $.GetInvoiceDetails();
                },
                beforeSend: function () {

                    $('#lblLoadingtxt').text("Deleting Invoice....");
                    $('#loadingBox').modal('show');
                },
                complete: function () {

                    $('#loadingBox').modal('hide');
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

        var deletedID = 0;
        $("#example").on("click", ".lnkDelete", function () {

            event.preventDefault(); // <---------you may want this to stop the link

            $('#spanConfirmMsg').text("Are you sure , you want to delete?");
            $('#confirmationModel').modal('show');

            // get the link value
            var addressValue = $(this).attr("href");
            deletedID = addressValue;

            return false; // <---------or this if you want to prevent bubbling as well
        });

        // confrimed to delete
        $('#btnConfirm').click(function () {

            $.DeleteInvoice(deletedID);

            $('#confirmationModel').modal('hide');
        });

    </script>
</asp:Content>