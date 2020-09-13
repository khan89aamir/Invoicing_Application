<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Invoicing_Application.Webs.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex justify-content-start">
        <div class="card border-info" style="width: 100%">
            <div class="card-header">
                <h5>Customer Details</h5>
            </div>
            <div class="card-body">

                <form id="frmaccount" class="needs-validation" novalidate runat="server">

                    <input type="text" runat="server" class="form-control text" id="txtAccounID" value="0" hidden>
                    <div class="form-row">


                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtFulName">Customer Name : </label>

                                <input type="text" runat="server" class="form-control text" id="txtFulName" placeholder="Enter Your Name" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Your Name.
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtFulName">Company : </label>

                                <input type="text" runat="server" class="form-control text" id="Text1" placeholder="Enter Customer's Company Name" required>
                                <div class="invalid-feedback text-left">
                                    Please Enter Company Name
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtFulName">GST No : </label>

                                <input type="text" runat="server" class="form-control text" id="Text2" placeholder="Enter GST NO" required>
                                <div class="invalid-feedback text-left">
                                    Enter GST No
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

                                <label for="cmbProduct">State :</label>
                                <asp:DropDownList ID="cmbProduct" class="custom-select" name="cmdProducts" runat="server" required="true">
                                </asp:DropDownList>

                                <div class="invalid-feedback">
                                    Please select your product.
                                </div>


                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">

                                <label for="txtFulName">Address </label>
                                <textarea runat="server" rows="4" class="form-control text" id="Text3" placeholder="Enter Address" required>
                                 
                              </textarea>

                                <div class="invalid-feedback text-left">
                                    Enter Address
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

                            <th>CustomerID</th>
                            <th>Name</th>
                            <th>Company</th>
                            <th>GST NO</th>
                            <th>Email</th>
                            <th>Address</th>
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


</asp:Content>
