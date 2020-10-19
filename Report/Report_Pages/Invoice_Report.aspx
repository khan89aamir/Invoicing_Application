<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Invoice_Report.aspx.cs" Inherits="Invoicing_Application.Report.Report_Pages.Invoice_Report" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .MySubmitbtn {
    background-color: transparent;
    border: 0;
    cursor: pointer;
    animation: glowing 1300ms infinite;
    color: #007bff;
}

    .MySubmitbtn:focus {
        border: 0;
        background-color: transparent;
        box-sizing: unset;
        outline: none;
        outline-width: 0;
    }

    .MySubmitbtn:hover {
        color: white;
    }

.ParentSpan:hover .MySubmitbtn {
    color: white;
}


    </style>
      <div class="container text-center">
    <form id="form1" runat="server">
        <%--       <asp:Button ID="Button1" runat="server" Text="Show Report" OnClick="Button1_Click" /><br />
         <asp:Button ID="PrintButton" Text="Print" runat="server" OnClientClick="return Print();" />--%>


        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div hidden>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="800" Height="600"></rsweb:ReportViewer>

        </div>
        <br />
      
            <br />
            <br />
             <p runat="server" class="text-info">Your Invoice is ready, Click Download button to start downloading.</p>

            
                    <span class="btn btn-outline-primary ParentSpan">
                        <i class="fa fa-download"></i>
                       <asp:Button ID="Button1" runat="server" CssClass="MySubmitbtn"  Text="Download Invoice" OnClick="Button1_Click1" />
                    </span>
           
             <br />
         
       

    </form>
   
       <button onclick="goBack()" class="btn btn-outline-primary mt-2"><i class="fa fa-arrow-circle-left mr-1" aria-hidden="true"></i>Go Back</button>
  </div>
    <script>
        $(document).ready(function () {


            $('#mdlNormalMessage').modal('hide');
        });
        function goBack() {
          
            window.location.href = "../../Webs/Invoicing.aspx";
        }
    </script>

</asp:Content>
