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
    <title>list custmer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
            <a class="navbar-brand" href="index.jsp"><h4 style="color: red">Home</h4></a>
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
                <form class="form-inline my-2 my-lg-0" method="post" action="/customer">
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
            <h1>Customer Manager</h1>
            <h2>
                <a href="/customer?action=create">Add New Customer</a>
            </h2>
        </center>
        <div>
            <table id="tableCustomer" border="1" class="table table-striped" style="color: darkblue">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>typeId</th>
                    <th>name</th>
                    <th>birthday</th>
                    <th>gender</th>
                    <th>idCard</th>
                    <th>phone</th>
                    <th>email</th>
                    <th>address</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td><c:out value="${customer.id}"/></td>
                        <td><c:out value="${customer.typeId}"/></td>
                        <td><c:out value="${customer.name}"/></td>
                        <td><c:out value="${customer.birthday}"/></td>
                        <td><c:out value="${customer.gender}"/></td>
                        <td><c:out value="${customer.idCard}"/></td>
                        <td><c:out value="${customer.phone}"/></td>
                        <td><c:out value="${customer.email}"/></td>
                        <td><c:out value="${customer.address}"/></td>
                        <td>
<%--                            <a href="/customer?action=edit&id=${customer.id}" class="btn btn-primary">Edit</a>--%>
                              <button type="button" class="btn btn-primary"
                                      onclick="editCustomer(${customer.id},${customer.typeId},'${customer.name}','${customer.birthday}',${customer.gender},'${customer.idCard}','${customer.phone}','${customer.email}','${customer.address}')"
                                      data-toggle="modal" data-target="#modelEdit">edit</button>
                        </td>
                        <td> <a href="/customer?action=delete&id=${customer.id}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h2 style="text-align: center;color: yellow">${thanhcong}</h2>
        </div>

    </div>
</div>



<!-- Modal -->
<div class="modal fade" id="modelEdit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Student</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="/customer">
            <div class="modal-body">
                <input type="hidden" name="action" value="edit">
                <label>Id</label><br>
                <input type="text" name="id" value="" readonly id="id"><br>
                <label>typeId</label><br>
                <select name="typeId" id="typeId">
                    <option value="1" selected>diamond</option>
                    <option value="2">plantium</option>
                    <option value="3">gold</option>
                    <option value="4">silver</option>
                    <option value="5">member</option>
                </select><br>
                <label>name</label><br>
                <input type="text" name="name" value="" id="name"><br>
                <label>birthday</label><br>
                <input type="text" name="birthday" value="" id="birthday"><br>
                <label>gender</label><br>
                <select name="gender" id="gender">
                    <option value="0" selected>nữ</option>
                    <option value="1">nam</option>
                </select><br>
                <label>idCard</label><br>
                <input type="text" name="idCard" value="" id="idCard"><br>
                <label>phone</label><br>
                <input type="text" name="phone" value="" id="phone"><br>
                <label>email</label><br>
                <input type="text" name="email" value="" id="email"><br>
                <label>address</label><br>
                <input type="text" name="address" value="" id="address">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
                <button type="submit" class="btn btn-primary">ok</button>
            </div>
            </form>
        </div>
    </div>
</div>


<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>
</body>

<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
    function editCustomer(id,typeId,name,birthday,gender,idCard,phone,email,address) {
        $('#id').val(id);
        $('#typeId').val(typeId);
        $('#name').val(name);
        $('#birthday').val(birthday);
        $('#gender').val(gender);
        $('#idCard').val(idCard);
        $('#phone').val(phone);
        $('#email').val(email);
        $('#address').val(address);
    }
</script>
</html>
