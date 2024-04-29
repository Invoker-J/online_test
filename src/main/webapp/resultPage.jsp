<%@ page import="java.util.List" %>
<%@ page import="onlie_test_web_app.entity.Result" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/26/2024
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">

</head>
<body>

<%
    List<Result> results = (List<Result>) session.getAttribute("results");
%>

<h1 class="text-center mt-5 mb-4" style="margin: 10px">Online Test Results</h1>
<h2 class="text-center mt-5 mb-4" style="margin: 0">Your result: <%=results.stream().filter(result -> result
        .getResult().equals("✅")).toList().size()%>/<%=results.size()%></h2>

<h4 class="text-center mt-5 mb-4" style="margin: 0">Test level: <%=results.stream().findFirst().get().getQuestion().getTestLevel().name()%></h4>


<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th>Question Text</th>
            <th>Answer</th> <!-- Yangi qator -->
            <th>Photo</th>
            <th>Result</th>
        </tr>
        </thead>
        <tbody>
        <% for (Result result : results) {%>
        <tr>
            <td><%=result.getQuestion().getQuestionText()%></td>
            <td><%=result.getQuestion().getAnswer().getText()%></td> <!-- Yangi qator -->
            <td><img  src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(result.getQuestion().getPhoto())%>" alt="Don't have photo"
                      style="max-width: 100px;"></td>
            <td><%=result.getResult()%></td>
        </tr>
        <% }%>
        </tbody>
    </table>
    <br>
    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-success btn-lg mt-2 ">Go home</a>
    </div>
    <br>
</div>

<!-- Bootstrap JS va bog'lanishlari -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
