<%@ page import="onlie_test_web_app.repo.UserRepo" %>
<%@ page import="onlie_test_web_app.entity.User" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/26/2024
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
</head>
<body>


<%
    User user = null;

    Object obj = session.getAttribute("currentUser");
    if (obj != null) {
        user = (User) obj;
    }

    UserRepo userRepo = new UserRepo();
    User optionalUser = userRepo.getUserByCookie(request);
    if (optionalUser != null) {
        user = optionalUser;
    }

%>


<div class="container">
    <h1 class="text-center mt-5 mb-4">Your Profile</h1>
    <div class="card">
        <div class="card-body">


            <h5 class="card-title">Your Information</h5>
            <p class="card-text mb-0" style="margin: 1px">Photo:
                <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(user.getPhoto())%>"
                     alt="Profile Icon" class="img-fluid mr-1" style="width: 80px;">
                <br>
            </p>
            <br>
            <p class="card-text">Username: <%= user.getUsername() %>
            </p>
            <p class="card-text">First Name: <%= user.getFirstName() %>
            </p>
            <p class="card-text">Last Name: <%= user.getLastName() %>
            </p>

        </div>


        <div class="d-flex justify-content-between">
            <a href="index.jsp" class="btn btn-primary text-white text-center m-lg-3">Go home</a>

            <a href="editData.jsp" class="btn btn-primary text-white text-center m-lg-3">Change Data</a>
        </div>


        <br>
    </div>
</div>


</body>
</html>
