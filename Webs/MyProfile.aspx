<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Invoicing_Application.Webs.MyProfile" %>

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
                    <h5>My Profile</h5>
                </div>
                <div class="card-body">
                    <form class="needs-validation" novalidate runat="server">
                        <div class="form-row">
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="txtFullName">Company Name : </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>



                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="txtFullName">Owner Name : </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>



                            </div>

                        </div>
                        <div class="form-row">
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="txtFullName">E-Mail: </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>



                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="txtFullName">Password : </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>



                            </div>

                        </div>
                        <div class="form-row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="txtFullName">Address : </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>



                            </div>


                        </div>
                        <div class="form-row">
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label for="cmbProduct">State :</label>
                                    <asp:DropDownList ID="cmbProduct" class="custom-select" name="cmdProducts" runat="server" required="true">
                                    </asp:DropDownList>

                                    <div class="invalid-feedback">
                                        Please select your product.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="txtFullName">GST: </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="txtFullName">Mobile : </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>
                            </div>



                        </div>

                        <hr />
                        <h5>Bank Details :</h5>
                        <div class="form-row">

                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Bank Name : </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Account No : </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">IFSC: </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label for="txtFullName">Branch: </label>
                                    <input type="text" class="form-control text " id="txtFullName" placeholder="Enter Your Name" required>
                                    <div class="invalid-feedback text-left">
                                        Please Enter Your Name.
                                    </div>
                                </div>

                            </div>




                        </div>

                        <h5>Terms and Condition :</h5>
                        <div class="form-row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="txtFullName">Term and Condition : </label>
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

                </div>

            </div>

        </div>

    </div>



</asp:Content>
