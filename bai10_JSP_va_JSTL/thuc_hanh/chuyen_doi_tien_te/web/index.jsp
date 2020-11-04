<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/3/2020
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Currency Converter</title>
    <link rel="stylesheet" type="text/css" href="stype.css">
  </head>
  <body>
  <h2>Currency Converter</h2>
  <form action="converter.jsp" method="post">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE"/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
  </form>
  </body>
</html>
