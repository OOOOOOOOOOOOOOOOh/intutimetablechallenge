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
        <% session.setAttribute("user", null);%>
        <div class="row" style="width:100%;">
                <div class="col-sm-4">
                    <div id="LHS" class="container-md-fluid text-white">
                        <img width="80%" id="index-img" src="images/IntuLogo.svg">
                        <h1>Welcome to Intuition</h1>
                    </div> 
                </div>
                <div class="col-sm-8">
                    <div id="RHS" class="container-fluid">
                        <form action="UserLoginServlet" method="post">
                            <h1>Login</h1>
                            <div class="login-form">
                                <input class="form-control" placeholder="Email Address" type="text" id="email" name="email" required><br>
                                <input class="form-control" placeholder="Password" type="password" id="password" name="password" required><br><br>
                                <input type="hidden" id="login" name="login" value="true"><br><br>
                            </div>
                            <button id="submit" type="submit" value="login">Login</button>
                            <% if (session.getAttribute("userNotFound") != null) { %>
                            <div class="alert alert-warning">
                                <strong>Account not found!</strong> - Check your email or password.
                            </div>    
                            <%} %>
                        <hr style="width: 100%; text-align: center; height: 3px; background-color: #F6A125; height: 3px;">
                        </form>
                <form action="register.jsp" method="post">
                    <p class="btn btn-secondary w-100"><button type="submit" class="btn btn-secondary w-100">Register as a user here!</button></p>
                </form>
                <form action="staff-login.jsp" method="post">    
                    <p class="btn btn-secondary w-100"><button type="submit" class="btn btn-secondary w-100">Login as a staff member here!</button></p>
                   </form>
                        </form>
                    </div>
                </div>
          </div>
    </body>
</html>
