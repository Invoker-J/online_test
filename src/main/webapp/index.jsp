<%@ page import="onlie_test_web_app.entity.User" %>
<%@ page import="java.util.Optional" %>
<%@ page import="onlie_test_web_app.repo.UserRepo" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand {
            color: #fff;
            font-size: 24px;
        }
        .navbar-brand:hover {
            color: #fff;
        }
        .btn-login {
            background-color: #007bff;
            color: #fff;
            border: none;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
        .btn-signup {
            background-color: #28a745;
            color: #fff;
            border: none;
        }
        .btn-signup:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>


<%
    User user = UserRepo.getCurrentUser(request, session);

%>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Online test</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <%if(user==null){ %>
                <li class="nav-item">
                    <a class="btn btn-login ml-2" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-signup ml-2" href="signUp.jsp">Sign Up</a>
                </li>
                <% } else { %>
                <li class="nav-item">
                    <a href="/profile.jsp" class="btn btn-outline-info ml-2 bg-info text-dark">
                        <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(user.getPhoto())%>" alt="Profile Icon" class="img-fluid rounded-circle" style="width: 20px; height: 20px;">
                        Profile
                    </a>
                    <a href="/auth/logout" class="btn btn-danger ml-2">
                        Log out
                    </a>

                </li>

                <% } %>
            </ul>
        </div>
    </div>
</nav>



<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="jumbotron text-center">
                <h1 class="display-4">Welcome to Our Online test web app!</h1>
<%--                <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut hendrerit mauris in nunc suscipit, ac fermentum nisi molestie.</p>--%>
                <hr class="my-4">
                <p>Choose an action below:</p>
                <a class="btn btn-primary btn-lg mr-3" href="users/createTest.jsp" role="button">Create </a>
                <a class="btn btn-success btn-lg" href="testSettings.jsp" role="button">Start</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>