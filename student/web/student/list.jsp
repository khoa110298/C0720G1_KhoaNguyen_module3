<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/10/2020
  Time: 12:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>list student</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <form method="post" action="/student" class="ml-auto row">
<%--        <input type="hidden" name="action" value="seach">--%>
<%--        <input type="text" name="name" >--%>
<%--        <button type="submit">Search</button>--%>
        <input type="submit"  class="btn btn-info" value="seach" name="action">
        <input type="text" width="10" style="width: 400px" class="form-control col-6" name="name">
    </form>
</nav>
<center>
    <h1>Student Management</h1>
    <h2>
        <a href="/student?action=create">Add New User</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5" class="table table-striped">


        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">phoneNumber</th>
            <th scope="col">address</th>
            <th scope="col">gender</th>
            <th scope="col" style="color: red">delete</th>
            <th scope="col" style="color: blue">edit</th>
        </tr>
        </thead>
        <c:forEach var="student" items="${studentList}">
            <tr>
                <td><c:out value="${student.id}"/></td>
                <td><c:out value="${student.name}"/></td>
                <td><c:out value="${student.phoneNumber}"/></td>
                <td><c:out value="${student.address}"/></td>
                <td><c:out value="${student.gender}"/></td>
<%--                <td><a  class="btn btn-outline-danger" href="/student?action=delete&id=${student.getId()}">delete</a></td>--%>
<%--                <td><a  class="btn btn-outline-primary" href="/student?action=edit&id=${student.getId()}">edit</a></td>--%>

                <td><button type="button" class="btn btn-outline-danger" onclick="getDelete(${student.id})"
                            data-toggle="modal" data-target="#modelDelete">delete</button></td>
                <td><button class="btn btn-outline-primary"
                            onclick="getEdit(${student.id},'${student.name}','${student.phoneNumber}','${student.address}','${student.gender}')"
                            data-toggle="modal" data-target="#modelEdit">edit</button></td>
            </tr>
        </c:forEach>
    </table>
</div>
<!-- Modal -->
<div class="modal fade" id="modelEdit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">student information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/student" method="get">
            <div class="modal-body">
                <input type="hidden" name="action" value="edit">
                <label>Id</label>
                <input type="text" class="form-control" name="id" id="idStudent" value="" readonly>
                <label>Name</label>
                <input type="text" class="form-control" name="name" id="nameStudent" value="">
                <label>Phone</label>
                <input type="text" class="form-control" name="phoneNumber" id="phoneStudent" value="">
                <label>Address</label>
                <input type="text" class="form-control" name="address" id="addressStudent" value="">
                <label>Gender</label>
                <input type="text" class="form-control" name="gender" id="genderStudent" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
                <button type="submit" class="btn btn-primary">ok</button>
            </div>
            </form>
        </div>
    </div>
</div>



<!-- Modal -->
<div class="modal fade" id="modelDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">delete student</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/student" method="get">
                <input type="hidden"  name="action" value="delete">
                <input type="hidden"  name="id" value="" id="idStudentDelete">
            <div class="modal-body">
                are you sure?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
                <button type="submit" class="btn btn-primary">ok</button>
            </div>
            </form>
        </div>
    </div>
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
<script>
    function getEdit(id,name,phone,adress,gender) {
        $('#idStudent').val(id);
        $('#nameStudent').val(name);
        $('#phoneStudent').val(phone);
        $('#addressStudent').val(adress);
        $('#genderStudent').val(gender);
    }
    function getDelete(id) {
        $('#idStudentDelete').val(id);
    }
</script>
</html>
