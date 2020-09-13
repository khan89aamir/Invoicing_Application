<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Invoicing.aspx.cs" Inherits="Invoicing_Application.Webs.Invoicing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                    <input type="text" class="form-control text " autocomplete="off" id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="form-group">

                                    <label for="txtMail">Invoice Date: </label>
                                    <input type="text" class="form-control text " id="datepicker" required>
                                    <div class="invalid-feedback text-left">
                                        Enter Invoice Date
                                    </div>
                                </div>



                            </div>
                            <div class="col-md-4">
                                <div class="form-row">

                                    <label for="cmbProduct">State :</label>
                                    <asp:DropDownList ID="cmbProduct" class="custom-select" name="cmdProducts" runat="server" required="true">
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

                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <a href="Customer.aspx">Add New Customer</a>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="form-row">

                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">GST No </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">Address </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="txtFullName">State </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
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
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="form-row">

                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Product Name </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">QTY </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Rate </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Total </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Invoice No
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
                                <input type="text" class="form-control" id="colFormLabel" placeholder="">
                            </div>


                        </div>
                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Discount Amount (%) :</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="colFormLabel" placeholder="">
                            </div>


                        </div>
                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Add: CGST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="colFormLabel" placeholder="">
                            </div>


                        </div>
                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Add: SGST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="colFormLabel" placeholder="">
                            </div>


                        </div>

                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Add: IGST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="colFormLabel" placeholder="">
                            </div>


                        </div>


                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Tax Amount: GST : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="colFormLabel" placeholder="">
                            </div>


                        </div>
                        <div class="form-group row">
                            <div class="col-7">
                                <%--        blank col for shifting the content to right--%>
                            </div>
                            <label for="colFormLabel" class="col-sm-3 col-form-label ">Total Amount After Tax : </label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="colFormLabel" placeholder="">
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
    </script>
</asp:Content>
