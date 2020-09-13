<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Invoicing_Application.Webs.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center mt-3 d-none">

        <div id="pnlLogin" class="card border-info" style="width: 23rem;">
            <img class="card-img-top" src="../assets/img/Main_Logo.png" alt="Card image cap">


            <div class="card-body">

                <form id="frmaccount" class="needs-validation" novalidate runat="server">

                    <input type="text" runat="server" class="form-control text" id="txtAccounID" value="0" hidden>
                    <div class="form-row">
                        <div class="col-md-12">

                            <div class="input-group mb-3">

                                <div class="input-group-prepend">
                                    <span class="fa fa-user fa-2x mt-1" style="color: #007bff"></span>&nbsp;
                                </div>

                                <input type="text" class="form-control text " id="val_UserName" placeholder="Enter User Name" required runat="server">
                                <div class="invalid-feedback text-left">
                                    Please Enter User Name.
                                </div>
                            </div>

                            <div class="input-group mb-3">

                                <div class="input-group-prepend">

                                    <span class="fa fa-lock fa-2x mt-1" style="color: #007bff"></span>&nbsp;
                                </div>
                                <input type="password" class="form-control" id="val_Password" placeholder="Enter Password" required runat="server">
                                <div class="invalid-feedback text-left">
                                    Please Enter Password.
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="form-row">

                        <div class="col-md-12 ">
                            <button id="btnLogin" type="button" class="btn btn-primary w-100">Login</button>


                        </div>

                    </div>

                </form>
                <br />
                <div class="text-center">
                    <a href="Account_Manager.aspx">Forgot Password</a>
                </div>


            </div>

        </div>
    </div>
    <div class="container text-center">
        <div id="pnlBack" class="d-none">
            <h1><b>Anja Creation</b>  </h1>
            <img src="../assets/img/Main_Logo.png" class="w-50" />
            <h3>Invoice Management Software</h3>
            <h4>Ver : 1.0.0.0</h4>
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
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();



        $('#btnLogin').click(function () {
            $('#pnlLogin').hide();
            $('#pnlBack').removeClass("d-none");
            $('#pnlBack').addClass("d-block");


        });
    </script>
</asp:Content>
