<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="500.aspx.cs" Inherits="Invoicing_Application.CustomErrors._404" ClientIDMode="Static" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>500</title>

    <link href=<%=ConfigurationManager.AppSettings["host"]%>/CustomErrors/css/style.css rel="stylesheet" />
    <link href=<%=ConfigurationManager.AppSettings["host"]%>/assets/css/bootstrap.min.css rel="stylesheet" />

    <script src=<%=ConfigurationManager.AppSettings["host"]%>/assets/js/jquery-3.5.1.min.js></script>
</head>
<body>
    <form id="form1">
        <div id="notfound">
            <div class="notfound">
                <div class="notfound-404">
                    <h3>Internal Server Error</h3>
                    <h1><span>5</span><span>0</span><span>0</span></h1>
                </div>
                <h2>The server encountered an internal error or misconfiguration and was unable to complete your request.</h2>
                <h2>Please contact the server administrator to inform of the time the error occurred.</h2>
                <input type="button" name="btnHome" value="Go To Home Page" id="btnHome" class="btn btn-primary w-100">
            </div>
        </div>
        
    </form>
    <script>

        $("#btnHome").click(function () {
            window.location.href = "../Webs/Home.aspx";
        });

</script>
</body>
</html>