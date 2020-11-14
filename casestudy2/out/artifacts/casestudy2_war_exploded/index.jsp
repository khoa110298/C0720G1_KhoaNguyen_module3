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
        .footer{
            position: absolute;
            bottom:0;
            width: 100%;
            height: 200px;
            background-color: blueviolet;
        }
        h1{
            text-align: center;
            color: darkred;
            padding-top: 80px;
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
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
</div>
<div class="sidebar">
    <div class="sidebarright"><img src="anh/Review-Furama-Resort-Da-Nang-13.jpg" width="100%" height="800px"></div>
    <div class="footer">
        <h1>the end</h1>
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
</html>
