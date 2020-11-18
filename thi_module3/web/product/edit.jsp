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
        <a href="/employee">List All Employee</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="/product">
        <input type="hidden" name="action" value="edit">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Product
                </h2>
            </caption>
<%--            <c:if test="${product != null}">--%>
<%--                <input type="hidden" name="id" value="<c:out value='${product.id}' />"/>--%>
<%--            </c:if>--%>

            <tr>
                <th>Id:</th>
                <td>
                    <input type="text" name="id" size="45"
                           value="<c:out value='${product.id}'/>" readonly/>
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${product.name}' />"/>
                </td>
            </tr>
            <tr>
                <th>price:</th>
                <td>
                    <input type="text" name="price" size="45"
                           value="<c:out value='${product.price}' />"/>
                </td>
            </tr>
            <tr>
                <th>categoryId:</th>
                <td>
                    <input type="text" name="categoryId" size="45"
                           value="<c:out value='${product.categoryId}' />"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
