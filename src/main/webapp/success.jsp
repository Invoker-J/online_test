<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/28/2024
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Success</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .success-container {
            text-align: center;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #4CAF50;
        }
        p {
            color: #333;
        }
    </style>
</head>
<body>
<div class="success-container">
    <h1>Success!</h1>
    <p>Your information has been successfully updated.</p>
</div>

<script>
    // Optional: Redirect to another page after a delay
    setTimeout(function() {
        window.location.href = "index.jsp";
    }, 3000); // Redirect after 3 seconds (3000 milliseconds)
</script>
</body>
</html>