<%-- 
    Document   : staff-view-examslots
    Created on : 15/06/2022, 6:10:56 PM
    Author     : samuel.lim2
--%>


<%@page import="uts.isd.model.AllocatedStudents"%>
<%@page import="uts.isd.model.ExamType"%>
<%@page import="uts.isd.model.ExamSession"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.isd.model.dao.DBConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Time Slots</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="styles-revised.css">
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
        <h1>View Exam Time Slots:</h1>
        <form action="staff-add-time-slot.jsp" method="POST">
            <button type="submit" class="btn btn-success">Add Exam TimeSlot</button>
        </form>
        <br>
        <div style="margin-left: 3%; margin-right: 3%;">
     <div class="row row-cols-1 row-cols-md-4 g-3">
        <% 
            DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.openConnection();
            DBManager dbManager = new DBManager(conn);
            ArrayList<ExamSession> examSessions = dbManager.getExamSlots();
            if (login != null) {
                System.out.println("login is not null for examslot");
                for (ExamSession examSession : examSessions) {
                    String room = examSession.getRoom();
                    String dateTime = examSession.getDateTime();
                    System.out.println("Room =" + room);
                    System.out.println("MAX CAP =" + dbManager.getMaxCapacity(room));
                    System.out.println("Number of students =" + dbManager.getNumberOfStudents(dateTime, room));
                    int remainingCapacity = dbManager.getMaxCapacity(room) - dbManager.getNumberOfStudents(dateTime, room); 
                    System.out.println("Remaining Cap =" + remainingCapacity);
        %>
   
        <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title" style="color: black">Room: <%=room%></h5>
                    <p class="card-text" style="color: black">Date: <%=dateTime%></p>
                    <p class="card-text" style="color: black">Remaining Capacity: <%=remainingCapacity%></p>
                            <form action="StaffExamRoomSessionServlet" method="POST">
                                <div style="display:none">
                                <input type="hidden" id="room" name="room" value="<%=room%>"/>
                                <input type="hidden" id="dateTime" name="dateTime" value="<%=dateTime%>"/>
                                </div>
                                <button name="dateTime" value="<%=dateTime%>" class="btn btn-secondary">View Exam Room</button>
                            </form>
                    </div>
                </div>
               
                <%}
            }
        %>
    </div>
    </div>
        </body>
</html>