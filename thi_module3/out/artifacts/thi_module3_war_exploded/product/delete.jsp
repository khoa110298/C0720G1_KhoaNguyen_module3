<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/18/2020
  Time: 12:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>delete prduct</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<form method="post" >
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>product information</legend>
        <table>
            <tr>
                <td>id: </td>
                <td>${product.id}</td>
            </tr>
            <tr>
                <td>name: </td>
                <td>${product.name}</td>
            </tr>
            <tr>
                <td>price: </td>
                <td>${product.price}</td>
            </tr>
            <tr>
                <td>categoryId: </td>
                <td>${product.categoryId}</td>
            </tr>
            <tr>
                <td><input type="submit" class="btn btn-outline-danger" value="Delete product"></td>
                <td><a type="button" class="btn btn-outline-primary" href="/product">cancel</a></td>
            </tr>
        </table>
    </fieldset>
</form>



<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>
