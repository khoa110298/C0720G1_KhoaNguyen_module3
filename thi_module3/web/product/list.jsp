<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/17/2020
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>product</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"--%>
<%--          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <form method="post" action="/product" class="ml-auto row">
        <input type="submit"  class="btn btn-info" value="search" name="action">
        <input type="text" width="40"  class="form-control col-6" name="name" placeholder="Search by name">
    </form>
</nav>

<center>
    <h1>Danh sach benh an</h1>
</center>
<div align="center">
    <table border="1" cellpadding="5" class="table table-striped" id="tableProduct">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ma benh an</th>
            <th scope="col">ma benh nhan</th>
            <th scope="col">ten benh nhan</th>
            <th scope="col">ngay nhap vien</th>
            <th scope="col">ngay ra vien</th>
            <th scope="col">ly do nhap vien</th>
            <th scope="col" style="color: blue">edit</th>
            <th scope="col" style="color: red">delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td><c:out value="${product.STT}"/></td>
                <td><c:out value="${product.idBenhAn}"/></td>
                <td><c:out value="${product.idBenhNhan}"/></td>
                <td><c:out value="${product.tenBenhNhan}"/></td>
                <td><c:out value="${product.ngayNhapVien}"/></td>
                <td><c:out value="${product.ngayRaVien}"/></td>
                <td><c:out value="${product.lyDo}"/></td>

                <td><a  class="btn btn-outline-primary" href="/danhsachbenhan?action=edit&id=${product.STT}">edit</a></td>

                <td><button type="button" class="btn btn-outline-danger" onclick="getDelete(${product.STT})"
                         data-toggle="modal" data-target="#modelDelete">delete</button></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h2 style="text-align: center;color: yellow">${thanhcong}</h2>
</div>


<!-- Modal DELETE-->
<div class="modal fade" id="modelDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">delete product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/danhsachbenhan" method="get">
                <input type="hidden"  name="action" value="delete">
                <input type="hidden"  name="id" value="" id="idProductDelete">
                <div class="modal-body">
                    are you sure?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
                    <button type="submit" class="btn btn-primary">ok</button>
                </div>
            </form>
        </div>
    </div>
</div>






<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="bootstrap413/js/bootstrap.js"></script>

<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"--%>
<%--        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"--%>
<%--        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"--%>
<%--        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"--%>
<%--        crossorigin="anonymous"></script>--%>
</body>
<script>

    function getDelete(id) {
        $('#idProductDelete').val(id);
    }

    $(document).ready(function() {
        $('#tableProduct').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        } );
    } );
</script>
</html>
