<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Invoicing_Application.Webs.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
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

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtSkuName">SKU Name : </label>

                                <input type="text" runat="server" class="form-control text" id="txtSkuName" placeholder="Enter SKU Name" required>
                                <div class="invalid-feedback text-left">
                                    Enter SKU Name.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtEmail">Rate : </label>
                                <input runat="server" type="text" class="form-control" id="txtRate" name="Rate" placeholder="Enter Rate" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Rate.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">

                                <label for="txtMobile">Description : </label>
                                <textarea runat="server" class="form-control" id="txtDescription" name="Description" placeholder="Enter Description" required></textarea>
                                <div class="invalid-feedback text-left">
                                    Please Enter Description.
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
        <h5>SKU List</h5>
        <div class="row">
            <div class="col-12">
                <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                    <thead>

                        <tr>
                            <th>Select</th>
                            <th>SKUID</th>
                            <th>SKU Name</th>
                            <th>Rate</th>
                            <th>Description</th>
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
                            if (form.id == "frmSKU") {
                                // dont submit the form which is default behav
                                event.preventDefault();
                                event.stopPropagation();

                               SaveProductDetails();
                            }
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        function SaveProductDetails() {
            $.ManageProducts();
        }

        $.ManageAccount = function () {


            //  let post_url = $("#frmaccount").attr("action"); //get form action url
            // let request_method = $("#frmaccount").attr("method"); //get form GET/POST method
            // let form_data = $("#frmaccount").serialize(); //Encode form elements for submission	



            var SkuName = $('#txtSkuName').val();
            var Rate = $('#txtRate').val();
            var description = $('#txtDescription').val();
            var productid = $('#txtProductID').val();

            // Create an object:
            var ProductData = { SKUName: SkuName, Rate: Rate, Description: description, ProudctID: productid };
            alert(JSON.stringify(ProductData));

            $.ajax({
                url: "../Service/Sales_Invoicing.asmx/ManageProducts",
                type: 'POST',
                data: JSON.stringify(ProductData),
                contentType: "application/json",
                dataType: "json",
                beforeSend: function () {
                    $('#lblLoadingtxt').text("Creating SKU Details please wait....");
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

                        $('#frmaccount').trigger("reset");

                        // after reset remove the class else it will show validtion message.
                        let jsContactForm = document.getElementById('frmSKU');                   // <=== 
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

        </script>

</asp:Content>