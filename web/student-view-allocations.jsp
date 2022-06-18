<%-- 
    Document   : student-view-allocations
    Created on : 24/05/2022, 2:38:40 AM
    Author     : samuel.lim2
--%>

<%@page import="uts.isd.model.ExamType"%>
<%@page import="uts.isd.model.AllocatedStudents"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.isd.model.dao.DBConnector"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="styles-revised.css">
        <title>Intuition - Exam Allocations</title>
    </head>
    <body style="background-color: #5661ba;color:white;text-align:center;">
                         <% 
            String login = (String) session.getAttribute("login"); %>
    <% String stafflogin = (String) session.getAttribute("staffLogin");
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
        <% 
        DBConnector dbConnector = new DBConnector();
        Connection conn = dbConnector.openConnection();
        DBManager dbManager = new DBManager(conn);
        User user = (User) session.getAttribute("user");
        String name = user.getName();
        String email = user.getEmail();
        System.out.println("FOUND EMAIL:" + email);
        ArrayList<AllocatedStudents> examSessions = dbManager.getExamAllocations(email);
        %>
        <br>
        <br>
        <h1><%=name%>'s Exam Allocations</h1>
        <br>
                        <div style="margin-left: 6.5%; margin-right: 6.5%">
     <div class="row row-cols-1 row-cols-md-4 g-3">
        <%  for (AllocatedStudents examSession : examSessions) {
            String dateTime = examSession.getDateTime();
            String roomNumber = examSession.getRoom();
            String examID = examSession.getExamID(); 
            ExamType exam = dbManager.getExam(examID);
            String subject = exam.getSubject();
            String duration = exam.getDuration();
            String ESPNumber = exam.getEspNumber();
        %>
            <div class="card" style="width: 25rem;">
            <div class="card-body">
            <h5 class="card-title" style="color: black">Room: <%=roomNumber%></h5>
            <p class="card-text" style="color: black">Date: <%=dateTime%></p>
            <p class="card-text" style="color: black">Exam ID: <%=examID%></p>
            <p class="card-text" style="color: black">Subject: <%=subject%></p>
            <p class="card-text" style="color: black">Duration: <%=duration%></p>
            <p class="card-text" style="color: black">ESP Number: <%=ESPNumber%></p>
            <form action="ExamRoomSessionServlet" method="POST">
                <div style="display:none">
                <input type="hidden" id="examDateTime" name="examDateTime" value="<%=dateTime%>"><br><br>
                <input type="hidden" id="examRoomNumber" name="examRoomNumber" value="<%=roomNumber%>"><br><br>
                </div>
                <button type="submit" class="btn btn-secondary">View Exam Room Layout</button>
            </form> 
                <br>
            <form action="StudentUnallocateServlet" method="POST">
                <input type="hidden" id="dateTime" name="dateTime" value="<%=dateTime%>"/>
                <input type="hidden" id="email" name="email" value="<%=email%>"/>
                <button type="submit" class="btn btn-danger">Remove Allocation</button> 
            </form>
            </div>
            </div>
        <%}%>
        </div>
        </div>
    </body>
</html>
