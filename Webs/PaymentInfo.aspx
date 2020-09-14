<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="PaymentInfo.aspx.cs" Inherits="Invoicing_Application.Webs.PaymentInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h5 {
            background-color: #f7f7f7;
            border-radius: 6px;
            padding: 5px;
        }
    </style>
    <div class="container  d-flex justify-content-start">
        <div class="card border-info" style="width: 100%">
            <div class="card-header">
                <h5>Payment Info</h5>
            </div>
            <div class="card-body">

                <h5>Search Filter :</h5>
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
                          <label for="cmbProduct">Option :</label>
                            <select id="Select1" class="custom-select">
                                <option>Paid Invoice</option>
                                <option>UnPaid Invoice</option>
                                  <option>All Invoice</option>

                            </select>
                           

                                <div class="invalid-feedback">
                                    Please select your product.
                                </div>
                        </div>

                    </div>

                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-2  text-right">
                        <button id="btnSave" type="submit" class="btn btn-primary"><i class="fa fa-search mr-1" aria-hidden="true"></i>Search</button>
                        <button id="btnCancel" type="reset" class="btn btn-secondary" onclick="return confirm_reset();">Cancel</button>


                    </div>

                </div>



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
                                    <th>Total Amount Paid</th>
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
