<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="HSNMaster.aspx.cs" Inherits="Invoicing_Application.Webs.HSNMaster" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

    <div class="container  d-flex justify-content-start">
        <div class="card border-info" style="width: 100%">
            <div class="card-header">
                <h5>HSN Details</h5>
            </div>
            <div class="card-body">
                <form id="frmHSN" class="needs-validation" novalidate>
                    <input type="text" runat="server" class="form-control text" id="txtHSNID" value="0" hidden>

                    <div class="form-row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtHSNCode">HSN Code </label>
                                <input type="text" id="txtHSNCode" class="form-control text " autocomplete="off" placeholder="Enter HSN Code." required>
                                <div class="invalid-feedback text-left">
                                    Please Enter HSN Code.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="txtHSNDescription">HSN Description </label>
                                <textarea id="txtHSNDescription" class="form-control text " placeholder="Enter HSN Description."></textarea>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtCGST">CGST </label>
                                <input type="text" class="form-control text disableValue " id="txtCGST" autocomplete="off" placeholder="0.00" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter CGST.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtSGST">SGST </label>
                                <input type="text" class="form-control text disableValue " id="txtSGST" autocomplete="off" placeholder="0.00" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter SGST.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtIGST">IGST </label>
                                <input type="text" class="form-control text " id="txtIGST" autocomplete="off" placeholder="Enter IGST." required>
                                <div class="invalid-feedback text-left">
                                    Please Enter IGST.
                                </div>
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

            <div class="container">
                <h5>HSN Code List</h5>
                <div class="row">
                    <div class="col-12">
                        <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Select</th>
                                    <th>HSNID</th>
                                    <th>HSN Code</th>
                                    <th>HSN Description</th>
                                    <th>CGST</th>
                                    <th>SGST</th>
                                    <th>IGST</th>
                                    <th>Delete</th>
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
                            if (form.id == "frmHSN") {
                                // dont submit the form which is default behav
                                event.preventDefault();
                                event.stopPropagation();

                                $.ManageHSNCode();
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

        function sucess() {
            $('#iconMsg').css('color', 'green');
            $('#iconMsg').removeClass('fa-times-circle').addClass('fa-check-circle');
        };

        function error() {
            $('#iconMsg').removeClass('fa-check-circle').addClass('fa-times-circle');
            $('#iconMsg').css('color', 'red');
        };

        $(document).ready(function () {

            $("#txtCGST,#txtSGST,#txtIGST").keypress(function (event) {
                return isNumeric(event, this);
            });

            $("#txtHSNCode").keypress(function (event) {
                return isINT(event, this);
            });

            if ($('#example').DataTable() != null) {
                $('#example').DataTable().columns([1]).visible(false);
            }
            $.GetHSNDetails();
        });

        $("#txtIGST").keyup(function () {

            var igst = $("#txtIGST").val();
            var cgst = (igst / 2).toFixed(2);
            $("#txtCGST").val(cgst);
            $("#txtSGST").val(cgst);
        });

        $.ManageHSNCode = function () {

            //  let post_url = $("#frmaccount").attr("action"); //get form action url
            // let request_method = $("#frmaccount").attr("method"); //get form GET/POST method
            // let form_data = $("#frmaccount").serialize(); //Encode form elements for submission	

            var hsncode = $('#txtHSNCode').val();
            var hsndesc = $('#txtHSNDescription').val();
            var cgst = $('#txtCGST').val();
            var sgst = $('#txtSGST').val();
            var igst = $('#txtIGST').val();
            var hsnid = $('#txtHSNID').val();
            var varUserID = <%= Session["UserID"] %>;

            // Create an object:
            var HSNData = {
                HSNCode: hsncode, HSNDescription: hsndesc, CGST: cgst, SGST: sgst
                , IGST: igst, HSNID: hsnid, UserID: varUserID
            };
            //alert(JSON.stringify(HSNData));

            $.ajax({
                url: "../Service/Invoicing_Service.asmx/ManageHSNCode",
                type: 'POST',
                data: JSON.stringify(HSNData),
                contentType: "application/json",
                dataType: "json",
                beforeSend: function () {
                    $('#lblLoadingtxt').text("Saving HSN Details please wait....");
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

                        $('#frmHSN').trigger("reset");
                        //$('#example').DataTable().ajax.reload(null, false);// getting invalid json request on server

                        $.GetHSNDetails();

                        // after reset remove the class else it will show validtion message.
                        let jsContactForm = document.getElementById('frmHSN');                   // <=== 
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

        $.GetHSNDetails = function () {

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

                    url: "../Service/Invoicing_Service.asmx/GetHSNDetails",
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
                    { 'data': 'HSNID' },
                    { 'data': 'HSNCode' },
                    { 'data': 'HSNDescription' },
                    { 'data': 'CGST' },
                    { 'data': 'SGST' },
                    { 'data': 'IGST' },
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
            table.columns([1]).visible(false);
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

            //var varCustomerID = $(this).attr("href");

            var currentRow = $(this).closest("tr");
            var data = $('#example').DataTable().row(currentRow).data();

            var varHSNCode = (data['HSNCode']);
            var varHSNDescription = (data['HSNDescription']);
            var varCGST = (data['CGST']);
            var varSGST = (data['SGST']);
            var varIGST = (data['IGST']);
            var varHSNID = (data['HSNID']);

            $('#txtHSNCode').val(varHSNCode);
            $('#txtHSNDescription').val(varHSNDescription);
            $('#txtCGST').val(varCGST);
            $('#txtSGST').val(varSGST);
            $('#txtIGST').val(varIGST);
            $('#txtHSNID').val(varHSNID);

            return false; // <---------or this if you want to prevent bubbling as well
        });

        $.DeletedHSNCode = function (id) {
            $.ajax({
                url: "../Service/Invoicing_Service.asmx/DeletedHSNCode",
                type: 'POST',
                data: { HSNID: id },
                dataType: 'json',

                success: function (responseData) {

                    if (responseData.Result) {
                        // alert("Result : " + responseData.strMessage);
                        $('#frmHSN').trigger("reset");

                        //$('#example').DataTable().ajax.reload(null, false); // getting invalid json request on server

                        $.GetHSNDetails();
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

            $.DeletedHSNCode(deletedID);

            $('#confirmationModel').modal('hide');
        });

    </script>
</asp:Content>