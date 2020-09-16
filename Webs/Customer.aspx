<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Invoicing_Application.Webs.Customer" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../assets/js/mindmup-editabletable.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>

    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="Stylesheet" type="text/css" />
    
    <link href="../assets/css/MasterFormCSS.css" rel="stylesheet" />

    <br />

    <div class="container d-flex justify-content-start">
        <div class="card border-info" style="width: 100%">
            <div class="card-header">
                <h5>Customer Details</h5>
            </div>
            <div class="card-body">

                <form id="frmCustomer" class="needs-validation" novalidate runat="server">

                    <input type="text" runat="server" class="form-control text" id="txtCustomerID" value="0" hidden>
                    <div class="form-row">

                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtCustomerName">Customer Name : </label>

                                <input type="text" runat="server" class="form-control text" id="txtCustomerName" placeholder="Enter Your Name" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Your Name.
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtCompanyName">Company : </label>

                                <input type="text" runat="server" class="form-control text" id="txtCompanyName" placeholder="Enter Customer's Company Name" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Company Name
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtGSTNo">GST No : </label>

                                <input type="text" runat="server" class="form-control text" id="txtGSTNo" placeholder="Enter GST No" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter GST No
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtEmail">E-Mail : </label>
                                <input runat="server" type="email" class="form-control" id="txtEmail" name="Email" placeholder="Enter Email Address" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Email.
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-row">

                                <label for="cmdState">State :</label>
                                <asp:DropDownList ID="cmdState" class="custom-select" name="cmdState" runat="server" required="true">
                                </asp:DropDownList>

                                <div class="invalid-feedback">
                                    Please Select State.
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtAddress">Address </label>
                                <textarea runat="server" rows="4" class="form-control text" id="txtAddress" placeholder="Enter Address" required></textarea>

                                <div class="invalid-feedback text-left">
                                    Please Enter Address
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

        </div>

    </div>
    <hr />

    <div class="container">
        <h5>Customer List</h5>
        <div class="row">
            <div class="col-12">
                <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                    <thead>

                        <tr>
                            <th>Select</th>
                            <th>Delete</th>
                            <th>CustomerID</th>
                            <th>Name</th>
                            <th>Company</th>
                            <th>GST NO</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>StateID</th>
                            <th>State</th>
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
                            if (form.id == "frmCustomer") {
                                // dont submit the form which is default behav
                                event.preventDefault();
                                event.stopPropagation();

                                SaveCustomerDetails();
                            }
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        $("#btnok").click(function () {
            alert('ok clicked');
        });

        function SaveCustomerDetails() {
            $.ManageCustomers();
            //$('#example').DataTable().ajax.reload(null, false);
        }

        $(document).ready(function () {

            //var ObjMyData = { Age: "27", Gender: "Male" };
            // drop down------
            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/BindState",
                dataType: "json",
                //data: JSON.stringify(ObjMyData),
                contentType: "application/json",
                success: function (res) {
                    $("#cmdState").append($("<option selected='selected' disabled='disabled'></option>").val('').html('Select State'));
                    $.each(res, function (data, value) {

                        $("#cmdState").append($("<option></option>").val(value.StateID).html(value.StateName));
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

            $.GetCustomerDetails();
        });

        $.ManageCustomers = function () {

            //  let post_url = $("#frmaccount").attr("action"); //get form action url
            // let request_method = $("#frmaccount").attr("method"); //get form GET/POST method
            // let form_data = $("#frmaccount").serialize(); //Encode form elements for submission	

            var customername = $('#txtCustomerName').val();
            var companyname = $('#txtCompanyName').val();
            var gstno = $('#txtGSTNo').val();
            var email = $('#txtEmail').val();
            var stateid = $('#cmdState').val();
            var address = $('#txtAddress').val();
            var customerid = $('#txtCustomerID').val();

            // Create an object:
            var CustomerData = {
                CustomerName: customername, CompanyName: companyname, GSTNo: gstno, EmailID: email
                , Address: address, StateID: stateid, CustomerID: customerid
            };
            //alert(JSON.stringify(CustomerData));

            $.ajax({
                url: "../Service/Invoicing_Service.asmx/ManageCustomers",
                type: 'POST',
                data: JSON.stringify(CustomerData),
                contentType: "application/json",
                dataType: "json",
                beforeSend: function () {
                    $('#lblLoadingtxt').text("Saving Customer Details please wait....");
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

                        $('#mdlNormalMessage').modal('show');

                        $('#frmCustomer').trigger("reset");

                        $('#example').DataTable().ajax.reload(null, false);
                        // after reset remove the class else it will show validtion message.
                        let jsContactForm = document.getElementById('frmCustomer');                   // <=== 
                        jsContactForm.classList.remove('was-validated');
                        //
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
        };


        $.GetCustomerDetails = function () {

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

                    url: "../Service/Invoicing_Service.asmx/GetCustomerDetails",
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
                    {
                        data: 'Delete',
                        render: function (data, type, row) {

                            return "<a class='lnkDelete btn btn btn-primary' href='" + data + "'>Delete</a>";
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
            table.columns([2, 8]).visible(false);
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

            // CustomerName column
            var varCustomerName = $(this).parent().parent().find("TD").eq(2).text();

            // CompanyName
            var varCompanyName = $(this).parent().parent().find("TD").eq(3).text();

            // GSTNo Colmn
            var varGSTNo = $(this).parent().parent().find("TD").eq(4).text();
            var varEmailID = $(this).parent().parent().find("TD").eq(5).text();
            var varAddress = $(this).parent().parent().find("TD").eq(6).text();
            //var varStateID = $(this).parent().parent().find("TD").eq(7).text();

            var currentRow = $(this).closest("tr");
            var data = $('#example').DataTable().row(currentRow).data();
            varStateID = (data['StateID']);
            var varCustomerID = (data['CustomerID']);

            $('#txtCustomerName').val(varCustomerName);
            $('#txtCompanyName').val(varCompanyName);
            $('#txtGSTNo').val(varGSTNo);
            $('#txtEmail').val(varEmailID);
            $('#txtAddress').val(varAddress);
            $('#cmdState').val(varStateID)
            $('#txtCustomerID').val(varCustomerID);

            return false; // <---------or this if you want to prevent bubbling as well
        });

        $.DeletedCustomer = function (id) {
            $.ajax({
                url: "../Service/Invoicing_Service.asmx/DeleteCustomer",
                type: 'POST',
                data: { CustomerID: id },
                dataType: 'json',

                success: function (responseData) {

                    if (responseData.Result) {
                        // alert("Result : " + responseData.strMessage);
                        $('#frmCustomer').trigger("reset");

                        $('#example').DataTable().ajax.reload(null, false);
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

            $.DeletedCustomer(deletedID);

            $('#confirmationModel').modal('hide');
        });

        $("#cmdState").change(function () {
            var selectedText = $(this).find("option:selected").text();
            var selectedValue = $(this).val();
            //alert("Selected Text: " + selectedText + " Value: " + selectedValue);
        });

    </script>

</asp:Content>
