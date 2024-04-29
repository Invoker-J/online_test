<%@ page import="onlie_test_web_app.entity.enums.TestLevel" %>
<%@ page import="onlie_test_web_app.entity.Science" %>
<%@ page import="onlie_test_web_app.repo.ScienceRepo" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/26/2024
  Time: 2:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
</head>
<body>

<%
    ScienceRepo scienceRepo = new ScienceRepo();
    List<Science> sciences = scienceRepo.findAll();
%>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">

                    <div class="card-header bg-primary text-white text-center">
                        Test settings
                    </div>

                    <form action="/test/settings" method="post">

                        <div class="form-group">
                            <label for="subject">Subject:</label>
                            <select name="scienceId" class="form-control" id="subject">
                                <option value="" selected disabled>Select Science</option>
                                <% for (Science science : sciences) { %>
                                <option value="<%=science.getId()%>"><%=science.getName()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="orderType">Order Type</label>
                            <select name="orderType" class="form-control" id="orderType">
                                <option value="random">Random</option>
                                <option value="order">Order</option>
                            </select>
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
                            <label for="amount">How many?</label>
                            <input name="amount" type="number" class="form-control" id="amount" placeholder="Enter amount">
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="index.jsp" class="btn btn-primary text-white text-center">Back</a>
                            <button class="btn btn-primary text-white text-center">Start</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
