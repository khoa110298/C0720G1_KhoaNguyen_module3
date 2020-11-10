<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/10/2020
  Time: 1:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>create student</title>
</head>
<body>
<center>
    <h2>
        <a href="/student">List All Student</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Student</h2>
            </caption>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>phoneNumber:</th>
                <td>
                    <input type="text" name="phoneNumber" id="phoneNumber" size="45"/>
                </td>
            </tr>
            <tr>
                <th>address:</th>
                <td>
                    <input type="text" name="address" id="address" size="15"/>
                </td>
            </tr>
            <tr>
                <th>gender:</th>
                <td>
                    <input type="text" name="gender" id="gender" size="15"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a href="/student">
                        <input type="submit" value="Save"/>
                    </a>

                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
