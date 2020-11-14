<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/13/2020
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>edit employee</title>
</head>
<body>
<center>
    <h2>
        <a href="/employee">List All Employee</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="/employee">
        <input type="hidden" name="action" value="edit">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Student
                </h2>
            </caption>
            <c:if test="${employee != null}">
                <input type="hidden" name="id" value="<c:out value='${employee.id}' />"/>
            </c:if>

            <tr>
                <th>Id:</th>
                <td>
                    <input type="text" name="id" size="45"
                           value="<c:out value='${employee.id}' />" readonly/>
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${employee.name}' />"/>
                </td>
            </tr>
            <tr>
                <th>birthday:</th>
                <td>
                    <input type="text" name="birthday" size="45"
                           value="<c:out value='${employee.birthday}' />"/>
                </td>
            </tr>
            <tr>
                <th>idCard:</th>
                <td>
                    <input type="text" name="idCard" size="45"
                           value="<c:out value='${employee.idCard}' />"/>
                </td>
            </tr>
            <tr>
                <th>salary:</th>
                <td>
                    <input type="text" name="salary" size="45"
                           value="<c:out value='${employee.salary}' />"/>
                </td>
            </tr>
            <tr>
                <th>phone:</th>
                <td>
                    <input type="text" name="phone" size="45"
                           value="<c:out value='${employee.phone}' />"/>
                </td>
            </tr>
            <tr>
                <th>email:</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="<c:out value='${employee.email}' />"/>
                </td>
            </tr>
            <tr>
                <th>address:</th>
                <td>
                    <input type="text" name="address" size="45"
                           value="<c:out value='${employee.address}' />"/>
                </td>
            </tr>
            <tr>
                <th>positionId:</th>
                <td>
                    <input type="text" name="positionId" size="45"
                           value="<c:out value='${employee.positionId}' />"/>
                </td>
            </tr>
            <tr>
                <th>educationDegreeId:</th>
                <td>
                    <input type="text" name="educationDegreeId" size="45"
                           value="<c:out value='${employee.educationDegreeId}' />"/>
                </td>
            </tr>
            <tr>
                <th>divisionId:</th>
                <td>
                    <input type="text" name="divisionId" size="45"
                           value="<c:out value='${employee.divisionId}' />"/>
                </td>
            </tr>
            <tr>
                <th>userName:</th>
                <td>
                    <input type="text" name="userName" size="45"
                           value="<c:out value='${employee.userName}' />"/>
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
