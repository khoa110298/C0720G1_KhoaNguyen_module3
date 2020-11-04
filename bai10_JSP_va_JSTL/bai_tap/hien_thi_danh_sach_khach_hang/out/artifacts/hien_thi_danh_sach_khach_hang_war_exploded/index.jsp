<%@ page import="home.KhachHang" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.CustomerDao" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/3/2020
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  </head>
  <body>
  <%
  List<KhachHang> khachHangList = CustomerDao.getKhachHang();
  request.setAttribute("listKhachHang",khachHangList);
  %>
  <h2 style="text-align: center">Danh sách Khách hàng</h2>
  <table class="table">
    <thead>
    <tr>
      <th scope="col">tên</th>
      <th scope="col">ngày sinh</th>
      <th scope="col">địa chỉ</th>
      <th scope="col">hình ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="khachhang" items="${listKhachHang}">
      <tr>

        <td><c:out value="${khachhang.name}"/></td>
        <td><c:out value="${khachhang.dayOfBirth}"/></td>
        <td><c:out value="${khachhang.address}"/></td>
        <td>
          <img style="width: 100px;height: 100px" src="<c:out value="${khachhang.image}"/>">
        </td>
      </tr>

    </c:forEach>

    </tbody>
  </table>

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
