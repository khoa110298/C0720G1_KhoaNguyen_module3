<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/3/2020
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<%
    Map<String,String> dic = new HashMap<>();
%>
<%
    dic.put("one","số 1");
    dic.put("two","số 2");
    dic.put("three","số 3");
    dic.put("four","số 4");
    dic.put("five","số 5");
    dic.put("six","số 6");
    dic.put("seven","số 7");
    dic.put("eight","số 8");
    dic.put("nine","số 9");
    dic.put("ten","số 10");
    dic.put("hello","xin chào");
    dic.put("what","cái gì");
    dic.put("how","thế nào");
    dic.put("book","quyển sách");
    dic.put("computer","máy tính");
    dic.put("school","trường học");

    String seach = request.getParameter("seach");

    String result = dic.get(seach);
    if (result != null){
        out.println("English: " + seach);
        out.println();
        out.println("VietNamese: " + result);
    } else {
        out.println("không dịch được");
    }
%>

</body>
</html>
