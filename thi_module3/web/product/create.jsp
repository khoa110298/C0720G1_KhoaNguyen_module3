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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<center>
    <h2>
        Add New Product
    </h2>
</center>
<div align="center">
    <form method="post" action="/product">
        <input type="hidden" name="action" value="create">
        <table border="1" cellpadding="5">
            <tr>
                <th>name product:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" required/>

                </td>
            </tr>
            <tr>
                <th>price:</th>
                <td>
                    <input type="text" name="price" id="price" size="45" required/>
                </td>
            </tr>
            <tr>
                <th>categoryId:</th>
                <td>
                   <select name="categoryId">
                           <c:forEach items="${categoryList}" var="category">
                               <option value="${category.getCategoryId()}">${category.getCategoryName()}</option>
                           </c:forEach>
                   </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name= "action" value="save"/>
                </td>
            </tr>
        </table>
    </form>
    <h2><a href="/product">
        back to list product
    </a></h2>

</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

</html>
