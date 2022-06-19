<%-- 
    Document   : register-revised
    Created on : 25/04/2022, 11:26:47 PM
    Author     : 61434
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles-revised.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Intuition - Register</title>
    </head>
    <body> 
        <% session.setAttribute("user", null);%>
        <div class="row" style="width:100%;">
            <div class="col-sm-4">
                <div id="LHS" class="container-sm-fluid text-white">
                    <img width="80%" id="index-img" src="images/IntuLogo.svg">
                    <h1>Join Intuition!</h1>
                </div> 
            </div>
            <div class="col-sm-8">
                <div id="RHS-reg" class="container-fluid">
                    <form action="UserRegisterServlet" method="post">
                        <h1>Register</h1>
                        <div class="register-form">
                            <input class="form-control" placeholder="Email" type="text" id="email" name="email" required>
                            <br>
                            <input class="form-control" placeholder="Name" type="text" id="name" name="name" required>
                            <br>
                            <input class="form-control" placeholder="Password" type="password" id="password" name="password" required>
                            <br>
                            <label for="tos">I agree to the Terms of Service:</label>
                            <input type="checkbox" id="tos" name="tos">
                            <br>
                            <input type="hidden" id="login" name="login" value="true">
                           <%if ((String) session.getAttribute("fail") == "true") { %>
                            <div class="alert alert-warning">
                                <strong>Email already used!</strong> - Please choose a different email or login.
                            </div>  
                             <% }%>
                  <% if ((String) session.getAttribute("emailErr") != null) { %>
                  <p><%= (String) session.getAttribute("emailErr") %></p>
                  <% } %>
                            <input id="submit" type="submit" value="Sign Up">
                            <hr style="width: 100%; text-align: center; height: 3px; background-color: #F6A125; height: 3px;">

                        </div>
                    </form>
                    <form action="login.jsp" method="post">
                    <p type="submit" class="btn btn-secondary w-100"><button type="submit" class="btn btn-secondary">Login as a user here!</button></p>
                </form>
                <form action="staff-login.jsp" method="post">    
                    <p type="submit" class="btn btn-secondary w-100"><button type="submit" class="btn btn-secondary">Login as a staff member here!</button></p>
                   </form>
                    
                </div>
            </div>
        </div>
    </body>
</html>

