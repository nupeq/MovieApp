<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <meta charset="utf-8">
    <title>Search</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="//netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://heroku.github.com/template-app-bootstrap/heroku.css" rel="stylesheet">
    <!-- /// -->

</head>

<body>
<div class="container">
    <a href="../">Top 20</a>
    <div class="row">
        <div class="span8 offset2">

            <form:form method="post" action="../search/" commandName="movieSearch" class="form-vertical">
                <form:label path="genre">Genre</form:label>
                <form:input path="genre"></form:input>
                <form:errors path="genre"></form:errors>
                <form:label path="minRating">Minimum rating</form:label>
                <form:input path="minRating"></form:input>
                <form:errors path="minRating"></form:errors>
                </br><input type="submit" value="Search" class="btn"/>
            </form:form>

        </div>
    </div>
<c:choose>
    <c:when test="${empty movies}">
        <p>Nothing found</p>
    </c:when>
    <c:otherwise>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>Title</th>
                <th>Average Votes</th>
                <th>Details</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${movies}" var="movie">
                <tr>
                    <td>${movie.title}</td>
                    <td>${movie.voteAverage}</td>
                    <td><a href="../movie/${movie.id}/">Details</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
</div>

</body>

</html>
