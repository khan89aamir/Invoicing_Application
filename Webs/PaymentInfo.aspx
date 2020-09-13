<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="PaymentInfo.aspx.cs" Inherits="Invoicing_Application.Webs.PaymentInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container  d-flex justify-content-start">
        <div class="card border-info" style="width: 100%">
            <div class="card-header">
                <h5>Payment Info</h5>
            </div>
            <div class="card-body">

                <form class="needs-validation" novalidate runat="server">
                    <div class="form-row">
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="txtFullName">Customer Name </label>
                                <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Your Name.
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="txtFullName">Invoice No </label>
                                <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Your Name.
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                                <label for="txtFullName">Amount Paied </label>
                                <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Your Name.
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="form-row">
                        <div class="col-md-12  text-right">
                            <button id="btnSave" type="submit" class="btn btn-primary">Save</button>
                            <button id="btnCancel" type="reset" class="btn btn-secondary" onclick="return confirm_reset();">Cancel</button>


                        </div>

                    </div>



                </form>



                <div class="row">
                    <div class="col-12">
                        <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                            <thead>

                                <tr>

                                    <th>Select</th>

                                    <th>Customer Name</th>
                                    <th>Company</th>
                                    <th>Invoice No</th>
                                    <th>Bill Amount</th>
                                    <th>Amount Paid</th>
                                    <th>Remaining Amount</th>



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

</asp:Content>
