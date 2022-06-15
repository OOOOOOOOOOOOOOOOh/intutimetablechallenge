<%-- 
    Document   : login
    Created on : 22 Apr 2022, 10:17:31 am
    Author     : Samuel Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles-revised.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Staff Login</title>
    </head>
    <body>
        <div class="row" style="width:100%;">
                <div class="col-sm-4">
                    <div id="LHS" class="container-md-fluid text-white">
                        <img id="index-img" src="images/wave.png">
                        <br><br><h1>Staff Login</h1>
                    </div> 
                </div>
                <div class="col-sm-8">
                    <div id="RHS" class="container-fluid">
                <form action="StaffLoginServlet" method="post">
                    <h1>Staff Login</h1>
                    <div class="login-form">
                <p>Email Address</p>
                <input class="input-group"type="text" id="email" name="email" required><br><br>

                <p>Password</p>
                <input class="input-group"type="password" id="password" name="password" required><br><br>

                <input type="hidden" id="login" name="login" value="true"><br><br>
                </div>
                <br>
                <button id="submit" type="submit" value="login">Login</button>
               </form>
            <% if (session.getAttribute("userNotFound") != null) { %>
            <p> Account not found! </p>
            <%} %>
            <div class ="register-btn">
            <p id="registerLnk">Not a staff member? <a href=" register.jsp">Register as a user here!</a></p>
            <p id="registerLnk">Don't have a staff account? <a href=" staff-register.jsp">Register as a staff member here!</p>
            </div>
        </div>
    </body>
</html>
