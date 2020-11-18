<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/18/2020
  Time: 12:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>create product</title>
</head>
<body>

<center>
    <h2>
        Add New Product
    </h2>
</center>
<div align="center">
    <form method="post" action="/product">
        <table border="1" cellpadding="5">
            <tr>
                <th>ma muon sach:</th>
                <td>
                    <input type="text" name="mamuonsach" id="mamuonsach" size="45" required/>
                </td>
            </tr>
            <tr>
                <th>tensach:</th>
                <td>
                    <input type="text" name="tensach" id="tensach" size="45" required/>
                </td>

            </tr>
            <tr>
                <th>ten hoc sinh:</th>
                <td>
                    <select name="tenhocsinh" >
                        <option value="a">nguyen van a</option>
                        <option value="b">nguyen van b</option>
                        <option value="c">nguyen van c</option>
                        <option value="d">nguyen van d</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>ngay muon:</th>
                <td>
                    <input type="date" name="tensach" id="ngaymuon" size="45" required/>
                </td>

            </tr>
            <tr>
                <th>ngay tra:</th>
                <td>
                    <input type="date" name="tensach" id="ngaytra" size="45" required/>
                </td>

            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name= "action" value="muon sach"/>
                </td>
                <td colspan="2" align="center">
                    <input type="button" name= "action" value="huy"/>
                </td>
            </tr>
        </table>
    </form>
    <h2><a href="/sach">
        tro lai dach sach sach
    </a></h2>

</div>
</body>
</html>
