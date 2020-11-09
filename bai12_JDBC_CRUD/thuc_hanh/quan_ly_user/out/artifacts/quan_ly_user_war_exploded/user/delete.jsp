<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/9/2020
  Time: 2:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
<h1>Delete User</h1>
<p>
    <a href="/users">Back To User List</a>
</p>
<form method="get">
    <h3>Delete User Now</h3>
    <fieldset>
        <legend>User information</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td>${requestScope["User"].getName()}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${requestScope["User"].getEmail()}</td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>${requestScope["User"].getCountry()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete User"></td>
            </tr>

        </table>
    </fieldset>

</form>
</body>
</html>
