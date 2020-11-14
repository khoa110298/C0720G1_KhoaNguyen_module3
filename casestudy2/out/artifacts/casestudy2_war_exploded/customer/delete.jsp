<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/12/2020
  Time: 11:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>delete customer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="/customer">Back to customer list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>typeId: </td>
                <td>${customer.typeId}</td>
            </tr>
            <tr>
                <td>name: </td>
                <td>${customer.name}</td>
            </tr>
            <tr>
                <td>birthday: </td>
                <td>${customer.birthday}</td>
            </tr>
            <tr>
                <td>gender: </td>
                <td>${customer.gender}</td>
            </tr>
            <tr>
                <td>idCard: </td>
                <td>${customer.idCard}</td>
            </tr>
            <tr>
                <td>phone: </td>
                <td>${customer.phone}</td>
            </tr>
            <tr>
                <td>email: </td>
                <td>${customer.email}</td>
            </tr>
            <tr>
                <td>address: </td>
                <td>${customer.address}</td>
            </tr>
            <tr>
                <td><input type="submit" class="btn btn-outline-danger" value="Delete customer"></td>
                <td><a type="button" class="btn btn-outline-primary" href="/customer">cancel</a></td>
            </tr>
        </table>
    </fieldset>
</form>






<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
