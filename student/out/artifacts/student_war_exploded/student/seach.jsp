<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/10/2020
  Time: 9:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>seach student</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<center>
    <h2>
        <a href="/student">back to list student</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5" class="table table-striped">


        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">phoneNumber</th>
            <th scope="col">address</th>
            <th scope="col">gender</th>
            <th scope="col" style="color: red">delete</th>
            <th scope="col" style="color: blue">edit</th>
        </tr>
        </thead>
        <c:forEach var="student" items="${student}">
            <tr>
                <td><c:out value="${student.id}"/></td>
                <td><c:out value="${student.name}"/></td>
                <td><c:out value="${student.phoneNumber}"/></td>
                <td><c:out value="${student.address}"/></td>
                <td><c:out value="${student.gender}"/></td>
                <td><a style="color: red" href="/student?action=delete&id=${student.getId()}">delete</a></td>
                <td><a style="color: blue" href="/student?action=edit&id=${student.getId()}">edit</a></td>
            </tr>
        </c:forEach>
    </table>
    <h2><a href="/student" style="color: maroon">
        back
    </a> </h2>
</div>



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
