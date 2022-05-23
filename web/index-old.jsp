<%-- 
    Document   : index
    Created on : 22 Apr 2022, 10:14:22 am
    Author     : 61434
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles-revised.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Index Page</title>
        <% 
            String login = (String) session.getAttribute("login");
        %>
    </head>
    <body style = "background-color: white;">
        <div class = "header">
            <ul class = "header-list">
                <li>Device Catalogue</li>
                <li>Order</li>
            <% if (login != null) { %>
                <button class = "login-welcome"><a href=" UserLogOutServlet">LOGOUT</a></button>
            <%} else { %>
                <button class = "login-welcome"><a href=" login.jsp">LOGIN</a></button>                
                <button class = "login-welcome"><a href=" register.jsp">REGISTER</a></button>
                <button class = "login-welcome"><a href=" staff-login.jsp">STAFF PORTAL</a></button>                
            <% } %> 


            </ul>
        </div>
        <div class = "title">
            <h3>IoTBay</h3>
        </div>
        <h1>Store Home</h1>
    
    <% if (login != null) { 
            uts.isd.model.User user = (uts.isd.model.User) session.getAttribute("user"); 
            String name = user.getName();
            String email = user.getEmail(); %>
        <p>You are logged in as <%= name %> </p>
        <p><a href=" account.jsp">My Account</a></p>
        <p><a href=" log.jsp">View Logs</a></p>        
<!--            <div class ="user-registration">
                <form action="UserLogServlet" method="post">
                 <input type="submit" value="View Access Log">
               </form>-->
    
    <%} else { %>
        <p>You are not logged in.</p>
        <p><a href=" login.jsp">Login</a></p>
        <p><a href=" register.jsp">Register</a></p>
    <% } %>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>