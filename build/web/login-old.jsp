<%-- 
    Document   : login
    Created on : 22 Apr 2022, 10:17:31 am
    Author     : Samuel Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>IotBay - Login</title>
    </head>
    <body>
        <div class = "login">
            
            <div class ="title">IoTBay</div>
       
                <form action="UserLoginServlet" method="post">
                    
                 <label for="email">Email:</label>
                 <input type="text" id="email" name="email" required><br><br>
                 
                 <label for="password">Password:</label>
                 <input type="password" id="password" name="password" required><br><br>
                 
                 <input type="hidden" id="login" name="login" value="true"><br><br>
                 
                 <input type="submit" value="LOGIN">
               </form>
            <% if (session.getAttribute("userNotFound") != null) { %>
            <p> Account not found! </p>
            <%} %>
            <div class ="register-btn">
                <p>Don't have an account? <a href=" register.jsp">Register here!</a> </p>
                <p>Looking for the staff portal? <a href="staff-login.jsp">Login here!</a> </p>
            </div>
        </div>
    </body>
</html>
