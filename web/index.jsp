<%-- 
    Document   : indexx
    Created on : 14/05/2022, 10:05:15 PM
    Author     : 61434
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="styles-revised.css">
    </head>         
         <% 
            String login = (String) session.getAttribute("login"); %>
    <% if (login != null) { 
            uts.isd.model.User user = (uts.isd.model.User) session.getAttribute("user"); 
            String name = user.getName();
            String email = user.getEmail(); 
            String stafflogin = (String) session.getAttribute("staffLogin");
    %>
            
    <body>
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
         
        <!-- Header -->
        <header class="py-5">
            <div class="container-fluid px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1>Home Page</h1>
                </div>
            </div>
        </header>
        <!-- Header -->

        <div id="catalogue" class="container">
            <div class="row row-cols-1 row-cols-md-4 g-3">
                <!-- Cards Section -->
                <div id="list" class="col">
                    <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Access Logs</h5>
                                <p class="card-text">View your previous access logs.</p>
                                <a href="log.jsp" style="background-color: #5666e3;" class="btn btn-primary">View</a>
                            </div>
                    </div>     
                </div>

                <div id="list" class="col">
                    <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">My account</h5>
                                <p class="card-text">View your account information.</p>
                                <a href="account.jsp" style="background-color: #5666e3;" class="btn btn-primary">View</a>
                            </div>
                    </div>
                </div>
                <div id="list" class="col">
                    <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Add TimeTable</h5>
                                <p class="card-text">View and self-allocate to available exam timetable slots.</p>
                                <a href="viewExams.jsp" style="background-color: #5666e3;" class="btn btn-primary">View</a>
                            </div>
                    </div>
                </div>
                <div id="list" class="col">
                    <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">View Allocated TimeTables</h5>
                                <p class="card-text">View exam timetable slots you have been self-allocated to.</p>
                                <a href="student-view-allocations.jsp" style="background-color: #5666e3;" class="btn btn-primary">View</a>
                            </div>
                    </div>
                </div>     
            </div>
        </div>
   <%} else { %>
   <p style="color:white;text-align:center;">You are not logged in</p>
        <div class="mt-3">
            <a href="login.jsp"><button id="purple-button" class="button btn btn-primary w-100 d-flex justify-content-center align-items-center">
                <span>Login</span>
                <i class="fa fa-long-arrow-right ms-2"></i>
            </button></a>
        </div>
        <div class="mt-3">
            <a href="register.jsp"><button id="purple-button" class="button btn btn-primary w-100 d-flex justify-content-center align-items-center">
                <span>Register</span>
                <i class="fa fa-long-arrow-right ms-2"></i>
           </button></a>
        </div>
        <div class="mt-3">
            <a href="staff-login.jsp"<button id="purple-button" class="button btn btn-primary w-100 d-flex justify-content-center align-items-center">
                <span>Staff login</span>
                <i class="fa fa-long-arrow-right ms-2"></i>
            </button></a>
        </div>
   <% } %>
                </div>
            </div>
          </body>   
    </body>
</html>
