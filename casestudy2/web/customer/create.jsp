<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/12/2020
  Time: 12:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create customer</title>
</head>
<body>
<center>
    <h2>
        Add New Customer
    </h2>
</center>
<div align="center">
    <form method="post" action="/customer">
        <table border="1" cellpadding="5">
            <tr>
                <th>typeId:</th>
                <td>
                    <select name="typeId">
<%--                        <option value="1" selected>diamond</option>--%>
<%--                        <option value="2">platinium</option>--%>
<%--                        <option value="3">gold</option>--%>
<%--                        <option value="4">silver</option>--%>
<%--                        <option value="5">menber</option>--%>

                        <c:forEach items="${customerTypeList}" var="customerType">
                            <option value="${customerType.id}">${customerType.name}</option>
                        </c:forEach>
                    </select>

                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Birthday:</th>
                <td>
                    <input type="date" name="birthday" id="birthday" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td>
                    <input type="text" name="gender" id="gender" size="45"/>
                </td>
            </tr>
            <tr>
                <th>IdCard:</th>
                <td>
                    <input type="text" name="idCard" id="idCard" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" id="adress" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name= "action" value="create"/>
                </td>
            </tr>
        </table>
    </form>
    <h2><a href="/customer">
        back to list customer
    </a></h2>
</div>

</body>
</html>
