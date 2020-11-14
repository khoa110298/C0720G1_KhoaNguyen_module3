<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/12/2020
  Time: 9:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="sidebar">
    <div class="sidebarright">
        <center>
            <h1>Find Customer By Name</h1>
            <h2>
                <a href="/customer?action=search">bac to list customer</a>
            </h2>
        </center>
        <div>
            <table border="1" class="table table-striped" style="color: darkblue">
                <tr>
                    <th>ID</th>
                    <th>typeId</th>
                    <th>name</th>
                    <th>birthday</th>
                    <th>gender</th>
                    <th>idCard</th>
                    <th>phone</th>
                    <th>email</th>
                    <th>address</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td><c:out value="${customer.id}"/></td>
                        <td><c:out value="${customer.typeId}"/></td>
                        <td><c:out value="${customer.name}"/></td>
                        <td><c:out value="${customer.birthday}"/></td>
                        <td><c:out value="${customer.gender}"/></td>
                        <td><c:out value="${customer.idCard}"/></td>
                        <td><c:out value="${customer.phone}"/></td>
                        <td><c:out value="${customer.email}"/></td>
                        <td><c:out value="${customer.address}"/></td>
                        <td>
                            <a href="/customer?action=edit&id=${customer.id}" class="btn btn-primary">Edit</a>
                        </td>
                        <td> <a href="/customer?action=delete&id=${customer.id}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>



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
