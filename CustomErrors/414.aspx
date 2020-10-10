<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="414.aspx.cs" Inherits="Invoicing_Application.CustomErrors._404" ClientIDMode="Static" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>414</title>

    <link href=<%=ConfigurationManager.AppSettings["host"]%>/CustomErrors/css/style.css rel="stylesheet" />
    <link href=<%=ConfigurationManager.AppSettings["host"]%>/assets/css/bootstrap.min.css rel="stylesheet" />

    <script src=<%=ConfigurationManager.AppSettings["host"]%>/assets/js/jquery-3.5.1.min.js></script>
</head>
<body>
    <form id="form1">
        <div id="notfound">
            <div class="notfound">
                <div class="notfound-404">
                    <h3>Request-URI Too Long</h3>
                    <h1><span>4</span><span>1</span><span>4</span></h1>
                </div>
                <h2>The Web server is refusing to service the request because the requested URL address is too long.</h2>
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