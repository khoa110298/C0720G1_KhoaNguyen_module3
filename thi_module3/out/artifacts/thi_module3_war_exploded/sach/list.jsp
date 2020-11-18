<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/18/2020
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>list sach</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<center>
    <h1 style="text-align: center">Danh sach sach</h1>
</center>
<div align="center">
    <table border="1" cellpadding="5" class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Ma sach</th>
            <th scope="col">ten sach</th>
            <th scope="col">tac gia</th>
            <th scope="col">so luong</th>
            <th scope="col">mo ta</th>
            <th scope="col">tinh trang</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="sachList" items="${sachList}">
            <tr>
                <td><c:out value="${sachList.maSach}"/></td>
                <td><c:out value="${sachList.tenSach}"/></td>
                <td><c:out value="${sachList.tacGia}"/></td>
                <td><c:out value="${sachList.soluong}"/></td>
                <td><c:out value="${sachList.mota}"/></td>
                <td><a  class="btn btn-outline-primary" href="sach/create.jsp">muon</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>



<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>
