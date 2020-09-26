<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Invoicing_Application.Webs.Home" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center mt-3 d-none">

        <div id="pnlLogin" class="card border-info" style="width: 23rem;">
            <img class="card-img-top" src="../assets/img/Main_Logo.png" alt="Card image cap">

            <div class="card-body">
                <form id="frmaccount"  novalidate runat="server">
                    <input type="text" runat="server" class="form-control text" id="txtAccounID" value="0" hidden>
                    <div class="form-row">
                        <div class="col-md-12">

                            <div class="input-group mb-3">

                                <div class="input-group-prepend">
                                    <span class="fa fa-user fa-2x mt-1" style="color: #007bff"></span>&nbsp;
                                </div>

                                <input type="text" class="form-control text" runat="server" id="txtUserName" placeholder="Enter User Name" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter User Name.
                                </div>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="fa fa-lock fa-2x mt-1" style="color: #007bff"></span>&nbsp;
                                </div>
                                <input type="password" class="form-control" id="txtPassword" runat="server" placeholder="Enter Password" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Password.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">

                        <div class="col-md-12  text-center ">
                            <div id="spnLoading" class="d-none">
                                <div class="spinner-border text-primary " role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>

                            <div id="lblPassMessage" class="text-center d-none" runat="server">
                                <p class="text-danger  ">Incorrect Username or Password.</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">

                        <div class="col-md-12 ">
                            <asp:Button ID="btnLogin" class="btn btn-primary w-100" runat="server" Text="Login" OnClick="btnLogin_Click" />

                        </div>
                    </div>
                </form>
                <br />
                <div class="text-center">
                    <a href="#" class="link" style="color: #06456f" data-toggle="modal" data-target="#exampleModal">Forget Password?</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container text-center">
        <div id="pnlBack" class="d-none">
            <h1><b>Anja Creation</b>  </h1>
            <img src="../assets/img/Main_Logo.png" class="w-50" />
            <h3>Invoice Management Software</h3>
            <h6>Ver : 1.0.0.0</h6>
        </div>


    </div>

    <!-- Forgot password -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Forget Pasword</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="frmForgotPass" class="needs-validation" novalidate>
                        <div class="form-row">
                            <div class="col-md-12">
                                <div class="alert alert-primary" role="alert">
                                    Your password will be sent to this E-Mail ID
                                </div>


                                <label for="txtforgotEmailID">E-Mail ID :</label>
                                <input type="email" class="form-control" id="txtforgotEmailID" value="" placeholder="Enter Email address" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Email address.
                                </div>
                            </div>

                            <div class="col-md-12  text-center ">
                                <div id="pnlforgotpassLoading" class="d-none">
                                    <div class="spinner-border text-primary " role="status">
                                        <span class="sr-only">Loading...</span>
                                    </div>
                                </div>
                                <div id="lblforgotEmailMessage" class="text-left d-none">
                                    <p id="pnlforgotEmailMessage" class="text-danger  ">Incorrect Email Address.</p>
                                </div>
                            </div>
                        </div>
                        <br />
                        <button id="btnforgotemail" class="btn btn-primary" type="submit">Submit</button>
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

                          
                            if (form.id == "frmaccount") {
                                if (DoLogin()) {

                                    alert('ok');
                                }
                                else {
                                    alert('failed');
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                            }
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();


        $(document).ready(function () {

            var sessionValue =  <%

        if (Session["UserID"] != null)
        {
            Response.Write("'True'");
        }
        else
        {
            Response.Write("'False'");
        }
        %>;

            if (sessionValue == "True") {

                // dont show the login window again
                // hide the login panel
                $('#pnlLogin').hide();
                // show back pannel
                $('#pnlBack').removeClass("d-none");
                $('#pnlBack').addClass("d-block");

                $('#pnlProfile').removeClass("d-none");
                $('#pnlProfile').addClass("d-block");
            }
            else {
                $('#pnlLogin').show();
                $('#txtUserName').focus();
                // show back pannel
                $('#pnlBack').removeClass("d-block");
                $('#pnlBack').addClass("d-none");
            }
        });

        function DoLogin() {

            var result = false;  

            var val_user = $('#txtUserName').val();
            var val_pass = $('#txtPassword').val();

            // Create an object:
            var AccountData = {
                UserName: val_user,
                Password: val_pass
            };
            alert(JSON.stringify(AccountData));
            $.ajax({
                url: "../Service/Invoicing_Service.asmx/Login",
                type: 'POST',
                data: JSON.stringify(AccountData),
                contentType: "application/json",
                dataType: "json",
                beforeSend: function () {
                    $('#spnLoading').removeClass("d-none");
                    $('#spnLoading').addClass("d-block");

                },
                complete: function () {

                    $('#spnLoading').removeClass("d-block");
                    $('#spnLoading').addClass("d-none");
                },

                success: function (responseData) {

                    // parse it to java script object so that you can access property
                    // data = $.parseJSON(responseData.d);
                    alert(responseData);
                    if (responseData.Result) {

                       
                        result = true;
                        // set the login session for the user.
                        //SetLoginSession(responseData.Value);
                        // SetLoginSession(responseData);

                        // hide the login panel
                        $('#pnlLogin').hide();

                        // show back pannel
                        $('#pnlBack').removeClass("d-none");
                        $('#pnlBack').addClass("d-block");

                        $('#pnlProfile').removeClass("d-none");
                        $('#pnlProfile').addClass("d-block");

                        $('#frmaccount').trigger("reset");

                        // after reset remove the class else it will show validtion message.
                        let jsContactForm = document.getElementById('frmaccount');                   // <=== 
                        jsContactForm.classList.remove('was-validated');

                    }
                    else {

                      
                        result = false;
                        $('#lblPassMessage').removeClass("d-none");
                        $('#lblPassMessage').addClass("d-block");


                        $('#spnLoading').removeClass("d-block");
                        $('#spnLoading').addClass("d-none");
                    }
                },
                error: function (xhr, status, error) {
                    result = false;
                    $('#loadingBox').modal('hide');
                    alert("* Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    result = false;
                    alert("--Fail:" + r.responseText);
                }
            }).done(function (response) { //

                // alert("Done : " + response);
            });

            return result;
        }



        function SetLoginSession(result) {

            var varUserName = $('#txtUserName').val();
            $('#dropdownMenuButton').html("Login By : " + varUserName);

            var DefaultState = result.Value;
            var varUserID = result.UserID;

            var objData = { UserName: varUserName, DefaulStatetValue: DefaultState, UserID: varUserID };
            // calling asp.net page method [Session should be maintain by page NOT by web service.]
            $.ajax({
                type: "POST",
                url: "../Service/RequestHandler.aspx/SetLoginSession",
                data: JSON.stringify(objData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                },
                error: function (xhr, status, error) {

                    //   alert("Error : " + error);
                    //  alert("Error Text: " + xhr.responseText);

                },
                failure: function (r) {
                    alert("Error : " + r);
                }
            });
        }

        $("#btnforgotemail").click(function () {

            var varforgotEmailID = $('#txtforgotEmailID').val();
            var ForgotEmailData = { ForgotEmailID: varforgotEmailID };
            if (varforgotEmailID != "") {
                $.ajax({
                    url: "../Service/Invoicing_Service.asmx/ForgotEmailIDData",
                    type: 'POST',
                    data: JSON.stringify(ForgotEmailData),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (responseData) {

                        if (responseData.Result) {

                            $('#lblforgotEmailMessage').removeClass("d-block");
                            $('#lblforgotEmailMessage').addClass("d-none");

                            var varforgotpass = responseData.strMessage;
                            $.SendEmail(varforgotEmailID, varforgotpass);
                        }
                        else {

                            $('#lblforgotEmailMessage').removeClass("d-none");
                            $('#lblforgotEmailMessage').addClass("d-block");
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

                    // alert("Done : " + response);
                });
            }
        });

        $.SendEmail = function (emailid, pass) {

            var val_emailid = emailid;
            var val_pass = pass;

            // Create an object:
            var AccountData = {
                ForgotEmailID: val_emailid,
                Password: val_pass
            };

            $.ajax({
                url: "../Service/Invoicing_Service.asmx/SendForgotPass",
                type: 'POST',
                data: JSON.stringify(AccountData),
                contentType: "application/json",
                dataType: "json",
                beforeSend: function () {

                    $('#pnlforgotpassLoading').removeClass("d-none");
                    $('#pnlforgotpassLoading').addClass("d-block");
                },
                complete: function () {

                    $('#pnlforgotpassLoading').removeClass("d-block");
                    $('#pnlforgotpassLoading').addClass("d-none");
                },

                success: function (responseData) {

                    // parse it to java script object so that you can access property
                    // data = $.parseJSON(responseData.d);

                    $('#pnlforgotEmailMessage').html(responseData.strMessage);
                    if (responseData.Result) {

                        $('#lblforgotEmailMessage').removeClass("text-danger d-none");
                        $('#lblforgotEmailMessage').addClass("d-block");

                        $('#frmForgotPass').trigger("reset");

                        // after reset remove the class else it will show validtion message.
                        let jsContactForm = document.getElementById('frmForgotPass');                   // <=== 
                        jsContactForm.classList.remove('was-validated');
                    }
                    else {

                        $('#lblforgotEmailMessage').removeClass("d-none");
                        $('#lblforgotEmailMessage').addClass("text-danger d-block");

                        $('#pnlforgotpassLoading').removeClass("d-block");
                        $('#pnlforgotpassLoading').addClass("d-none");
                    }
                },
                error: function (xhr, status, error) {

                    $('#loadingBox').modal('hide');
                    //alert("Error : " + error);
                    //alert("Error Text: " + xhr.responseText);
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
