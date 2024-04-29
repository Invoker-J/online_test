<%@ page import="onlie_test_web_app.entity.enums.TestLevel" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/25/2024
  Time: 3:14 AM
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
        .card-title {
            text-align: center;
        }

    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">

                    <div class="card-header bg-primary text-white">
                        Add question
                    </div>

                    <form enctype="multipart/form-data" action="/create/question" method="post">
                        <div class="form-group">
                            <label for="questionImage">Add photo for question</label>
                            <input name="photo" type="file" class="form-control-file" id="questionImage">
                        </div>

                        <div class="form-group">
                            <label for="questionText">Question text:</label>
                            <input name="questionText" type="text" class="form-control" id="questionText" placeholder="Enter question">
                        </div>

                        <div class="form-group">
                            <label for="level">Level</label>
                            <select name="level" class="form-control" id="level">
                                <% for (TestLevel value : TestLevel.values()) { %>
                                    <option value="<%=value.name()%>"><%=value.name()%></option>
                                <% } %>
                            </select>
                        </div>


                        <div class="form-group">
                            <label for="answer1">Answer 1 (Correct)</label>
                            <input name="answer" type="text" class="form-control" id="answer1" placeholder="Enter correct answer">
                        </div>
                        <div class="form-group">
                            <label for="answer2">Answer 2</label>
                            <input name="falseAnswer1" type="text" class="form-control" id="answer2" placeholder="Enter wrong answer 1">
                        </div>
                        <div class="form-group">
                            <label for="answer3">Answer 3</label>
                            <input name="falseAnswer2" type="text" class="form-control" id="answer3" placeholder="Enter wrong answer 2">
                        </div>
                        <div class="form-group">
                            <label for="answer4">Answer 4</label>
                            <input name="falseAnswer3" type="text" class="form-control" id="answer4" placeholder="Enter wrong answer 3">
                        </div>
                        <div class="d-flex justify-content-between">
                            <button class="btn btn-primary text-white text-center">Submit</button>
                            <a href="../index.jsp" class="btn btn-primary text-white text-center">Enough</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
