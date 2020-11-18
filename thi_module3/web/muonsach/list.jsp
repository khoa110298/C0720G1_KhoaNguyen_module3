<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/18/2020
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>muon sach</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<center>
    <h1 style="text-align: center">thong ke sach dang cho muon</h1>
</center>
<div align="center">
    <table border="1" cellpadding="5" class="table table-striped">
        <thead>
        <tr>
            <th scope="col">ma muon sach</th>
            <th scope="col">ten sach</th>
            <th scope="col">tac gia</th>
            <th scope="col">ten hoc sinh</th>
            <th scope="col">lop</th>
            <th scope="col">ngay muon</th>
            <th scope="col">ngay tra</th>
            <th scope="col">tra sach</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="muonSachList" items="${muonSachList}">
            <tr>
                <td><c:out value="${muonSachList.maMuonSach}"/></td>
                <td><c:out value="${muonSachList.tenSach}"/></td>
                <td><c:out value="${muonSachList.tacGia}"/></td>
                <td><c:out value="${muonSachList.tenHocSinh}"/></td>
                <td><c:out value="${muonSachList.lop}"/></td>
                <td><c:out value="${muonSachList.ngayMuon}"/></td>
                <td><c:out value="${muonSachList.ngayTra}"/></td>

                <td>
                    <button type="button" class="btn btn-primary" onclick="getDelete(${muonSachList.maMuonSach})"
                            data-toggle="modal" data-target="#modelId">tra sach</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>



<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form>
                <input type="hidden"  name="action" value="delete">
                <input type="hidden"  name="mamuonsach" value="" id="idProductDelete">
            <div class="modal-body">
                are you sure?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">khong</button>
                <button type="submit" class="btn btn-primary">tra sach</button>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal DELETE-->
<%--<div class="modal fade" id="modelDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">delete product</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <form action="/muonsach" method="get">--%>
<%--                <input type="hidden"  name="action" value="delete">--%>
<%--                <input type="hidden"  name="id" value="" id="idProductDelete">--%>
<%--                <div class="modal-body">--%>
<%--                    are you sure?--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">khong</button>--%>
<%--                    <button type="submit" class="btn btn-primary">tra sach</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</body>

<script>
    function getDelete(id) {
        $('#idProductDelete').val(id);
    }
</script>
</html>
