<%@ page import="onlie_test_web_app.repo.ScienceRepo" %>
<%@ page import="onlie_test_web_app.entity.Science" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/25/2024
  Time: 3:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin: 50px auto;
            max-width: 600px;
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
        }

        .btn-add-question:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<%
    ScienceRepo scienceRepo = new ScienceRepo();
    List<Science> sciences = scienceRepo.findAll();
%>

<div class="container">
    <div class="card">
        <div class="card-header">
            Generate Test
        </div>
        <div class="card-body">
            <form action="/create/test" method="post">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input name="title" type="text" class="form-control" id="title" placeholder="Enter title">
                </div>
                <div class="form-group">
                    <label for="subject">Subject:</label>
                    <select name="scienceId" class="form-control" id="subject">
                        <option value="" selected disabled>Select Science</option>
                        <% for (Science science : sciences) { %>
                            <option value="<%=science.getId()%>"><%=science.getName()%></option>
                        <% } %>
                    </select>
                </div>
                <button class="btn btn-primary text-white">Add Question</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>