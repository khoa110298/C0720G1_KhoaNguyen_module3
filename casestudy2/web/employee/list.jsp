<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/11/2020
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>study</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        #head {
            background-color: blue;
            height: 150px;
            position: fixed;
            z-index: 9;
        }

        .headbottom {
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
        }

        .headtop {
            float: left;
            position: absolute;
            top: 20px;
        }

        .headright {
            float: right;
            position: absolute;
            top: 20px;
            right: 20px;
        }
        #abc{
            margin-left: 100px;
        }
        .sidebar{
            width: 100%;
            position: relative;
            top:150px;
            min-height: 1000px;
        }
        .sidebarright {
            width: 100%;
            position: absolute;
            min-height: 800px;
        }

        h1{
            text-align: center;
            color: darkred;
            padding-top: 20px;
        }
    </style>
</head>
<body>
<div id="head" class="container-fluid">
    <div class="headtop">
        <a href="#">
            <img src="anh/0.png" height="50px" width="50px">
        </a>
    </div>
    <div class="headright">
        <h3>nguyễn khoa</h3>
    </div>
    <div class="headbottom">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#"><h4 style="color: red">Home</h4></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul id="abc" class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/employee">Employee <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/customer">Customer <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/service">Service <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/contract">Contract <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0" method="post" action="/employee">
                    <input type="hidden" name="action" value="search">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="name">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
</div>
<div class="sidebar">
    <div class="sidebarright">
        <center>
            <h1>Employee Manager</h1>
            <h2>
<%--                <a href="/customer?action=create">Add New Customer</a>--%>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modelCreate">Add New Employee</button>
            </h2>
        </center>
        <div>
            <table border="1" class="table table-striped" style="color: darkblue">
                <tr>
                    <th>ID</th>
                    <th>name</th>
                    <th>birthday</th>
                    <th>idCard</th>
                    <th>salary</th>
                    <th>phone</th>
                    <th>email</th>
                    <th>address</th>
                    <th>positionId</th>
                    <th>educationDegreeId</th>
                    <th>divisionId</th>
                    <th>userName</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="employee" items="${employeeList}">
                    <tr>
                        <td><c:out value="${employee.id}"/></td>
                        <td><c:out value="${employee.name}"/></td>
                        <td><c:out value="${employee.birthday}"/></td>
                        <td><c:out value="${employee.idCard}"/></td>
                        <td><c:out value="${employee.salary}"/></td>
                        <td><c:out value="${employee.phone}"/></td>
                        <td><c:out value="${employee.email}"/></td>
                        <td><c:out value="${employee.address}"/></td>
                        <td><c:out value="${employee.positionId}"/></td>
                        <td><c:out value="${employee.educationDegreeId}"/></td>
                        <td><c:out value="${employee.divisionId}"/></td>
                        <td><c:out value="${employee.userName}"/></td>
                        <td>
                             <a href="/employee?action=edit&id=${employee.id}" class="btn btn-primary">Edit</a>
                        </td>
                        <td>
<%--                            <a href="/employee?action=delete&id=${employee.id}" class="btn btn-danger">Delete</a>--%>
                                <button type="button" class="btn btn-danger" onclick="getIdEmployee(${employee.id})"
                                        data-toggle="modal" data-target="#modelDelete">delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>



<!-- Modal -->
<div class="modal fade" id="modelDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="get" action="/employee">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" id="idEmployee" value="">
            <div class="modal-body">
                ARE YOU SURE
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
                <button type="submit" class="btn btn-primary">ok</button>
            </div>
            </form>
        </div>
    </div>
</div>




<!-- modal create -->
<div class="modal fade" id="modelCreate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">create employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="get" action="/employee">
                <input type="hidden" name="action" value="create">
            <div class="modal-body">
                <div align="center">
                    <label>name</label><br>
                    <input type="text" name="nameEmployee"><br>
                    <label>birthday</label><br>
                    <input type="text" name="birthday"><br>
                    <label>idCard</label><br>
                    <input type="text" name="idCard"><br>
                    <label>salary</label><br>
                    <input type="text" name="salary"><br>
                    <label>phone</label><br>
                    <input type="text" name="phone"><br>
                    <label>email</label><br>
                    <input type="text" name="email"><br>
                    <label>address</label><br>
                    <input type="text" name="address"><br>
                    <label>positionId</label><br>
                    <select name="positionId">
                        <option value="1" selected>lễ tân</option>
                        <option value="2">phục vụ</option>
                        <option value="3">chuyên viên</option>
                        <option value="4">giám sát</option>
                        <option value="5">quản lý</option>
                        <option value="6">giám đốc</option>
                    </select><br>
                    <label>educationDegreeId</label><br>
                    <select name="educationDegreeId">
                        <option value="1" selected>trung cấp</option>
                        <option value="2">cao đẳng</option>
                        <option value="3">đại học</option>
                        <option value="4">sau đại học</option>
                    </select><br>
                    <label>divisionId</label><br>
                    <select name="divisionId">
                        <option value="1" selected>sale-marketing</option>
                        <option value="2">hành chính</option>
                        <option value="3">phục vụ</option>
                        <option value="4">quản lý</option>
                    </select><br>
                    <label>userName</label><br>
                    <select name="userName">
                        <option value="hung" selected>hung</option>
                        <option value="khoa">khoa</option>
                        <option value="long">long</option>
                        <option value="luyen">luyen</option>
                        <option value="phuc">phuc</option>
                    </select>

                </div>
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
    function getIdEmployee(id) {
        $('#idEmployee').val(id);
    }
</script>
</html>
