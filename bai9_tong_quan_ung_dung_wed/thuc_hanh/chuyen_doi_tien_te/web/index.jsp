<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/2/2020
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  </head>
  <body>
  <form method="post"action="/converter">
    <div class="container">
      <h2>Currency Converter</h2>
      <form action="/action_page.php">
        <div class="form-group">
          <label for="rate">Rate:</label>
          <input type="text" class="form-control" id="rate" placeholder="22000" name="rate">
        </div>
        <div class="form-group">
          <label for="usd">USD:</label>
          <input type="text" class="form-control" id="usd" placeholder="0" name="usd">
        </div>

        <button style="background-color: lightslategray" type="submit" class="btn btn-primary">Converter</button>
      </form>
    </div>
  </form>


  </body>
</html>
