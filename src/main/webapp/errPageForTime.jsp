<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .error-message {
            font-size: 24px;
            color: #dc3545; /* Red color */
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<%
//    String duration = request.getParameter("duration");
    String attribute = (String) request.getSession().getAttribute("duration");
%>
<div class="container">
    <div class="error-message">
        Kechirasiz, siz testni kech tugatingiz uchun javoblaringiz qabul qilinmaydi!
    </div>
    <div class="text-center">
<%--        <p>Testni tugatgan vaqtingiz: <strong><%=duration%></strong></p>--%>
        <p>Testni tugatgan vaqtingiz: <strong><%=attribute%></strong></p>
    </div>
</div>
</body>
</html>
