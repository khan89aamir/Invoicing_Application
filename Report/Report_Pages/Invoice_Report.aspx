<%@ Page Title="" Language="C#" MasterPageFile="~/Invoicing.Master" AutoEventWireup="true" CodeBehind="Invoice_Report.aspx.cs" Inherits="Invoicing_Application.Report.Report_Pages.Invoice_Report" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
          <asp:Button ID="Button1" runat="server" Text="Show Report" OnClick="Button1_Click" /><br />
         <asp:Button ID="PrintButton" Text="Print" runat="server" OnClientClick="return Print();" />

      
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="800" Height="600"></rsweb:ReportViewer>
        <br />
       
        
    </form>


</asp:Content>
