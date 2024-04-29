<%@ page import="onlie_test_web_app.entity.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="onlie_test_web_app.repo.AnswerRepo" %>
<%@ page import="onlie_test_web_app.entity.Answer" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Base64" %>
<%@ page import="onlie_test_web_app.entity.User" %>
<%@ page import="onlie_test_web_app.repo.UserRepo" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/26/2024
  Time: 4:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
    <style>
        .question {
            margin-bottom: 20px;
        }

    </style>
</head>
<body>


<%
    List<Question> questions = (List<Question>) session.getAttribute("questions");
    for (Question question : questions) {
        System.out.println("question = " + question);
    }

    AnswerRepo answerRepo = new AnswerRepo();

%>
<%--<div class="container mt-5">--%>
<%--    <div class="row">--%>
<%--        <div class="col-md-8 offset-md-2">--%>

<%--            <div class="card">--%>
<%--                <div class="card-body">--%>
<%--                    <%--%>
<%--                        int i = 1;--%>
<%--                        for (Question question : questions) {--%>
<%--                            ArrayList<Answer> answers = answerRepo.getAnswers(question.getId());--%>
<%--                            System.out.println("answers = " + answers);--%>
<%--                    %>--%>
<%--                    <h5 class="card-title text-center">Online Test</h5>--%>
<%--                    <form id="testForm" action="" method="post">--%>

<%--                        <div class="question">--%>

<%--                            <div class="card-header text-center">--%>
<%--                                <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(question.getPhoto())%>"--%>
<%--                                     alt="Rasm topilmadi">--%>
<%--                            </div>--%>
<%--                            <h6>Question <%=i++%>/<%=questions.size()%>>:</h6>--%>
<%--                            <p><%=question.getQuestionText()%>--%>
<%--                            </p>--%>
<%--                            <h8>Javoblar:</h8>--%>
<%--                            <% for (Answer answer : answers) { %>--%>
<%--                            <div class="form-check">--%>
<%--                                <input class="form-check-input" type="radio" name="<%=answer.getId()%>" id="q1Option1"--%>
<%--                                       value="<%=answer.getText()%>">--%>
<%--                                <label class="form-check-label" for="q1Option1"><%=answer.getText()%>--%>
<%--                                </label>--%>
<%--                            </div>--%>

<%--                        </div>--%>

<%--                        &lt;%&ndash;                        <button type="button" class="btn btn-primary" id="nextBtn">Next</button>&ndash;%&gt;--%>
<%--                        <!-- More questions and options can be added similarly -->--%>
<%--                    </form>--%>
<%--                    <% } %>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <% } %>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Onlayn Test Sahifasi</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <span class="navbar-text">
                        Time left = <span id="timer">00:00</span>
                    </span>
                </li>
            </ul>
        </div>
    </div>
</nav>


<form action="/get/answers" method="post">
    <div class="container mt-5">
<%--        <h3>Onlayn Test Sahifasi</h3>--%>
<%--        <div>Time left = <span id="timer">00:00</span></div>--%>
        <hr>
        <ul class="list-group">
            <%
                int i = 1;
                for (Question question : questions) {
                    ArrayList<Answer> answers = answerRepo.getAnswers(question.getId());
                    System.out.println("answers = " + answers);
            %>
            <!-- Queastions ro'yxati elementlari bunda chiqariladi -->
            <div class="card-header text-center">
                <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(question.getPhoto())%>"
                     alt="Rasm topilmadi">
            </div>
            <li class="list-group-item">
                <h8>Savol:</h8>
                <p><%=question.getQuestionText()%>
                </p>
                <ul class="list-group">
                    <h8>Javoblar:</h8>
                    <% for (Answer answer : answers) { %>
                    <li class="list-group-item ">
                        <input type="radio" id="answer1" name="<%=question.getId()%>" value="<%=answer.getId()%>">
                        <label for="answer1"><%=answer.getText()%>
                        </label>
                    </li>
                    <%}%>
                </ul>
            </li>
            <br>
            <br>
            <%}%>

            <!-- <li class="list-group-item">
                <p>Question 2: ...</p>
                <ul class="list-group">
                    <li class="list-group-item">
                        <input type="radio" id="answer5" name="question2" value="A">
                        <label for="answer5">A) ...</label>
                    </li>
                    <li class="list-group-item">
                        <input type="radio" id="answer6" name="question2" value="B">
                        <label for="answer6">B) ...</label>
                    </li>
                    <li class="list-group-item">
                        <input type="radio" id="answer7" name="question2" value="C">
                        <label for="answer7">C) ...</label>
                    </li>
                    <li class="list-group-item">
                        <input type="radio" id="answer8" name="question2" value="D">
                        <label for="answer8">D) ...</label>
                    </li>
                </ul>
            </li> -->

        </ul>

        <button class="btn btn-primary mt-4">Finish</button>
    </div>
</form>


<script>
    var timeLimitInMinutes = <%=questions.size()%>;
    var timeLimitInSeconds = timeLimitInMinutes * 60;
    var timerElement = document.getElementById('timer');

    function startTimer() {
        timeLimitInSeconds--;
        var minutes = Math.floor(timeLimitInSeconds / 60);
        var seconds = timeLimitInSeconds % 60;

        if (timeLimitInSeconds < 0) {
            timerElement.textContent = '00:00';
            clearInterval(timerInterval);
            return;
        }

        if (minutes < 10) {
            minutes = '0' + minutes;
        }
        if (seconds < 10) {
            seconds = '0' + seconds;
        }

        timerElement.textContent = minutes + ':' + seconds;
    }

    var timerInterval = setInterval(startTimer, 1000);


</script>

</body>
</html>