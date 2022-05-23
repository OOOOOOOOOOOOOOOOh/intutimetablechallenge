<%-- 
    Document   : register
    Created on : 22 Apr 2022, 10:15:45 am
    Author     : 61434
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles-revised.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>IoTBay - Register</title>
    </head>
    <body>
        <div class="registration-form">
            <div class ="title">Register</div>
            <br>
            <p class="margin-1">Already have an account? <a href="login.jsp">Login</a></p>
            <div class ="user-registration">
                <form action="UserRegisterServlet" method="post">
                    
                 <label for="email">Email:</label>
                 <input type="text" id="email" name="email" required><br><br>
                 
                 <label for="name">Name:</label>
                 <input type="text" id="name" name="name" required><br><br>
            
                 <label for="password">Password:</label>
                 <input type="password" id="password" name="password" required><br><br>
                 
                 <label for="gender">Gender:</label>
                 <input type="text" id="gender" name="gender" required> <br><br>
                 
                 <label for="favcol">Favourite Colour:</label>
                 <input type="text" id="favcol" name="favcol"><br><br>
                 
                 <label for="phone">Phone Number:</label>
                 <input type="text" id="phone" name="phone"><br><br>
                 
                 <label for="tos">I agree to the Terms of Service:</label>
                 <input type="checkbox" id="tos" name="tos"><br><br>
                 
                 <input type="hidden" id="login" name="login" value="true"><br><br>
                 
                 <input type="submit" value="Sign Up">
                 <%if ((String) session.getAttribute("fail") == "true") { %>
                    <p>Email already taken, please choose a different email or <a href="login.jsp">Login</a></p>
                  <% }%>
               </form>

            </div>
        </div>
    </body>
</html>
