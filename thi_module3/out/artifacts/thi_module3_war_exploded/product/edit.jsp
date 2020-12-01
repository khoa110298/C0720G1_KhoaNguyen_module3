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
    <title>edit</title>
</head>
<body>
<center>
    <h2>
        sua thong tin benh an
    </h2>
</center>
<div align="center">
    <form method="post" action="/danhsachbenhan">
        <input type="hidden" name="action" value="edit">
        <table border="1" cellpadding="5">
            <%--            <c:if test="${product != null}">--%>
            <%--                <input type="hidden" name="id" value="<c:out value='${product.id}' />"/>--%>
            <%--            </c:if>--%>

            <tr>
                <th>STT:</th>
                <td>
                    <input type="text" name="id" size="45"
                           value="<c:out value='${danhSachBenhAn.STT}'/>" readonly/>
                </td>
            </tr>
            <tr>
                <th>ma benh an:</th>
                <td>
                    <input type="text" name="maBenhAn" size="45"
                           value="<c:out value='${danhSachBenhAn.idBenhAn}'/>" readonly/>
                </td>
            </tr>
                <tr>
                    <th>ma benh nhan:</th>
                    <td>
                        <input type="text" name="maBenhNhan" size="45"
                               value="<c:out value='${danhSachBenhAn.idBenhNhan}'/>" readonly/>
                    </td>
                </tr>
                <tr>
                    <th>ten benh nhan:</th>
                    <td>
                        <input type="text" name="tenbanhnhan" size="45" pattern="\\{D}+"
                               title="khong duoc so">
                               value="<c:out value='${danhSachBenhAn.tenBenhNhan}'/>"
                    </td>
                </tr>
                <tr>
                    <th>ngay nhap vien:</th>
                    <td>
                        <input type="date" name="ngayNhapVien" size="45"
                               value="<c:out value='${danhSachBenhAn.ngayNhapVien}'/>   " />
                    </td>
                </tr>
                <tr>
                    <th>ngay ra vien:</th>
                    <td>
                        <input type="date" name="ngayRaVien" size="45"
                               value="<c:out value='${danhSachBenhAn.ngayRaVien}'/>" />
                    </td>
                </tr>
                <tr>
                    <th>ly do:</th>
                    <td>
                        <input type="text" name="lyDo" size="45"
                               value="<c:out value='${danhSachBenhAn.lyDo}'/>" readonly/>
                    </td>
                </tr>
                <tr>
                    <th>phuong phap dieu tri: </th>
                    <td>
                        <input type="text" name="maBenhAn" size="45"/>" />
                    </td>
                </tr>
                <tr>
                    <th>bac si dieu tri:</th>
                    <td>
                        <input type="text" name="maBenhAn" size="45" />
                    </td>
                </tr>


            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
                <td colspan="2" align="center">
                    <a href="/danhsachbenhan">tro lai</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
