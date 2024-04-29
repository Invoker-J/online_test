<%@ page import="onlie_test_web_app.repo.UserRepo" %>
<%@ page import="onlie_test_web_app.entity.User" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/28/2024
  Time: 10:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            margin-top: 50px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
            border-radius: 10px 10px 0 0;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>

<%
    User currentUser = UserRepo.getCurrentUser(request, session);
    for (int i = 0; i < 5; i++) {
        System.out.println("currentUser = " + currentUser);
    }
%>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="text-center">Sign Up</h4>
                </div>
                <div class="card-body">
                    <form enctype="multipart/form-data" action="/edit/data" method="post">
                        <div class="form-group">
                            <label>Your Photo:</label>
                            <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(currentUser.getPhoto())%>"
                                 alt="Your photo not found" style="width: 100px">
                            <br>
                        </div>
                        <div>
                            <input type="file" name="photo" id="img" style="display:none;"/>
                            <label  for="img" class="btn btn-outline-success">
                                Click me to upload image</label>
                        </div>


                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input value="<%=currentUser.getEmail()%>" type="email" class="form-control" id="email"
                                   name="email" aria-describedby="emailHelp" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                                else.</small>
                        </div>
                        <div class="form-group mt-3">
                            <label for="password">Password</label>
                            <input value="<%=currentUser.getPassword()%>" type="text" class="form-control" id="password"
                                   name="password" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input value="<%=currentUser.getUsername()%>" type="text" class="form-control" id="username"
                                   name="username" placeholder="Enter username">
                        </div>
                        <div class="form-row">
                            <div class="col">
                                <label for="firstName">First Name</label>
                                <input value="<%=currentUser.getFirstName()%>" type="text" class="form-control"
                                       id="firstName" name="firstName" placeholder="Enter first name">
                            </div>
                            <div class="col">
                                <label for="lastName">Last Name</label>
                                <input value="<%=currentUser.getLastName()%>" type="text" class="form-control"
                                       id="lastName" name="lastName" placeholder="Enter last name">
                            </div>
                        </div>
                        <br>
                        <br>
                        <button type="submit" class="btn btn-primary btn-block">Edit</button>
                        <br>
                        <br>
                        <div class="text-center">
                            <small>Go home -> <a href="login.jsp">Home</a></small>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>