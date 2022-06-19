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
        <% session.setAttribute("user", null);%>
        <div class="row" style="width:100%;">
                <div class="col-sm-4">
                    <div id="LHS" class="container-md-fluid text-white">
                        <img width="80%" id="index-img" src="images/IntuLogo.svg">
                        <h1>Staff Login</h1>
                    </div> 
                </div>
                <div class="col-sm-8">
                    <div id="RHS" class="container-fluid">
                <form action="StaffLoginServlet" method="post">
                    <h1>Staff Login</h1>
                    <div class="login-form">
                <input class="form-control" placeholder="Email" type="text" id="email" name="email" required><br>
                <input class="form-control" placeholder="Password" type="password" id="password" name="password" required><br>

                <input type="hidden" id="login" name="login" value="true"><br><br>
                </div>
                <button id="submit" type="submit" value="login">Login</button>
               </form>
            <% if (session.getAttribute("userNotFound") != null) { %>
                <div class="alert alert-warning">
                <strong>Account not found!</strong> - Check your email or password.
                </div>   
            <%} %>
            <div class ="register-btn">
            <hr style="width: 100%; text-align: center; height: 3px; background-color: #F6A125; height: 3px;">
            <form action="register.jsp" method="post">
                <p class="btn btn-secondary w-100"><button class="btn btn-secondary w-100" type="submit" class="btn btn-secondary">Register as a user here!</button></p>
            </form>
            <form action="staff-register.jsp" method="post">    
                <p class="btn btn-secondary w-100"><button class="btn btn-secondary w-100" type="submit" class="btn btn-secondary">Register as a staff member here!</button></p>
            </form>
            </div>
        </div>
    </body>
</html>
