﻿function InitDataTable() {
    var table = $('#tblProduct').DataTable({
        responsive: true,
        fixedHeader: true,
        "paging": false,
        searching: false,
        "ordering": false
        //,stateSave: true // this makes the first ( 0th) column hidden automatically
    });
    table.columns([0]).visible(false);
    table.columns([1]).visible(false);
    
    table.columns([12]).visible(false);
    table.columns([13]).visible(false);
    table.columns([14]).visible(false);
  
}
function ClearProductTable() {
   
    $('#tblProduct').DataTable().clear().draw();
}
function ClearProductSelect() {

    $("#select2-cmbProduct-container").text("Select Product");
    $("#select2-cmbSKU-container").text("Select SKU");

    $("#cmbProduct").val("-1");
    $("#cmbSKU").val("-1");

    $("#txtProductName").val("");
    $("#txtQTY").val("");
    $("#txtRate").val("");
    $("#txtProductID").val("");

    $("#txtTotal").val("");

    $("#txtSKUNumber").val("");
    $("#txtHSN_No").val("");


    $("#txtHSNID").val("");
    $("#txtCGST").val("");
    $("#txtSGST").val("");
    $("#txtIGST").val("");
 

}

function DoBillCalculation() {

    var SubTotal = 0;
    var TotalCGST = 0;
    var TotalSGST = 0;
    var TotalIGST = 0;


    $("#tblProduct TBODY TR").each(function () {
        var row = $(this);

        // get the Total amount value before you delete
        var temp = $('#tblProduct').DataTable().row(row).data();

        // get the total amount of current row
        var amtTotal = temp[7];

        // alert("Tot : " + amtTotal);

        SubTotal = parseFloat(SubTotal) + parseFloat(amtTotal);


        var CurCGSTamt = temp[12]; //CGST
        var CurSGSTamt = temp[13]; //CGST
        var CurIGSTamt = temp[14]; //CGST

        TotalCGST = parseFloat(TotalCGST) + parseFloat(CurCGSTamt);
        TotalSGST = parseFloat(TotalSGST) + parseFloat(CurSGSTamt);
        TotalIGST = parseFloat(TotalIGST) + parseFloat(CurIGSTamt);

    });

    var NewTotal = parseFloat(SubTotal).toFixed(2);
    $('#txtAmountBeforeTax').val(NewTotal);

    $('#txtstrCGST').val(parseFloat(TotalCGST).toFixed(2));
    $('#txtstrSGST').val(parseFloat(TotalSGST).toFixed(2));
    $('#txtstrIGST').val(parseFloat(TotalIGST).toFixed(2));
    


    MasterCalculation();
}
function CalculatePercent(Percent, CurrGSTAmount) {
 
   

    var numVal1 = Number(CurrGSTAmount);
    var numVal2 = Number(Percent) / 100;
    var result = numVal2 * numVal1;
    return result;   
}
function MasterCalculation() {

    // calculate the percent first 
    //txtAmountBeforeTax---txtDiscountAmt

    var Percent = $('#txtDiscountAmt').val().replace("%", "");

    var numVal1 = Number(document.getElementById("txtAmountBeforeTax").value);
    var numVal2 = Number(Percent) / 100;
    var totalValue = numVal1 - (numVal1 * numVal2)

   
    // this is actual amount
    var amtCGST = $('#txtstrCGST').val();
    var amtSGST = $('#txtstrSGST').val();
    var amtIGST = $('#txtstrIGST').val();

    //console.log("amtCGST : " + amtCGST);
    //console.log("amtSGST : " + amtSGST);
    //console.log("amtIGST : " + amtIGST);

    var TotalGSTAmount = Number(amtCGST) + Number(amtSGST) + Number(amtIGST);

    //   console.log("Total : " + TotalGSTAmount);
    // show total GST
    document.getElementById("txtGST").value = Number(TotalGSTAmount).toFixed(2);

    var GrandTotal = totalValue + TotalGSTAmount;

    document.getElementById("txtAmountafterTax").value = Number(GrandTotal).toFixed(2);
}
function BindInitialData() {

    BindState();

    BindCustomer();
    BindProducts();
    BindConsigneeState();
 

}
function BindCustomer() {

    // drop down------
    $.ajax({
        type: "POST",
        url: "../Service/Invoicing_Service.asmx/BindCustomer",
        dataType: "json",
        //data: JSON.stringify(ObjMyData),
        contentType: "application/json",
        success: function (res) {

            $("#cmbCustomer").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select Customer'));
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
function BindConsigneeState() {

    // drop down------
    $.ajax({
        type: "POST",
        url: "../Service/Invoicing_Service.asmx/BindState",
        dataType: "json",
        //data: JSON.stringify(ObjMyData),
        contentType: "application/json",
        success: function (res) {

            $("#cmdConsigneeState").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select State'));
            $.each(res, function (data, value) {

                $("#cmdConsigneeState").append($("<option></option>").val(value.StateID).html(value.StateName));
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
}

function BindState() {
    // set the deafult state from session
   
  

    $("#cmdState").val(DefaultState);
    $("#txtStateName").val(StateName);

}

function BindProducts() {

    // drop down------
    $.ajax({
        type: "POST",
        url: "../Service/Invoicing_Service.asmx/BindProduct",
        dataType: "json",
        //data: JSON.stringify(ObjMyData),
        contentType: "application/json",
        success: function (res) {

            $("#cmbProduct").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select Product'));
            $("#cmbSKU").append($("<option selected='selected' disabled='disabled'></option>").val('-1').html('Select SKU'));
            $.each(res, function (data, value) {

                $("#cmbProduct").append($("<option></option>").val(value.SKUID).html(value.SKUName));
                $("#cmbSKU").append($("<option></option>").val(value.SKUID).html(value.SKUCode));
            })

            // set the deafult state from session
            // Initialize select2 : this makes auto popupate
            $("#cmbProduct").select2();
            $("#cmbSKU").select2();
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


function BindSalesDetails() {

    var invID = $("#txtBindInvoiceID").val();
    var ObjMyData = { InvoiceID: invID };

    // drop down------
    $.ajax({
        type: "POST",
        url: "../Service/Invoicing_Service.asmx/GetSalesDetails",
        dataType: "json",
        data: JSON.stringify(ObjMyData),
        contentType: "application/json",
        success: function (res) {

            $.each(res, function (data, value) {

                AddProduct(
                    value.Product_Name,
                    value.QTY,
                    value.Rate,
                    value.Total,
                    value.ProductID,
                    value.SKU_Code,
                    value.HSN
                )
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
}

function BindInvoiceDetails() {
    var invID = $("#txtBindInvoiceID").val();
    var ObjMyData = { invoiceID: invID };

    // drop down------
    $.ajax({
        type: "POST",
        url: "../Service/Invoicing_Service.asmx/GetBindInvoiceDetails",
        dataType: "json",
        data: JSON.stringify(ObjMyData),
        contentType: "application/json",
        success: function (data) {

            $("#txtInvoiceID").val(invID);
            $("#txtInvoiceNumber").val(data[0].InvoiceNumber);

            var d = new Date(data[0].InvoiceDate);
            var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
            //alert('d ' + d + ' strDate ' + strDate);
            $("#datepicker").val(strDate);

            $("#cmbCustomer").val(data[0].PartyID);
            $("#cmbCustomer").trigger("change");

            $("#txtDiscountAmt").val(data[0].DiscountAmount);


            $("#txtReverseCharge").val(data[0].ReverseCharge);
            $("#txtTransportationMode").val(data[0].Transportation_Mode);
            $("#txtVehicleNumber").val(data[0].Vehicle_Number);

            var dsup = new Date(data[0].SupplyDate);
            var strDateSupply = dsup.getFullYear() + "-" + dsup.getMonth() + "-" + dsup.getDate();
            if (dsup.getFullYear() == "1970") {
                $("#txtDateofSupply").val("");
            }
            else {
                $("#txtDateofSupply").val(strDateSupply);
            }

            $("#txtPlaceofSupply").val(data[0].SupplyPlace);

            $("#txtConsigneeName").val(data[0].Consignee_Name);

            $("#txtConsigneeGST").val(data[0].Consignee_GST);

            $("#cmdConsigneeState").val(data[0].Consignee_StateID);

            $("#txtConsigneeAddress").val(data[0].Consignee_Address);
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

function AddProduct(ProName, ProQTY, ProRate, ProTotal, ProProductID, ProSKU, ProHSN) {

    var PName = ProName;
    var PQTY = ProQTY;
    var PRate = ProRate;
    var PTotal = ProTotal;
    var PID = ProProductID;
    var SKUNumber = ProSKU;
    var HSN_No = ProHSN;

    // if product ID already exists
    var rowId = $('#tblProduct').dataTable().fnFindCellRowIndexes(PID, 0);

    // add a new row
    $('#tblProduct').DataTable().row.add([
        PID,
        SKUNumber,
        PName,
        HSN_No,
        PQTY,
        PRate,
        PTotal,
        "<a class='lnkDelete btn btn btn-primary btn-sm' href='" + PID + "'>Delete</a>"
    ]).draw(false);

    DoBillCalculation();

    // QTY Column is Editable only , rest of the columns are read only . this is done inside js file.
    $('#tblProduct').editableTableWidget();

  

    // HideProductIDColumn();
    ClearProductSelect();
}
function Test(num) {

    alert('Functionality would be implemented in next update.');
    return
   
    InitDataTable();

    BindInitialData();

    BindInvoiceDetails();

    BindSalesDetails();
}


function Test2() {

    window.location.href = "Invoicing.aspx?";
}

// for manual validtion
function CustomValidation() {

    var result = false;

    var length = $('#tblProduct').DataTable().page.info().recordsTotal;
    if (length == 0) {
        alert('Please add products before generating invoice.');
        result = false;
        return;
    }

    var custValue = $("#cmbCustomer").val();

    //console.log(custValue);
    //console.log(ProductValue);
    //console.log(SKUValue);

    if (custValue == null) {
        $("#cmbCustomer").addClass("is-invalid");
        
        result = false;
    }
    else {
        $("#cmbCustomer").removeClass("is-invalid");
        $("#cmbCustomer").addClass("is-valid")
        result = true;
    }

    // console.log(result);

    return result;
}

function PostSalesInvoiceMaster() {

    var ObjInvoiceMaster = {

        parmSaleInvoiceID: $("#txtInvoiceID").val(),
        parmInvoiceNumber: $("#txtInvoiceNumber").val(),
        parmInvoiceDate: $("#datepicker").val(),
        parmStateID: $("#cmdState").val(),
        parmPartyID: $("#cmbCustomer").val(),
        parmTotalAmtBeforeTax: $("#txtAmountBeforeTax").val(),
        parmDiscountAmount: $("#txtDiscountAmt").val(),

        parmCGST: $("#txtstrCGST").val(),
        parmSGST: $("#txtstrSGST").val(),
        parmIGST: $("#txtstrIGST").val(),
        parmGST: $("#txtGST").val(),

        parmCGST_Percent: $("#txtCGST").val(),
        parmSGST_Percent: $("#txtSGST").val(),
        parmIGST_Percent: $("#txtIGST").val(),

        parmAmountAfterGST: $("#txtAmountafterTax").val(),
        parmCreatedBy: UserID,
        parmModifiedBy: UserID
            };

    //alert(JSON.stringify(ObjInvoiceMaster))

    $.ajax({
        url: "../Service/Invoicing_Service.asmx/InsertUpdateSaleInvoiceMaster",
        type: 'POST',
        data: JSON.stringify(ObjInvoiceMaster),
        contentType: "application/json",
        dataType: "json",
        beforeSend: function () {

            $('#lblLoadingtxt').text("Creating Invoice Please wait....");
            $('#loadingBox').modal('show');
        },
        complete: function () {

            //$('#loadingBox').modal('hide');
            // dont hide here as we have many other chain methods to call
        },

        success: function (responseData) {

            // parse it to java script object so that you can access property
            // data = $.parseJSON(responseData.d);

            if (responseData.Result) {


                $('#lblLoadingtxt').text("Invoice header saved..");

                // get the auto Invoice ID which is generated
                var InvoiceID = responseData.Value;

                // post the product details in another request
                PostSalesInvioceDetails(InvoiceID);
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
}

function PostSalesInvioceDetails(InvoiceID) {

    var lstSalesDetails = new Array();

    //Loop through the Table rows and build a JSON array.
    $("#tblProduct TBODY TR").each(function () {
        var row = $(this);

        var objSales = {};
        var temp = $('#tblProduct').DataTable().row(row).data();

        objSales.ProductID = temp[0];
        objSales.HSNID = temp[1];
        objSales.SKU_Code = temp[2];
  

        // get the QTY like this because it is editable. 
        //if you get like this it would be at 3th postion
        objSales.QTY = row.find("TD").eq(3).html();

        objSales.Rate = temp[6];
        objSales.Total = temp[7];

        objSales.CGST = temp[8].replace("%","");
        objSales.SGST = temp[9].replace("%", "");;
        objSales.IGST = temp[10].replace("%", "");;

        objSales.InvID = InvoiceID;

        lstSalesDetails.push(objSales);
    });

    //alert(JSON.stringify(lstSalesDetails));

    $.ajax({
        url: "../Service/Invoicing_Service.asmx/InsertUpdateSalesDetails",
        type: 'POST',
        data: { PostedData: JSON.stringify(lstSalesDetails) },

        dataType: "json",
        beforeSend: function () {

            $('#lblLoadingtxt').text("Saving product details...");
            // $('#loadingBox').modal('show');
        },
        complete: function () {

            //$('#loadingBox').modal('hide');
        },

        success: function (responseData) {

            // parse it to java script object so that you can access property
            // data = $.parseJSON(responseData.d);

            if (responseData.Result) {

                //  $('#loadingBox').modal('hide');

                $('#lblLoadingtxt').text("Product Details saved.");

                //  $('#lblMessage').text(responseData.strMessage);

                //  $('#mdlNormalMessage').modal('show');

                // save other invoice details
                SaveOtherInvoiceDetials(InvoiceID);
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
}

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
                    CustomValidation();
                    form.classList.add('was-validated');
                }
                else {

                    // perform custom validtion
                    if (CustomValidation()) {

                        event.preventDefault();
                        event.stopPropagation();

                        PostSalesInvoiceMaster();
                    }
                    else {
                        // if custom validtion fails
                        event.preventDefault();
                        event.stopPropagation();

                        form.classList.add('was-validated');
                    }
                }

            }, false);
        });
    }, false);
})();

function validateproduct(PID, PTotal) {

    var result = false;
    if (PID > 0 && PTotal > 0) {

        result = true;
    }
    else {
        alert('Please select any Product.');
        result = false;
    }
    return result;
}

function SaveOtherInvoiceDetials(InvoiceID) {

    var flag = false;

    // if any of the following fields are set then go ahead and save the data.
    if (document.getElementById("txtReverseCharge").value != "") {
        flag = true;
    }

    if (document.getElementById("txtTransportationMode").value != "") {
        flag = true;
    }
    if (document.getElementById("txtVehicleNumber").value != "") {
        flag = true;
    }


    if (document.getElementById("txtDateofSupply").value != "") {
        flag = true;

    }
    if (document.getElementById("txtPlaceofSupply").value != "") {
        flag = true;
    }

    if (document.getElementById("txtConsigneeName").value != "") {
        flag = true;
    }

    if (document.getElementById("txtConsigneeGST").value != "") {
        flag = true;
    }

   // console.log("cmdConsigneeState :" + document.getElementById("cmdConsigneeState").value);

    if (document.getElementById("cmdConsigneeState").value > 0) {
        flag = true;
    }

    if (flag) {
        var ReverseCharge = $("#txtReverseCharge").val();
        var TransportationMode = $("#txtTransportationMode").val();
        var VehicleNumber = $("#txtVehicleNumber").val();
        var DateofSupply = $("#txtDateofSupply").val();
        var ConsigneeName = $("#txtConsigneeName").val();
        var ConsigneeGST = $("#txtConsigneeGST").val();
        var ConsigneeState = $("#cmdConsigneeState").val();
        var ConsigneeAddress = $("#txtConsigneeAddress").val();
        var ConsigneeAddress = $("#txtConsigneeAddress").val();
        var PlaceofSupply = $("#txtPlaceofSupply").val();

        var ObjOtherInvoiceData = {
            parmInvoiceID: InvoiceID,
            parmReverseCharge: ReverseCharge,
            parmTransportation_Mode: TransportationMode,
            parmVehicle_Number: VehicleNumber,
            parmConsignee_Name: ConsigneeName,
            parmConsignee_GST: ConsigneeGST,
            parmConsignee_StateID: ConsigneeState,
            parmConsignee_Address: ConsigneeAddress,
            parmSupplyDate: DateofSupply,

            parmConsignee_PAN: "NA",
            parmPlaceofSupply: PlaceofSupply
        };

        //alert(JSON.stringify(ObjOtherInvoiceData));

        $.ajax({
            url: "../Service/Invoicing_Service.asmx/SaveOtherInfoiceDetails",
            type: 'POST',
            data: JSON.stringify(ObjOtherInvoiceData),
            contentType: "application/json",
            dataType: "json",
            beforeSend: function () {

                $('#lblLoadingtxt').text("Saving Other details....");
            },
            complete: function () {

                $('#loadingBox').modal('hide');
            },
            success: function (responseData) {

                // parse it to java script object so that you can access property
                // data = $.parseJSON(responseData.d);

                if (responseData.Result) {

                    $('#loadingBox').modal('hide');

                    if ($('#txtBindInvoiceID').val() == "0") {



                        $('#lblMessage').text("Invoice have been updated successfully.");
                        $('#pngInvoicePDF').removeClass("invisible");
                    }
                    else {
                        $('#lblMessage').text("Invoice have been updated successfully.");
                        $('#pngInvoicePDF').removeClass("invisible");
                    }

                    $('#mdlNormalMessage').modal('show');

                    // after reset remove the class else it will show validtion message.
                    let jsContactForm = document.getElementById('frmInvoice');                   // <=== 
                    jsContactForm.classList.remove('was-validated');

                    // clear the data table
                    $('#tblProduct').DataTable().clear().draw();



                    if ($("#txtPartyStateID").val() == DefaultState) {
                        window.location.href = "../Report/Report_Pages/Invoice_Report.aspx?InvoiceID=" + InvoiceID + "&PartyID=" + $("#cmbCustomer").val() +"&IGST=0";
                    }
                    else {
                        window.location.href = "../Report/Report_Pages/Invoice_Report.aspx?InvoiceID=" + InvoiceID + "&PartyID=" + $("#cmbCustomer").val()+"&IGST=1";
                    }


                    $('#frmInvoice').trigger("reset");
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
    }
    else {

        $('#loadingBox').modal('hide');

        if ($('#txtBindInvoiceID').val() == "0") {

            $('#lblMessage').html("Invoice have been created successfully");
            $('#pngInvoicePDF').removeClass("invisible");
        }
        else {
            $('#lblMessage').text("Invoice have been updated successfully.");
            $('#pngInvoicePDF').removeClass("invisible");
        }

        $('#mdlNormalMessage').modal('show');

        // after reset remove the class else it will show validtion message.
        let jsContactForm = document.getElementById('frmInvoice');                   // <=== 
        jsContactForm.classList.remove('was-validated');

        if ($("#txtPartyStateID").val() == DefaultState) {
            window.location.href = "../Report/Report_Pages/Invoice_Report.aspx?InvoiceID=" + InvoiceID + "&PartyID=" + $("#cmbCustomer").val()+"&IGST=0";
        }
        else {
            window.location.href = "../Report/Report_Pages/Invoice_Report.aspx?InvoiceID=" + InvoiceID + "&PartyID=" + $("#cmbCustomer").val()+"&IGST=1";
        }
        $('#frmInvoice').trigger("reset");
    }
}

$(function () {
    $("#datepicker").datepicker({
        maxDate: 0
    });
    $("#txtDateofSupply").datepicker({
        maxDate: 0
    });
});

$("#lnkRefresh").click(function () {
    event.preventDefault();
    BindCustomer();
    alert("customer loaded");
});

$("#btnCancel").click(function () {

    $("#txtProductName").val("");
    $("#txtQTY").val("");
    $("#txtRate").val("");
    $("#txtProductID").val("");
    $("#txtTotal").val("");
});

function SetVisbileControl() {

 

    $('#tblProduct').DataTable().columns([12]).visible(true);
    $('#tblProduct').DataTable().columns([13]).visible(true);
    $('#tblProduct').DataTable().columns([14]).visible(true);
}

// add new row to the list.
$("#btnAddProduct").click(function () {

    var PName = $("#txtProductName").val();
    var PQTY = $("#txtQTY").val();
    var PRate = $("#txtRate").val();
    var PTotal = $("#txtTotal").val();
    var PID = $("#txtProductID").val();
    var SKUNumber = $("#txtSKUNumber").val();
    var HSN_No = $("#txtHSN_No").val();
    var CGST = "";
    var SGST = "";
    var IGST = "";

    var amtCGST = "0";
    var amtSGST = "0";
    var amtIGST = "0";

    // if party state and user state both are same
    if ($("#txtPartyStateID").val() == DefaultState) {
        CGST = $('#txtCGST').val()+"%";
        SGST = $('#txtSGST').val() + "%";
        IGST = "0.0%"; 

        amtCGST = CalculatePercent($('#txtCGST').val(), PTotal);
        amtSGST = CalculatePercent($('#txtSGST').val(), PTotal);
       
   
    }
    else
    {
       
        // if party has diff state
        CGST = "0.0%";
        SGST = "0.0%";
        IGST = $('#txtIGST').val() + "%";

        amtIGST = CalculatePercent($('#txtIGST').val(), PTotal);

    }
   
    if (validateproduct(PID, PTotal)) {

        // if product ID already exists
        var rowId = $('#tblProduct').dataTable().fnFindCellRowIndexes(PID, 0);

        if (rowId == '') {

            // add new record

            $('#tblProduct').DataTable().row.add([
                PID,
                $('#txtHSNID').val(),
                SKUNumber,
                PName,
                HSN_No,
                PQTY,
                PRate,
                PTotal,
                CGST,
                SGST,
                IGST,

                "<a class='lnkDelete btn btn btn-primary btn-sm' href='" + PID + "'>Delete</a>",
                amtCGST,
                amtSGST,
                amtIGST 
              
            ]).draw(false);

            DoBillCalculation();
            $("#txtRate").removeClass("OldRate");

        }
        else {
            // update the exsting row

  

            // if item exist then get its row.
            var temp = $('#tblProduct').DataTable().row(rowId).data();

            // get the column value (QTY)
            var ExistingQTY = temp[5];

            var ExistCGST = temp[12];
            var ExistSGST = temp[13];
            var ExistIGST = temp[14];



            // add the qty
            var NewQTY = parseInt(ExistingQTY) + parseInt(PQTY);

            var Total = parseFloat(parseFloat(PRate) * parseFloat(NewQTY)).toFixed(2);

            // update the new QTY
            temp[5] = NewQTY;
            temp[7] = Total;

            temp[12] = parseFloat(parseFloat(ExistCGST) + parseFloat(amtCGST)).toFixed(2);
            temp[13] = parseFloat(parseFloat(ExistSGST) + parseFloat(amtSGST)).toFixed(2);
            temp[14] = parseFloat(parseFloat(ExistIGST) + parseFloat(amtIGST)).toFixed(2);


            // add the row back to table
            $('#tblProduct').DataTable().row(rowId).data(temp).invalidate().draw();
            DoBillCalculation();
           
        }

        // QTY Column is Editable only , rest of the columns are read only . this is done inside js file.
        $('#tblProduct').editableTableWidget();

        // very important event, the QTY gets changed this fires..
        $(".lnkChange").change(function () {

            // get the Total amount value before you delete
            var temp = $('#tblProduct').DataTable().row(RowNumber).data();

            // access the currently change QTY like this
            // Dont get it from DataTable as its not upate there on change.
            var QTY = $(this).val();
            if (QTY==0) {
                alert("QTY cannot be set to zero. Default QTY will be set to 1");
                QTY = 1;
            }

            // set your new QTY in Data object
            temp[5] = QTY;
            // you can get the rate from data table.
            var rate = temp[6];

            var Totalamt = QTY * rate;

            temp[7] = Number(Totalamt).toFixed(2);


            var CGSTPer = temp[8].replace("%", "");;
            var SGSTPer = temp[9].replace("%", "");;
            var IGSTPer = temp[10].replace("%", "");;


            temp[12] = Number(CalculatePercent(CGSTPer, Totalamt)).toFixed(2);
            temp[13] = Number(CalculatePercent(SGSTPer, Totalamt)).toFixed(2);
            temp[14] = Number(CalculatePercent(IGSTPer, Totalamt)).toFixed(2);






            // add the row back to table
            $('#tblProduct').DataTable().row(RowNumber).data(temp).invalidate().draw();

            DoBillCalculation();

        });

        // HideProductIDColumn();
        ClearProductSelect();
    }
});

function CalculateDiscount() {

    var numVal1 = Number(document.getElementById("txtAmountBeforeTax").value);
    var numVal2 = Number(Percent) / 100;
    var totalValue = numVal1 - (numVal1 * numVal2)

    document.getElementById("txtAmountafterTax").value = totalValue.toFixed(2);

    $('#txtDiscountAmt').val(Percent + "%");
}

function OnDiscountFocus() {

    var Percent = $('#txtDiscountAmt').val().replace("%", "");
    $('#txtDiscountAmt').val(Percent);

}
var RowNumber = 0;
// attaching event on table , then on link ( to be pricese)
$("#tblProduct").on("click", ".lnkDelete", function () {

    event.preventDefault(); // <---------you may want this to stop the link

    // get the Total amount value before you delete
    var temp = $('#tblProduct').DataTable().row($(this).parents('tr')).data();

    var TotaAmount = temp[6];

    var CurrentTotalAmt = $("#txtAmountBeforeTax").val();

    var NewTotal = parseFloat(parseFloat(CurrentTotalAmt) - parseFloat(TotaAmount)).toFixed(2);

    $("#txtAmountBeforeTax").val(NewTotal);

    // get the column value (QTY)
    var ExistingQTY = temp[2];
    $('#tblProduct').DataTable().row($(this).parents('tr'))
        .remove()
        .draw();

    // if row count is zero then make everything zero
    var length = $('#tblProduct').DataTable().page.info().recordsTotal;

    if (length == 0) {
        $('#txtDiscountAmt').val("0");
        $('#txtCGST').val("0");
        $('#txtSGST').val("0");
        $('#txtGST').val("0");

        $('#txtstrCGST').val("0");
        $('#txtstrSGST').val("0");
        $('#txtstrIGST').val("0");

        $('#txtIGST').val("0");
        $('#txtAmountafterTax').val("0");
        $('#txtAmountBeforeTax').val("0");

        $("#btnAddProduct").addClass("ui-state-disabled");
        $("#txtRate").removeClass("OldRate");
    }
    else {
        DoBillCalculation();
    }

    return false; // <---------or this if you want to prevent bubbling as well
});

// attaching event on table , then on link ( to be pricese)
// fire the event when QTY Changes
$("#tblProduct").on("click", "td", function () {

    var col = $(this).parent().children().index($(this));

    RowNumber = $(this).parent().parent().children().index($(this).parent());
});

function OnQTYChange() {

    var QTY = $("#txtQTY").val();
    if (QTY <= 0) {
        alert('Please Enter Postive QTY');
    }
    else {
        var Rate = $("#txtRate").val();
        var Total = parseFloat(parseFloat(Rate) * parseFloat(QTY)).toFixed(2);
        $("#txtTotal").val(Total);
    }

}
function GetSelectedTextValue(ddlFruits) {
    var selectedText = ddlFruits.options[ddlFruits.selectedIndex].innerHTML;
    var selectedValue = ddlFruits.value;

    alert("Selected Text: " + selectedText + " Value: " + selectedValue);
}

// selected event changed
$("#cmbCustomer").change(function () {
    var selectedText = $(this).find("option:selected").text();
    var selectedValue = $(this).val();

    GetSelectedCustomer(selectedValue);
    //alert("Selected Text: " + selectedText + " Value: " + selectedValue);

    $("#select2-cmbSKU-container").text("Select SKU");
    var length = $('#tblProduct').DataTable().page.info().recordsTotal;
    if (length>0) {
        result = confirm("Switching the customer will clear all the products. Are you sure, you want to continue.");
        if (result) {
            // clear the data table
            $('#tblProduct').DataTable().clear().draw();
        }
    }
});

// Get the product details 101
$("#cmbProduct, #cmbSKU").change(function () {
    var selectedText = $(this).find("option:selected").text();
    var selectedValue = $(this).val();

    var prID = $("#cmbCustomer").val();
    if (prID == null || prID == "0") {
        topFunction();
        alert("Please select the party first.");
    }
    else {

        GetSelectedProduct(selectedValue, prID);
    }
    //alert("Selected Text: " + selectedText + " Value: " + selectedValue);
});

$(document).ready(function () {   // dynamic Table

    var BindID = $('#txtBindInvoiceID').val();
    if (BindID == "0") {
     
        InitDataTable();
        BindInitialData();
        //BindState();
        //BindConsigneeState();
    }
});

function GetSelectedCustomer(custID) {
    //alert('custID ' + custID);
    var objData = { CustomerID: custID };
    // drop down------
    $.ajax({
        type: "POST",
        url: "../Service/Invoicing_Service.asmx/GetSelectedCustomer",
        dataType: "json",
        data: JSON.stringify(objData),
        contentType: "application/json; charset=utf-8",
        cache: false,
        beforeSend: function () {

            $('#lblLoadingtxt').text("Fetching Party Details....");
            $('#loadingBox').modal('show');
        },
        complete: function () {

            $('#loadingBox').modal('hide');
        },
        success: function (res) {

            // single row would come
            //$('#loadingBox').modal('hide');
            $("#txtPartyState").val(res[0].StateName);
            $("#txtAddress").val(res[0].Address);
            $("#txtGSTNo").val(res[0].GSTNo);
            $("#txtPartyStateID").val(res[0].StateID);
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

function GetSelectedProduct(PID, PR_ID) {

    var objData = { ProductID: PID, PartyID: PR_ID };
    // drop down------
    $.ajax({
        type: "POST",
        url: "../Service/Invoicing_Service.asmx/GetSelectedProduct",
        dataType: "json",
        data: JSON.stringify(objData),
        contentType: "application/json",
        success: function (res) {

            // single row would come
            $("#btnAddProduct").removeClass("ui-state-disabled");

            $("#txtProductName").val(res[0].SKUName);
            $("#txtQTY").val("1");
            $("#txtRate").val(res[0].Rate);
            $("#txtProductID").val(res[0].SKUID);

            $("#txtTotal").val(res[0].Rate);

            $("#txtSKUNumber").val(res[0].SKUCode);
            $("#txtHSN_No").val(res[0].HSNCode);
            $("#txtHSNID").val(res[0].HSNID);

            $("#txtCGST").val(res[0].CGST);
            $("#txtSGST").val(res[0].SGST);
            $("#txtIGST").val(res[0].IGST);
            
            if (res[0].IsOld == "1") {
                $("#txtRate").addClass("OldRate");
            }
            else {
                $("#txtRate").removeClass("OldRate");
            }
        },
        beforeSend: function () {

            $('#lblLoadingtxt').text("Fetching Product Details....");
            $('#loadingBox').modal('show');
        },
        complete: function () {

            $('#loadingBox').modal('hide');
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