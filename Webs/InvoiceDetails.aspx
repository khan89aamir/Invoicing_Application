<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="InvoiceDetails.aspx.cs" Inherits="Invoicing_Application.Webs.InvoiceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
        <div class="container d-flex justify-content-start">
            <div class="card border-info" style="width: 100%">
                <div class="card-header">
                    <h5>Invoice Details</h5>
                </div>
                <div class="card-body">
                    <div class="form-row">
                        <div class="col-sm-4">
                            <div class="form-group">

                                <label for="txtMail">From Date: </label>
                                <input type="text" class="form-control text" autocomplete="off" id="dtpFromDate" required>
                                <div class="invalid-feedback text-left">
                                    Enter Invoice Date
                                </div>

                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">

                                <label for="txtMail">To Date: </label>
                                <input type="text" class="form-control text" autocomplete="off" id="dtpToDate" required>
                                <div class="invalid-feedback text-left">
                                    Enter Invoice Date
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-8 text-right">
                            <button id="btnSave" type="submit" class="btn btn-primary"><i class="fa fa-search mr-1" aria-hidden="true"></i>Search</button>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-12">
                            <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                                <thead>

                                    <tr>
                                        <th>Select</th>
                                        <th>Invoice No</th>
                                        <th>Invoice Date</th>
                                        <th>Customer Name</th>
                                        <th>Total QTY</th>
                                        <th>Total Amount</th>
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

    </div>

    <script>
        $(function () {
            $("#dtpFromDate").datepicker();
            $("#dtpToDate").datepicker();
        });
    </script>
</asp:Content>
