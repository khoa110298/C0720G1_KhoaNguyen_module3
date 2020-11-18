<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/18/2020
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>search</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <form method="post" action="/product" class="ml-auto row">
        <input type="submit"  class="btn btn-info" value="search" name="action">
        <input type="text" width="40"  class="form-control col-6" name="name" placeholder="Search by ????">
    </form>
</nav>

<div class="sidebar">
    <div class="sidebarright">
        <center>
            <h1>Find Product By Name</h1>
            <h2>
                <a href="/product?action=search">back to list product</a>
            </h2>
        </center>
        <div>
            <table border="1" cellpadding="5" class="table table-striped" id="tableProduct">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name Product</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col" style="color: red">delete</th>
                    <th scope="col" style="color: blue">edit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${productList}">
                    <tr>
                        <td><c:out value="${product.id}"/></td>
                        <td><c:out value="${product.name}"/></td>
                        <td><c:out value="${product.price}"/></td>
                        <td><c:out value="${product.categoryId}"/></td>
                        <td><a  class="btn btn-outline-danger" href="/product?action=delete&id=${product.getId()}">delete</a></td>
                        <td><a  class="btn btn-outline-primary" href="/product?action=edit&id=${product.getId()}">edit</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>



<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>
