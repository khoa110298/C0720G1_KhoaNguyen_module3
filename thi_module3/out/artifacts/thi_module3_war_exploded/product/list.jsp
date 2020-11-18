<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/17/2020
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>product</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <form method="post" action="/product" class="ml-auto row">
        <input type="submit"  class="btn btn-info" value="search" name="action">
        <input type="text" width="40"  class="form-control col-6" name="name" placeholder="Search by name">
    </form>
</nav>

<center>
    <h1>Product Management</h1>
    <h2>
        <a href="/product?action=create">Add New Product</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5" class="table table-striped" id="tableProduct">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name Product</th>
            <th scope="col">Price</th>
            <th scope="col">Category</th>
            <th scope="col" style="color: red">delete</th>
            <th scope="col" style="color: blue">edit</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td><c:out value="${product.id}"/></td>
                <td><c:out value="${product.name}"/></td>
                <td><c:out value="${product.price}"/></td>
                <td><c:out value="${product.categoryId}"/></td>
                <td><a  class="btn btn-outline-danger" href="/product?action=delete&id=${product.getId()}">delete</a></td>
                <td><a  class="btn btn-outline-primary" href="/product?action=edit&id=${product.getId()}">edit</a></td>

<%--                <td><button type="button" class="btn btn-outline-danger" onclick="getDelete(${product.id})"--%>
<%--                         data-toggle="modal" data-target="#modelDelete">delete</button></td>--%>
<%--                <td><button class="btn btn-outline-primary"--%>
<%--                            onclick="getEdit(${product.id},'${product.name}','${product.price}',${product.address}"--%>
<%--                            data-toggle="modal" data-target="#modelEdit">edit</button></td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- Modal EDIT-->
<%--<div class="modal fade" id="modelEdit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">product information</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <form action="/product" method="get">--%>
<%--                <div class="modal-body">--%>
<%--                    <input type="hidden" name="action" value="edit">--%>
<%--                    <label>Id</label>--%>
<%--                    <input type="text" class="form-control" name="id" id="idProduct" value="" readonly>--%>
<%--                    <label>Name</label>--%>
<%--                    <input type="text" class="form-control" name="name" id="nameProduct" value="">--%>
<%--                    <label>price</label>--%>
<%--                    <input type="text" class="form-control" name="price" id="price" value="">--%>
<%--                    <label>categoryId</label>--%>
<%--                    <input type="text" class="form-control" name="categoryId" id="categoryId" value="">--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>--%>
<%--                    <button type="submit" class="btn btn-primary">ok</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>



<!-- Modal DELETE-->
<%--<div class="modal fade" id="modelDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">delete product</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <form action="/product" method="get">--%>
<%--                <input type="hidden"  name="action" value="delete">--%>
<%--                <input type="hidden"  name="id" value="" id="idProductDelete">--%>
<%--                <div class="modal-body">--%>
<%--                    are you sure?--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>--%>
<%--                    <button type="submit" class="btn btn-primary">ok</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--modal create--%>
<%--<div class="modal fade" id="modelCreate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">create employee</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <form method="get" action="/employee">--%>
<%--                <input type="hidden" name="action" value="create">--%>
<%--                <div class="modal-body">--%>
<%--                    <div align="center">--%>
<%--                        <label>name</label><br>--%>
<%--                        <input type="text" name="nameProduct"><br>--%>
<%--                        <label>price</label><br>--%>
<%--                        <input type="text" name="price"><br>--%>
<%--                        <label>categoryId</label><br>--%>
<%--                        <input type="text" name="categoryId"><br>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>--%>
<%--                    <button type="submit" class="btn btn-primary">ok</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>




<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</body>
<script>
    function getEdit(id,name,price,categoryId) {
        $('#idProduct').val(id);
        $('#nameProduct').val(name);
        $('#price').val(price);
        $('#categoryId').val(categoryId);

    }
    function getDelete(id) {
        $('#idProductDelete').val(id);
    }

    $(document).ready(function() {
        $('#tableProduct').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</html>
