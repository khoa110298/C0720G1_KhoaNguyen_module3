<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/3/2020
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Simple Dictionary</title>
    <style>
      input[type=text] {
        width: 300px;
        font-size: 16px;
        border: 2px solid #ccc;
        border-radius: 4px;
        padding: 12px 10px 12px 10px;
      }
      #submit {
        border-radius: 2px;
        padding: 10px 32px;
        font-size: 16px;
      }
    </style>
  </head>
  <body>
  <h2>Vietnamese Dictionnary</h2>
  <form method="post" action="dictionary.jsp">
    <input type="text" name="seach" placeholder="nhập từ cần tra">
    <input type="submit" id="submit" value="Seach">
  </form>
  </body>
</html>
