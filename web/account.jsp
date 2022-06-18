<%-- 
    Document   : account
    Created on : 04/05/2022, 9:02:37 PM
    Author     : samuel.lim2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles-revised.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <title>Intuition - My Account</title>
        
          <%String stafflogin = (String) session.getAttribute("staffLogin");%>
        
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <!-- Container wrapper -->
            <div class="container-fluid">
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Navbar brand -->
                <a class="navbar-brand mt-2 mt-lg-0" href="#"></a>
                <!-- Left links -->
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                  <% if (stafflogin == null){ %>
                    <a class="nav-link" href="index.jsp">Home Page</a>
                      <%} else {%>
                      <a class="nav-link" href="staff-index.jsp">Home Page</a>
                   <%};%>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="device-catalogue.jsp"></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                  </li>
                </ul>
                <!-- Left links -->
              </div>
              <!-- Right elements -->
              <div class="d-flex align-items-center">
                <!-- Shopping Cart -->
                <a class="text-reset me-3" href="#">
                  
                </a>
                <!-- Profile -->
                <% if (stafflogin != null){ %>
                    <a class="text-reset me-3" href="staff-account.jsp">
                <%} else {%>
                    <a class="text-reset me-3" href="account.jsp">
                <%};%>
                    <i class="fa fa-user"></i>
                </a>
                <a href="logout.jsp" class="nav-link">Logout</a>
              <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
          </nav>
         <!-- Navbar -->
         
    </head>
    <body style="background-color: #5661ba;">
            <%
            uts.isd.model.User user = (uts.isd.model.User) session.getAttribute("user");
            String name = user.getName();
            String email = user.getEmail();
            String password = user.getPassword();
            session.setAttribute("emailOld", email);
            %>
             
        <h1 style="color:white;text-align:center;">Edit Account</h1>
            <div class ="user-registration">
                <form style="color:white;text-align:center;" action="UserUpdateServlet" method="post">    
                    <label style="color:white;text-align:center;" for="email">Email: <%= email %></label>
                    <p style="color:white;text-align:center;">Edit email: </p>
                    <input style="color:black;text-align:center;" type="text" id="email" name="email" value="<%= email %>"><br><br>

                    <label style="color:white;text-align:center;" for="name">Name: <%= name %></label>
                    <p style="color:white;text-align:center;">Edit name: </p>
                    <input style="color:black;text-align:center;" type="text" id="name" name="name" value="<%= name %>"><br><br>

                    <label style="color:white;text-align:center;" for="password">Password: <%= password %></label>
                    <p style="color:white;text-align:center;"> Edit password: </p>
                    <input style="color:black;text-align:center;" type="password" id="password" name="password" value="<%= password %>"><br><br>
                    
                    <input class="btn btn-secondary" type="submit" value="Save">
                           <% if ((String) session.getAttribute("emailErr") != null) { %>
                             <p><%= (String) session.getAttribute("emailErr") %></p>
                             <% } %>
                </form>

                
            </div>
    </body>
</html>
