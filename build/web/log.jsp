<%-- 
    Document   : account
    Created on : 04/05/2022, 9:02:37 PM
    Author     : samuel.lim2
--%>

<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.isd.model.dao.DBConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles-revised.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <title>Intuition - My Account</title>
    </head>

            <%
            uts.isd.model.User user = (uts.isd.model.User) session.getAttribute("user");
            String name = user.getName();
            String email = user.getEmail();
            DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.openConnection();
            DBManager dbManager = new DBManager(conn);
            ArrayList<uts.isd.model.Log> logs = dbManager.fetchLog(email);
            String stafflogin = (String) session.getAttribute("staffLogin");
            %>
 <body style="background-color: #5661ba;">
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
        <br>    
        
        <h1 style="color:white;text-align:center;"><%=name%>'s Access Log</h1>
        <div style="margin-left: 10%; margin-right: 10%">
        <div class="row row-cols-1 row-cols-md-4 g-3">
                <%                  int count = 1;
                    for (uts.isd.model.Log log : logs) {
                %>
                <div class="card" style="width: 18rem;">
                <div class="card-body">
                <h5 class="card-title" style="color: black" style="color:white;text-align:center;">Log Number <%=count%></h5>
                <p class="card-text" style="color: black">Type: <%= log.getType()%></p>
                <p class="card-text" style="color: black">Date: <%= log.getDate()%></p>
                <p class="card-text" style="color: black">Email: <%= log.getEmail()%></p>
                </div>
                </div>
                <% count++;
                    } %>
            </div>
            </div>
    </body>
</html>
