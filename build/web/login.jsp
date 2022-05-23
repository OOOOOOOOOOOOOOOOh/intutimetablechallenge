<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : login-revised
    Created on : 25/04/2022, 11:24:47 PM
    Author     : 61434
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles-revised.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Intuition - Login</title>
    </head>
    <body> 
        <div class="row" style="width:100%;">
                <div class="col-sm-4">
                    <div id="LHS" class="container-md-fluid text-white">
                        <img id="index-img" src="images/wave.png">
                        <br><br><h1>Welcome to Intuition</h1>
                    </div> 
                </div>
                <div class="col-sm-8">
                    <div id="RHS" class="container-fluid">
                        <form action="UserLoginServlet" method="post">
                            <h1>Login</h1>
                            <div class="login-form">
                                <p>Email Address</p>
                                <input class="input-group" type="text" id="email" name="email" required><br>
                                <p>Password</p>
                                <input class="input-group" type="password" id="password" name="password" required><br><br>
                                <input type="hidden" id="login" name="login" value="true"><br><br>
                            </div>
                            <br>
                            <button id="submit" type="submit" value="login">Login</button>
                            <% if (session.getAttribute("userNotFound") != null) { %>
                                <p> Account not found! </p>
                            <%} %>
                            <p id="registerLnk">Not a member of IoTBay? <a href="register.jsp">Register here</a></p>
                            <p id="registerLnk">Looking for the staff portal? <a href="staff-login.jsp">Login here</a></p>
                        </form>
                    </div>
                </div>
          </div>
    </body>
</html>
