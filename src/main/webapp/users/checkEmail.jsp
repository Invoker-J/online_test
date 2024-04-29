<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/25/2024
  Time: 9:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Email</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="login-container">
                <h3 class="text-center mb-4">Login</h3>
                <form action="/auth/check/email" method="post">
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input name="password" type="password" class="form-control" id="password" placeholder="Password" required>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">Sign up</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
