﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="InvoiceDetails.aspx.cs" Inherits="Invoicing_Application.Webs.InvoiceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <style>
    .td.details-control {
    background: url('https://datatables.net/dev/accessibility/DataTables_1_10/examples/resources/details_open.png') no-repeat center center;
    cursor: pointer;
}
.tr.shown td.details-control {
    background: url('https://datatables.net/dev/accessibility/DataTables_1_10/examples/resources/details_close.png') no-repeat center center;
}
        </style>
    <%--    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="table2excel.js" type="text/javascript"></script>--%>

    <%--<script type="text/javascript" src="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"></script>--%>
    <%--<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/css/buttons.dataTables.min.css"></script>--%>
    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>--%>
    <script src="../assets/js/jszip.min.js"></script>
    <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" />
    <%--<link href="../assets/css/jquery.dataTables.min.css" rel="stylesheet" />--%>

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

                                    <label for="dtpFromDate">From Date: </label>
                                    <input type="text" class="form-control text" autocomplete="off" id="dtpFromDate" placeholder="Select From Date" required>
                                    <div class="invalid-feedback text-left">
                                        Select Invoice From Date
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">

                                    <label for="dtpToDate">To Date: </label>
                                    <input type="text" class="form-control text" autocomplete="off" id="dtpToDate" placeholder="Select To Date" required>
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
                        <div class="row" id="dvTable">
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
                                            <th>PATHANI SUIT</th>
                                            <th>PATHANI TOP</th>
                                            <th>PATHANI SALWAR</th>
                                            <th>PYJAMA</th>
                                            <th>JAWAHAR BUNDI</th>
                                            <th>SHERWANI</th>
                                            <th>TROUSER</th>
                                            <th>3 PC SUIT</th>
                                            <th>KURTA</th>
                                            <th>DB BLAZER</th>
                                            <th>SAFARI SUIT</th>
                                            <th>2 PC SUIT</th>
                                            <th>VEST JACKET</th>
                                            <th>KURTA PYJAMA</th>
                                            <th>TUXEDO SUIT</th>
                                            <th>JACKET </th>
                                            <th>OVERCOAT</th>
                                            <th>JODHPURI SUIT</th>
                                            <th>CHUDIDAR</th>
                                            <th>DB SUIT</th>
                                            <th>SHIRT</th>
                                            <th>Indowestern</th>
                                            <th>Embroidery</th>
                                            <th>Suiting Fabric</th>
                                            <th>Shirting Fabric</th>
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
                                //$.GetInvoiceDetails_Test();
                            }
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        $(document).ready(function () {

            if ($('#example').DataTable() != null) {
                $('#example').DataTable().columns([1, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]).visible(false);
            }

        });

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

                        //var blob = new Blob([d], { type: 'data:application/vnd.ms-excel' }); 
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
                    { 'data': 'PATHANI SUIT' },
                    { 'data': 'PATHANI TOP' },
                    { 'data': 'PATHANI SALWAR' },
                    { 'data': 'PYJAMA' },
                    { 'data': 'JAWAHAR BUNDI' },
                    { 'data': 'SHERWANI' },
                    { 'data': 'TROUSER' },
                    { 'data': '3 PC SUIT' },
                    { 'data': 'KURTA' },
                    { 'data': 'DB BLAZER' },
                    { 'data': 'SAFARI SUIT' },
                    { 'data': '2 PC SUIT' },
                    { 'data': 'VEST JACKET' },
                    { 'data': 'KURTA PYJAMA' },
                    { 'data': 'TUXEDO SUIT' },
                    { 'data': 'JACKET ' },
                    { 'data': 'OVERCOAT' },
                    { 'data': 'JODHPURI SUIT' },
                    { 'data': 'CHUDIDAR' },
                    { 'data': 'DB SUIT' },
                    { 'data': 'SHIRT' },
                    { 'data': 'Indowestern' },
                    { 'data': 'Embroidery' },
                    { 'data': 'Suiting Fabric' },
                    { 'data': 'Shirting Fabric' },
                    {
                        data: 'Delete',
                        render: function (data, type, row) {

                            return "<a class='lnkDelete btn btn btn-primary' href='" + data + "'>Delete</a>";
                        }
                    }
                ],

                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'csv',//csvHtml
                        title: 'Invoice Details',
                        //footer: false,
                        exportOptions: {
                            columns: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,27,28,29,30,31]
                            //columns: [2, 3,4, 5, 6,':visible'] // data will export all visible column and entered column index
                        }

                    },
                    {
                        extend: 'excel', //excelHtml
                        title: '',//Invoice Details
                        filename: 'Invoice Details',
                        text: '<i class="fa fa-download mr-1" aria-hidden="true"> XLSX</i>',
                        titleAttr: 'Export Excel',
                        //text: 'Download Excel',
                        //autoFilter: true,
                        //footer: false,
                        exportOptions: {
                            modifier: {
                                page: 'all'
                            },
                            columns: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
                            //columns: ':gt(0)', orthogonal: 'export' // data will export all columns except get(0) index
                        },
                        //customize: function (xlsx) {
                        //    var sheet = xlsx.xl.worksheets['sheet1.xml'];
                        //    $('row:first c', sheet).attr('s', '42');
                        //}
                    }
                ]
                //, "bInfo": false,
                //fixedHeader: true,
                //"iDisplayLength": 100,

            }); // table ends here

            $('#example tbody').on('click', 'tr', function () {

                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }

                var tr = $(this).closest('tr');
                var row = table.row(tr);

                if (row.child.isShown()) {
                    row.child.hide();
                    //this.src = "http://i.imgur.com/SD7Dz.png";
                    tr.removeClass('shown');
                }
                else {
                    if (row.data() != undefined) {

                        // Closing previous opened td child
                        table.rows().eq(0).each(function (idx) {

                            var row = table.row(idx);
                            if (row.child.isShown()) {
                                row.child.hide();
                            }
                        });
                        row.child(GetInvoiceDetailsByID(row.data())).show();
                        //row.child(testTable(row.data())).show();
                        tr.addClass('shown');
                        //this.src = "http://i.imgur.com/d4ICC.png";
                    }
                }
            });

            //to invisble multipe columns
            // table.columns([1, 2]).visible(false);
            table.columns([1, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]).visible(false);

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

        function GetInvoiceDetailsByID(rowData) {

            var div = $('<div/>')
                .addClass('loading')
                .text('Loading...');

            $.ajax({
                url: '../Service/Invoicing_Service.asmx/GetInvoiceDetailsByID',
                type: 'POST',
                data: {
                    InvoiceID: rowData.SaleInvoiceID
                },
                dataType: 'json',
                success: function (json) {

                    var test = '<table id="InvoiceDetails" class="details-control table-responsive-md" style="width: 80%"><thead><tr><th>SKU Code</th><th>SKU Name</th><th>HSN Code</th><th>Rate</th><th>QTY</th><th>Total</th></tr></thead><tbody>';
                    var tr = '';
                    for (var i = 0; i < json.length; i++) {
                        tr += '<tr>';
                        tr += '<td>' + json[i].SKUCode + '</td>';
                        tr += '<td>' + json[i].SKUName + '</td>';
                        tr += '<td>' + json[i].HSNCode + '</td>';
                        tr += '<td>' + json[i].Rate + '</td>';
                        tr += '<td>' + json[i].QTY + '</td>';
                        tr += '<td>' + json[i].Total + '</td>';
                    }
                    tr += '</tr></tbody></table>';
                    test += tr;

                    div.html(test).removeClass('loading');
                    
                },
                error: function (xhr, status, error) {
                    div.removeClass('loading').text('Error : ' + error);
                    //alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                }
            });
            return div;
        }
        function testTable(rowData) {

            var table = $('#dtdetail').DataTable({
                fixedHeader: true,
                processing: true,
                responsive: true,
                stateSave: true,
                aLengthMenu: [
                    [10, 25, 50, 100, 200, -1],
                    [10, 25, 50, 100, 200, "All"]
                ],
                ajax: {

                    url: "../Service/Invoicing_Service.asmx/GetInvoiceDetailsByID",
                    type: 'POST',
                    data: {
                        InvoiceID: rowData.SaleInvoiceID
                    },
                    dataType: 'json',
                    beforeSend: function () {

                        $('#lblLoadingtxt').text("Fetching Invoice Details....");
                        $('#loadingBox').modal('show');
                    },
                    complete: function () {

                        $('#dvdetails').addClass('display:block');
                        $('#dvdetails').removeClass('display:none');

                        $('#loadingBox').modal('hide');
                    },
                    dataSrc: function (d) {

                        return d
                    }
                },
                columns: [
                    { 'data': 'SKUCode' },
                    { 'data': 'SKUName' },
                    { 'data': 'HSNCode' },
                    { 'data': 'Rate' },
                    { 'data': 'QTY' },
                    { 'data': 'Total' }
                ],

            }); // table ends here
        };

        $(function () {
            $("#dtpFromDate").datepicker({
                maxDate: 0
            }).attr('readonly', 'readonly');

            $("#dtpToDate").datepicker({
                maxDate: 0
            }).attr('readonly', 'readonly');
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


        $.GetInvoiceDetails_Test = function () {

            var vardtpFromDate = $('#dtpFromDate').val();
            var vardtpToDate = $('#dtpToDate').val();

            var SearchFilterData = { FromDate: vardtpFromDate, ToDate: vardtpToDate };

            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/GetInvoiceDetails",
                dataType: "json",
                data: SearchFilterData,
                //contentType: "application/json",
                success: function (res) {

                    //Create a HTML Table element.
                    var table = $("<table class='table table - hover table - responsive - md' style='width: 100 %' />");
                    table[0].border = "1";
                    
                    var columnCount = res[0];
                    columnCount = Object.keys(columnCount).length;
                    console.log('columnCount ' + Object.keys(columnCount).length);
                    //Add the header row.
                    var row = $(table[0].insertRow(-1));

                    var jsonObject = JSON.stringify(res[0]);
                    console.log('jsonObject ' + jsonObject);
                    //var count = JSON.parse(jsonObject).length;

                    //let a =  res[0] ;
                    //console.log('res ' + Object.keys(a).length);
                    //$.each(res, function (data, value) {

                    //})
                    console.log('res.length ' + res.length);
                    //Add the data rows.
                    //for (var i = 0; i < res.length; i++) {
                    //    row = $(table[0].insertRow(-1));
                    //    for (var j = 0; j < columnCount; j++) {
                    //        var cell = $("<td />");
                    //        cell.html(res[i][j]);
                    //        row.append(cell);
                    //    }
                    //}
                    var result = JSON.parse(jsonObject);
                    row = $(table[0].insertRow(-1));
                    $.each(result, function (k, v) {
                        //display the key and value pair

                        var cell = $("<td />");
                        cell.html(k,v);
                        //cell.html(v);
                        row.append(cell);
                    });

                    var dvTable = $("#dvTable");
                    dvTable.html("");
                    dvTable.append(table);
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

    </script>
</asp:Content>
