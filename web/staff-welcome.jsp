<%-- 
    Document   : welcome
    Created on : 24/04/2022, 4:58:04 PM
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
    <% System.out.println("Session Attribute is:" + session.getAttribute("staffLogin"));
        uts.isd.model.Staff user = (uts.isd.model.Staff) session.getAttribute("staff");
        String name = user.getName();
        String email = user.getEmail();
        String password = user.getPassword();
        String gender = user.getGender();
        String favcol = user.getFavcol();
        String phone = user.getPhone();
        String tos = (String) session.getAttribute("tos");
        session.setAttribute("user", user);
        String stafflogin = (String) session.getAttribute("staffLogin");

        %>
        
    <body style="background-color: #5661ba;">

        <% 
            String login = (String) session.getAttribute("login");
        %>

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
                    <a class="nav-link" href="device-catalogue.jsp">Device Catalogue</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Orders</a>
                  </li>
                </ul>
                <!-- Left links -->
              </div>
              <!-- Right elements -->
              <div class="d-flex align-items-center">
                <!-- Shopping Cart -->
                <a class="text-reset me-3" href="#">
                  <i class="fa fa-shopping-cart"></i>
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
        <title>IotBay - Welcome!</title>
    </head> 
        
    <% if (tos != null) { %>
        <!-- Header -->
        <header class="py-5">
            <div class="container-fluid px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1>Welcome to IoTBay <%= name %></h1>
                </div>
            </div>
        </header>
        <!-- Header -->
        <h1 style="color:white;text-align:center;">Welcome <%= name %> </h1>
        <p style="color:white;text-align:center;">Your email is <%= email%></p>
        <p style="color:white;text-align:center;">Your password is <%= password%></p>
        <p style="color:white;text-align:center;">Your gender is <%= gender%></p>
        <p style="color:white;text-align:center;">Your favourite colour is <%= favcol%></p>
        <p style="color:white;text-align:center;">Your phone number is <%= phone %> </p>
        <p style="color:white;text-align:center;">Click <a href="staff-index.jsp">here </a> to proceed to the main page</p>
    
    <%} else { %>
        <h1>Sorry, you must agree to the Terms of Service</h1>
        <h1>Click <a href="staff-register.jsp">here</a>  to go back</h1>
    <% } %>
    </body>
</html>
