<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/17/2020
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
  </head>
  <body>
  <nav class="navbar navbar-light bg-light">
    <form method="post" action="/product" class="ml-auto row">
      <input type="submit"  class="btn btn-info" value="search" name="action">
      <input type="text" width="40"  class="form-control col-6" name="name" placeholder="Search by name">
    </form>
  </nav>

<%--  <select name="typeId">--%>
<%--                            <option value="1" selected>diamond</option>--%>
<%--                            <option value="2">platinium</option>--%>
<%--                            <option value="3">gold</option>--%>
<%--                            <option value="4">silver</option>--%>
<%--                            <option value="5">menber</option>--%>

<%--    <c:forEach items="${customerTypeList}" var="customerType">--%>
<%--      <option value="${customerType.id}" ${typeId == customerType.id ? "selected" : ""}>${customerType.name}</option>--%>
<%--    </c:forEach>--%>
<%--  </select>--%>

<%--  <div class="valid-feedback">--%>
<%--    Looks good!--%>
<%--  </div>--%>

  <script src="jquery/jquery-3.5.1.min.js"></script>
  <script src="datatables/js/jquery.dataTables.min.js"></script>
  <script src="datatables/js/dataTables.bootstrap4.min.js"></script>
  </body>
</html>
