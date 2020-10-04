<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Invoicing_Application.Webs.Products" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script src="../assets/js/select2.js"></script>
    <link href="../assets/css/select2.css" rel="stylesheet" />
    <script src="../assets/js/mindmup-editabletable.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"

type = "text/javascript"></script>

    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
rel = "Stylesheet" type="text/css" />

    <%--<link href="../assets/css/MasterFormCSS.css" rel="stylesheet" />--%>

    <br />
    <div class="container d-flex justify-content-center">
        <div class="card border-info" style="width: 100%;">
            <div class="card-header">
                <h5>SKU Details</h5>
            </div>
            <div class="card-body">
                <form id="frmSKU" class="needs-validation" novalidate runat="server">

                    <input type="text" runat="server" class="form-control text" id="txtProductID" value="0" hidden>
                    <div class="form-row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtSkuCode">SKU Code : </label>
                                <input type="text" runat="server" class="form-control text" id="txtSkuCode" placeholder="Enter SKU Code" autocomplete="off">
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtSkuName">SKU Name : </label>

                                <input type="text" runat="server" class="form-control text" id="txtSkuName" placeholder="Enter SKU Name" autocomplete="off" required>
                                <div class="invalid-feedback text-left">
                                    Enter SKU Name.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">

                                <label for="txtRate">Rate : </label>
                                <input runat="server" type="text" class="form-control" id="txtRate" name="Rate" placeholder="Enter Rate" autocomplete="off" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Rate.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="cmbHSNCode">HSN Code </label>
                                <select id="cmbHSNCode" class="custom-select">
                                </select>
                                <div class="invalid-feedback text-left">
                                    Please Select HSN Code.
                                </div>
                            </div>

                        </div>

                        <div class="col-md-8">
                            <div class="form-group">

                                <label for="txtMobile">Description : </label>
                                <textarea runat="server" class="form-control" id="txtDescription" name="Description" placeholder="Enter Description"></textarea>
                                <%--<div class="invalid-feedback text-left">
                                    Please Enter Description.
                                </div>--%>
                            </div>

                        </div>

                    </div>
                    <div class="form-row">

                        <div class="col-md-12  text-right">
                            <button id="btnSave" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o mr-1" aria-hidden="true"></i>Save</button>
                            <button id="btnCancel" type="reset" formnovalidate="formnovalidate" class="btn btn-secondary"><i class="fa fa-times mr-1" aria-hidden="true"></i>Cancel</button>
                        </div>

                    </div>

                </form>

            </div>

        </div>
    </div>


    <hr />

    <div class="container">
        <h5>SKU List</h5>
        <div class="row">
            <div class="col-12">
                <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                    <thead>

                        <tr>
                            <th>Select</th>
                            <th>SKUID</th>
                            <th>SKU Code</th>
                            <th>SKU Name</th>
                            <th>Rate</th>
                            <th>Description</th>
                            <th>HSNID</th>
                            <th>HSN Code</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
    <br />
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

                            cmbHSNCustomeValidate();

                            event.preventDefault();
                            event.stopPropagation();
                        }
                        else {
                            // if SKU form is submited then call the save  method.
                            if (form.id == "frmSKU") {
                                // dont submit the form which is default behav
                                event.preventDefault();
                                event.stopPropagation();

                                if (cmbHSNCustomeValidate()) {
                                    $.ManageProducts();
                                };
                            }
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

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
        }

        function cmbHSNCustomeValidate() {

            var result = false;
            var paymentValue = $('#cmbHSNCode').val();

            if (paymentValue == -1 || paymentValue == null) {

                $("#cmbHSNCode").addClass("is-invalid");
                //let jsContactForm = document.getElementById('frmPaymentInfo');
                //jsContactForm.classList.remove('was-validated');
                result = false;
            }
            else {
                $("#cmbHSNCode").removeClass("is-invalid");
                $("#cmbHSNCode").addClass("is-valid");
                result = true;
            }
            return result;
        };

        function sucess() {
            $('#iconMsg').css('color', 'green');
            $('#iconMsg').removeClass('fa-times-circle').addClass('fa-check-circle');
        };

        function error() {
            $('#iconMsg').removeClass('fa-check-circle').addClass('fa-times-circle');
            $('#iconMsg').css('color', 'red');
        };

        function BindHSNCode() {

            $("#cmbHSNCode").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select HSN Code'));
            $("#cmbHSNCode").select2();
            // drop down------
            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/BindHSNCode",
                dataType: "json",
                contentType: "application/json",
                success: function (res) {

                    //$("#cmbHSNCode").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select HSN Code'));
                    $.each(res, function (data, value) {

                        $("#cmbHSNCode").append($("<option></option>").val(value.HSNID).html(value.HSNCode));
                    })

                    // set the deafult state from session
                    // Initialize select2
                    //$("#cmbHSNCode").select2();

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

            $("#txtRate").keypress(function (event) {
                return isNumeric(event, this);
            });

            BindHSNCode();
            $.GetSKUDetails();
        });

            $.ManageProducts = function () {

                //  let post_url = $("#frmaccount").attr("action"); //get form action url
                // let request_method = $("#frmaccount").attr("method"); //get form GET/POST method
                // let form_data = $("#frmaccount").serialize(); //Encode form elements for submission	

                var SkuCode = $('#txtSkuCode').val();
                var SkuName = $('#txtSkuName').val();
                var Rate = $('#txtRate').val();
                var description = $('#txtDescription').val();
                var productid = $('#txtProductID').val();
                var hsnid = $('#cmbHSNCode').val();
                var varUserID = <%= Session["UserID"] %>;

                // Create an object:
                var ProductData = {
                    SKUCode: SkuCode, SKUName: SkuName, Rate: Rate, Description: description, ProudctID: productid, HSNID: hsnid, UserID: varUserID
                };
                //alert(JSON.stringify(ProductData));

                $.ajax({
                    url: "../Service/Invoicing_Service.asmx/ManageProducts",
                    type: 'POST',
                    data: JSON.stringify(ProductData),
                    contentType: "application/json",
                    dataType: "json",
                    beforeSend: function () {
                        $('#lblLoadingtxt').text("Saving SKU Details please wait....");
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

                            $('#frmSKU').trigger("reset");

                            //$('#example').DataTable().ajax.reload(null, false);// getting invalid json request on server

                            $.GetSKUDetails();

                            // after reset remove the class else it will show validtion message.
                            let jsContactForm = document.getElementById('frmSKU');                   // <=== 
                            jsContactForm.classList.remove('was-validated');
                            //
                        }
                        else {
                            $('#lblMessage').text(responseData.strMessage);
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


        $.GetSKUDetails = function () {

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

                    url: "../Service/Invoicing_Service.asmx/GetSKUDetails",
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
                    { 'data': 'SKUID' },
                    { 'data': 'SKUCode' },
                    { 'data': 'SKUName' },
                    { 'data': 'Rate' },
                    { 'data': 'Description' },
                    { 'data': 'HSNID' },
                    { 'data': 'HSNCode' },
                    {
                        data: 'Delete',
                        render: function (data, type, row) {

                            return "<a class='lnkDelete btn btn btn-primary' href='" + data + "'>Delete</a>";
                        }
                    }
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

            table.columns([1,6]).visible(false);
        };

        //   attaching event on table , then on link ( to be pricese)
        $("#example").on("click", ".lnkSelect", function () {

            event.preventDefault(); // <---------you may want this to stop the link

            // get the link value
            //var addressValue = $(this).attr("href");

            //remove all other selected rows..
            $('#example tr.selected2').removeClass('selected2');

            // set the selected rows.
            $(this).parent().parent().addClass('selected2');

            var varSKUID = $(this).attr("href");

            // SKUName column
            //var varSKUName = $(this).parent().parent().find("TD").eq(2).text();

            // Rate Colmn
            //var varRate = $(this).parent().parent().find("TD").eq(3).text();

            // Description Colmn
            //var varDescription = $(this).parent().parent().find("TD").eq(4).text();

            var currentRow = $(this).closest("tr");
            var data = $('#example').DataTable().row(currentRow).data();

            var varSKUCode = (data['SKUCode']);
            var varSKUName = (data['SKUName']);
            var varRate = (data['Rate']);
            var varDescription = (data['Description']);
            var varHSNID = (data['HSNID']);
            var varHSNCode = (data['HSNCode']);

            if (varHSNID==null) {
                varHSNID = -1;
            };
            $('#txtSkuCode').val(varSKUCode);
            $('#txtSkuName').val(varSKUName);
            $('#txtRate').val(varRate);
            $('#txtDescription').val(varDescription);
            $('#txtProductID').val(varSKUID);
            $('#cmbHSNCode').val(varHSNID);
            $('#select2-cmbHSNCode-container').text(varHSNCode);
            
            return false; // <---------or this if you want to prevent bubbling as well
        });

        $.DeletedSKU = function (id) {
            $.ajax({
                url: "../Service/Invoicing_Service.asmx/DeleteSKU",
                type: 'POST',
                data: { SKUID: id },
                dataType: 'json',

                success: function (responseData) {

                    if (responseData.Result) {
                        // alert("Result : " + responseData.strMessage);
                        $('#frmSKU').trigger("reset");

                        //$('#example').DataTable().ajax.reload(null, false); // getting invalid json request on server

                        $.GetSKUDetails();
                    }
                    else {
                        alert("Failed Result : " + responseData.strMessage);
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            }).done(function (response) { //

                //alert("Done : " + response);
            });
        };

        var deletedID = 0;
        // attaching event on table , then on link ( to be pricese)
        $("#example").on("click", ".lnkDelete", function () {

            event.preventDefault(); // <---------you may want this to stop the link

            $('#spanConfirmMsg').text("Are you sure , you want to delete?");
            $('#confirmationModel').modal('show');

            var addressValue = $(this).attr("href");
            deletedID = addressValue;

            return false; // <---------or this if you want to prevent bubbling as well
        });

        // confrimed to delete
        $('#btnConfirm').click(function () {

            $.DeletedSKU(deletedID);

            $('#confirmationModel').modal('hide');
        });

    </script>

</asp:Content>