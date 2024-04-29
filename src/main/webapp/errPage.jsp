<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/24/2024
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
</head>
<body>

<%
    String error = request.getParameter("error");
%>error

<h1>Error</h1>
<h4><%=error%></h4>
</body>
</html>
