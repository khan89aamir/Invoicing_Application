<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Invoicing_Application.Webs.MyProfile" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h5 {
            background-color: #f7f7f7;
            border-radius: 6px;
            padding: 5px;
        }
    </style>
    <br />
    <div class="container">
        <div class="container d-flex justify-content-start">
            <div class="card border-info" style="width: 100%">
                <div class="card-header">
                    <h5>My Profile</h5>
                </div>
                <div class="card-body">
                    <form id="frmMyProfile" class="needs-validation" novalidate runat="server">
                        <div class="form-row">
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="txtCompanyName">Company Name : </label>
                                    <input type="text" class="form-control text " id="txtCompanyName" placeholder="Please Enter Company Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Company Name.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="txtOwnerName">Owner Name : </label>
                                    <input type="text" class="form-control text " id="txtOwnerName" placeholder="Please Enter Owner Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Owner Name.
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="form-row">
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="txtEmail">E-Mail: </label>
                                    <input type="text" class="form-control text " id="txtEmail" placeholder="Enter Email Address" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Email Address.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="txtPassword">Password : </label>
                                    <input type="password" class="form-control text " id="txtPassword" placeholder="Enter Password">
                                    <%--required--%>
                                    <%--<div class="invalid-feedback text-left">
                                        Please Enter Password.
                                    </div>--%>
                                </div>

                            </div>

                        </div>
                        <div class="form-row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="txtAddress">Address : </label>
                                    <textarea runat="server" rows="4" class="form-control text" id="txtAddress" placeholder="Enter Address" required></textarea>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Address.
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="form-row">
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="cmdState">State :</label>
                                    <asp:DropDownList ID="cmdState" class="custom-select" name="cmdState" runat="server" required="true">
                                    </asp:DropDownList>

                                    <div class="invalid-feedback">
                                        Please Select State.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="txtGSTNo">GST No. : </label>
                                    <input type="text" class="form-control text " id="txtGSTNo" placeholder="Enter GST No" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter GST No.
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="txtMobileNo">Mobile No. : </label>
                                    <input type="text" class="form-control text " id="txtMobileNo" placeholder="Enter Mobile No" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Mobile No.
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="txtTNC">Term and Condition : </label>
                                    <textarea runat="server" rows="4" class="form-control text" id="txtTNC" placeholder="Enter Term and Condition" required></textarea>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Term and Condition.
                                    </div>
                                </div>

                            </div>

                        </div>

                        <hr />
                        <h5>Bank Details :</h5>
                        <div class="form-row">

                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtBankName">Bank Name : </label>
                                    <input type="text" class="form-control text " id="txtBankName" placeholder="Enter Bank Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Bank Name.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtAccountNo">Account No : </label>
                                    <input type="text" class="form-control text " id="txtAccountNo" placeholder="Enter Account No" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Account No.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtIFSCCode">IFSC Code : </label>
                                    <input type="text" class="form-control text " id="txtIFSCCode" placeholder="Enter IFSC Code" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter IFSC Code.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtBranchName">Branch: </label>
                                    <input type="text" class="form-control text " id="txtBranchName" placeholder="Enter Branch Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Branch Name.
                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="form-row">
                            <div class="col-md-12  text-right">
                                <button id="btnSave" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o mr-1" aria-hidden="true"></i>Save</button>
                                <button id="btnCancel" type="reset" class="btn btn-secondary" onclick="return confirm_reset();"><i class="fa fa-times mr-1" aria-hidden="true"></i>Cancel</button>

                            </div>

                        </div>

                    </form>

                </div>

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
                            if (form.id == "frmMyProfile") {
                                // dont submit the form which is default behav
                                event.preventDefault();
                                event.stopPropagation();

                                $.ManageMyProfile();
                            }
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        $(document).ready(function () {

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

            $.GetMyProfile();

            //var currentRow = $(this).closest("tr");
            //var data = $('#example').DataTable().data();
            //console.log('ready '+data);
            //varStateID = (data['StateID']);
            //varOwnerName = (data['OwnerName']);

            //$('#txtCustomerName').val(varOwnerName);
            //$('#txtCompanyName').val(varCompanyName);
            //$('#txtGSTNo').val(varGSTNo);
            //$('#txtEmail').val(varEmailID);
            //$('#txtAddress').val(varAddress);
            //$('#cmdState').val(varStateID)
            //$('#txtCustomerID').val(varCustomerID);
        });

        $.ManageMyProfile = function () {

            //  let post_url = $("#frmaccount").attr("action"); //get form action url
            // let request_method = $("#frmaccount").attr("method"); //get form GET/POST method
            // let form_data = $("#frmaccount").serialize(); //Encode form elements for submission	

            // My Profile Details
            var ownername = $('#txtOwnerName').val();
            var companyname = $('#txtCompanyName').val();
            var password = $('#txtPassword').val();
            var gstno = $('#txtGSTNo').val();
            var mobileno = $('#txtMobileNo').val();
            var email = $('#txtEmail').val();
            var stateid = $('#cmdState').val();
            var address = $('#txtAddress').val();
            var tnc = $('#txtTNC').val();
            var varUserID = <%= Session["UserID"] %>;

            // Bank Details
            var bankname = $('#txtBankName').val();
            var accountno = $('#txtAccountNo').val();
            var ifsccode = $('#txtIFSCCode').val();
            var branchname = $('#txtBranchName').val();

            // Create an object:
            var ProfileData = {
                UserID: varUserID
                , OwnerName: ownername, CompanyName: companyname, GSTNo: gstno, EmailID: email
                , Address: address, StateID: stateid, Password: password, MobileNo: mobileno, TNC: tnc//, UserID: varUserID
                , BankName: bankname, AccountNo: accountno, IFSCCode: ifsccode, BranchName: branchname
            };
            //alert(JSON.stringify(ProfileData));

            $.ajax({
                url: "../Service/Invoicing_Service.asmx/ManageMyProfile",
                type: 'POST',
                data: JSON.stringify(ProfileData),
                contentType: "application/json",
                dataType: "json",
                beforeSend: function () {
                    $('#lblLoadingtxt').text("Saving Profile Details please wait....");
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

                        $('#frmMyProfile').trigger("reset");

                        $.GetMyProfile();
                        //$('#example').DataTable().ajax.reload(null, false);
                        // after reset remove the class else it will show validtion message.
                        let jsContactForm = document.getElementById('frmMyProfile');// <===
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

        $.GetMyProfile = function () {

            var varUserID = <%= Session["UserID"] %>;
            UserIDData = { UserID: varUserID };
            $.ajax({
                url: "../Service/Invoicing_Service.asmx/GetMyProfile",
                type: 'POST',
                data: JSON.stringify(UserIDData),
                contentType: "application/json",
                dataType: "json",
                success: function (responseData) {

                    //alert("success : " + responseData.Table[0].Address);
                    //My profile details
                    $('#txtOwnerName').val(responseData.Table[0].OwnerName);
                    $('#txtCompanyName').val(responseData.Table[0].CompanyName);
                    $('#txtEmail').val(responseData.Table[0].EmailID);
                    $('#txtAddress').val(responseData.Table[0].Address);
                    $('#cmdState').val(responseData.Table[0].StateID);
                    $('#txtMobileNo').val(responseData.Table[0].MobileNo);
                    $('#txtGSTNo').val(responseData.Table[0].GSTNo);
                    $('#txtTNC').val(responseData.Table[0].TermCondition);

                    //Bank Details
                    $('#txtBankName').val(responseData.Table1[0].BankName);
                    $('#txtAccountNo').val(responseData.Table1[0].AccountNo);
                    $('#txtIFSCCode').val(responseData.Table1[0].IFSC_Code);
                    $('#txtBranchName').val(responseData.Table1[0].Branch);
                },
                error: function (xhr, status, error) {
                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                    console.log("Error Text: " + xhr.responseText);
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