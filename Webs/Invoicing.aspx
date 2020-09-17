<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Invoicing.aspx.cs" Inherits="Invoicing_Application.Webs.Invoicing" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     
    <script src="../assets/js/select2.js"></script>
    <link href="../assets/css/select2.css" rel="stylesheet" />

     <style>
        h5 {
            background-color: #f7f7f7;
            border-radius: 6px;
            padding: 5px;
        }
      
    </style>
    
   

    <div class="container">
        <div class="container d-flex justify-content-start">
            <div class="card border-info" style="width: 100%">
                <div class="card-header">
                    <h5>Invoice </h5>
                </div>
                <div class="card-body">
                    <form class="needs-validation" novalidate runat="server">
                        <h5>Invoice Header</h5>
                        <div class="form-row">
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">Invoice No : </label>
                                    <input type="text" class="form-control text " autocomplete="off" id="txtInvoiceNumber" name="txtInvoiceNumber" placeholder="Enter Invoice Number" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="form-group">

                                    <label for="txtMail">Invoice Date: </label>
                                    <input type="text" class="form-control text " autocomplete="off" id="datepicker" name="datepicker" placeholder="Enter Invoice Date" required>
                                    <div class="invalid-feedback text-left">
                                        Enter Invoice Date
                                    </div>
                                </div>



                            </div>
                            <div class="col-md-4">
                                <div class="form-row">

                                    <label for="cmdState">State :</label>
                                    <asp:DropDownList ID="cmdState" class="custom-select" name="cmdState" runat="server" required="true">
                                    </asp:DropDownList>

                                    <div class="invalid-feedback">
                                        Please select your product.
                                    </div>


                                </div>
                            </div>
                        </div>
                        <hr />
                        <h5>Bill to  Party</h5>
                        <div class="form-row">
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">Bill To : </label>
                                    <select id='cmbCustomer'  class="custom-select">
                                        </select>
                                 
                                    <a href="Customer.aspx">Add New Customer</a>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Party Name
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="form-row">

                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">GST No </label>
                                    <input type="text" class="form-control text " autocomplete="off" id="txtGSTNo" name="txtGSTNo" placeholder="Enter GST Number" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter GST No
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">Address </label>
                                    <input type="text" class="form-control text " id="txtAddress" name="txtAddress" autocomplete="off" placeholder="Enter Address" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Address 
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">State </label>
                                    <input type="text" class="form-control text " id="txtPartyState" name="txtPartyState" autocomplete="off" placeholder="Enter Your State" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter State 
                                    </div>
                                </div>

                            </div>

                        </div>




                        <hr />
                        <h5>Product Details</h5>
                        <div class="form-row">
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">Enter SKU : </label>
                                    <input type="text" class="form-control text " id="txtSKU" name="txtSKU" autocomplete="off" placeholder="Enter SKU" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter SKU.
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="form-row">

                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Product Name </label>
                                    <input type="text" class="form-control text " id="txtProductName" name="txtProductName" autocomplete="off" placeholder="Enter Product Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Product Name
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">QTY </label>
                                    <input type="number" class="form-control text " id="txtQTY" name="txtQTY" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter QTY
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Rate </label>
                                    <input type="text" class="form-control text " id="txtRate" name="txtRate" placeholder="Enter Rate" required>
                                    <div class="invalid-feedback text-left">
                                        Rate is missing
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Total </label>
                                    <input type="text" class="form-control text " id="txtTotal" name="txtTotal" autocomplete="off" placeholder="Enter Total Amount" required>
                                    <div class="invalid-feedback text-left">
                                        Total Value Missing
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-2  text-right">
                                <button id="btnSave" type="submit" class="btn btn-primary"><i class="fa fa-plus mr-1" aria-hidden="true"></i>Add Item</button>
                                <button id="btnCancel" type="reset" formnovalidate="formnovalidate" class="btn btn-secondary"><i class="fa fa-times mr-1" aria-hidden="true"></i>Cancel</button>


                            </div>

                        </div>
                    </form>



                    <div class="row">
                        <div class="col-12">
                            <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                                <thead>

                                    <tr>

                                        <th>Select</th>

                                        <th>ProductID</th>
                                        <th>Product Name</th>
                                        <th>QTY</th>
                                        <th>Rate</th>
                                        <th>Total</th>

                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <form class="needs-validation" novalidate>

                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Total Amount Before Tax :</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm" id="txtAmountBeforeTax">
                            </div>


                        </div>
                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Discount Amount (%) :</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm" id="txtDiscountAmt" placeholder="">
                            </div>


                        </div>
                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Add: CGST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm" id="txtCGST" placeholder="">
                            </div>


                        </div>
                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Add: SGST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm" id="txtSGST" placeholder="">
                            </div>


                        </div>

                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Add: IGST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm" id="txtIGST" placeholder="">
                            </div>


                        </div>


                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Tax Amount: GST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm" id="txtGST" placeholder="">
                            </div>


                        </div>
                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Total Amount After Tax : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control form-control-sm" id="txtAmountafterTax" placeholder="">
                            </div>


                        </div>


                    </form>

                    <div class="form-row">
                        <div class="col-md-12  text-right">
                            <button id="btnPrint" type="submit" class="btn btn-primary"><i class="fa fa-print mr-1" aria-hidden="true"></i>Print Invoice</button>
                            <button id="btnSaveInvoice" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o mr-1" aria-hidden="true"></i>Save Invoice</button>
                            <br />
                            <br />
                            <br />



                        </div>

                    </div>
                </div>

            </div>

        </div>

        <div class="container">
        </div>
    </div>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });

        $("#cmdState").change(function () {
            var selectedText = $(this).find("option:selected").text();
            var selectedValue = $(this).val();
            //alert("Selected Text: " + selectedText + " Value: " + selectedValue);
        });

        //$("#txtPartyName").autocomplete({
        //    source: function (request, response) {
        //        $.ajax({
        //            url: "../Service/Invoicing_Service.asmx/GetCustomerAutoPopulate",
        //            data: "{ 'prefix': '" + request.term + "'}",
        //            dataType: "json",
        //            type: "POST",
                    
        //            success: function (data) {

        //                response($.map(data, function (item) {

        //                    return {

        //                        label: item.CustomerName,
        //                        val: item.CustomerID
        //                    }
        //                }))
        //            },
        //            error: function (xhr, status, error) {
        //                alert(error);
        //                alert(xhr.responseText);


        //            },
        //            failure: function (response) {
        //                alert(response.responseText);
        //            }
        //        });
        //    },
        //    select: function (e, i) {
        //        $("#txtPartyName").val(i.item.val);
        //    },
        //    minLength: 1
        //});

        $(document).ready(function () {

            BindCustomer();
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

                    // set the deafult state from session
                    var DefaultState = '<%  Response.Write(Session["DefaultValue"].ToString()); %>';

                    $("#cmdState").val(DefaultState)


                    $("#cmdState").prop("disabled", true);

                },
                error: function (xhr, status, error) {

                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            });

            
        });

        function BindCustomer() {

            // drop down------
            $.ajax({
                type: "POST",
                url: "../Service/Invoicing_Service.asmx/BindCustomer",
                dataType: "json",
                //data: JSON.stringify(ObjMyData),
                contentType: "application/json",
                success: function (res) {

                    $("#cmbCustomer").append($("<option selected='selected' disabled='disabled'></option>").val('').html('Select Customer'));
                    $.each(res, function (data, value) {

                        $("#cmbCustomer").append($("<option></option>").val(value.CustomerID).html(value.CustomerName));
                    })

                    // set the deafult state from session
                    // Initialize select2
                    $("#cmbCustomer").select2();

                },
                error: function (xhr, status, error) {

                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);
                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            });

        }

    </script>
</asp:Content>
