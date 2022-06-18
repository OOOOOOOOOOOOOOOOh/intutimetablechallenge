<%-- 
    Document   : viewExams
    Created on : 21/05/2022, 11:15:50 PM
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
         <br>
         <br>
        <h1>View Exam Time Slots:</h1>
        <br>
        <br>
                <div style="margin-left: 6.5%; margin-right: 6.5%">
     <div class="row row-cols-1 row-cols-md-4 g-3">
        <% 
            DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.openConnection();
            DBManager dbManager = new DBManager(conn);
            ArrayList<ExamSession> examSessions = dbManager.getExamSlots();
            ArrayList<ExamType> examTypes = dbManager.getExamTypes();            
            uts.isd.model.User user = (uts.isd.model.User) session.getAttribute("user");
            String email = user.getEmail();
            if (login != null) {
                for (ExamSession examSession : examSessions) {
                    String room = examSession.getRoom();
                    String dateTime = examSession.getDateTime();
                    System.out.println("Room =" + room);
                    System.out.println("MAX CAP =" + dbManager.getMaxCapacity(room));
                    System.out.println("Number of students =" + dbManager.getNumberOfStudents(dateTime, room));
                    int remainingCapacity = dbManager.getMaxCapacity(room) - dbManager.getNumberOfStudents(dateTime, room); 
                    System.out.println("Remaining Cap =" + remainingCapacity);
                    ArrayList<AllocatedStudents> studentSessions = dbManager.getExamAllocations(email);
                    boolean alreadyAllocated = false;
                    for (AllocatedStudents studentSession : studentSessions) {
                        System.out.println(studentSession.getDateTime());
                        System.out.println(examSession.getDateTime());
                        if (studentSession.getDateTime().equals(examSession.getDateTime())){
                            alreadyAllocated = true;
                            System.out.println("BUTTON HAS BEEN DISABLED: " + alreadyAllocated);
                        }
                    System.out.println("Button status in loop:" + alreadyAllocated);
                    }
                    System.out.println("Button status after first loop:" + alreadyAllocated);
        %>
                    
                <div class="card" style="width: 50rem;">
                <div class="card-body">
                    <h5 class="card-title" style="color: black">Room: <%=room%></h5>
                    <p class="card-text" style="color: black">Date: <%=dateTime%></p>
                    <p class="card-text" style="color: black">Remaining Capacity: <%=remainingCapacity%></p>
                        <form action="StudentAllocateServlet" method="POST">
                            <input type="hidden" id="room" name="room" value="<%=room%>"/>
                            <input type="hidden" id="email" name="email" value="<%=email%>"/>
                            <input type="hidden" id="dateTime" name="dateTime" value="<%=dateTime%>"/>
                            <div style="display: flex; align-items: center; justify-content: center;">
                            <select id="examID" name="examID" class="form-select w-auto card-text">
                            <% for (ExamType examType : examTypes) { 
                                String examID = examType.getExamID();
                                String subject = examType.getSubject();
                                String duration = examType.getDuration();
                                String espNumber = examType.getEspNumber();
                            %>
                              <option value="<%=examID%>"><%=examID%> | Subject: <%=subject%> | Duration: <%=duration%> minutes | espNumber: <%=espNumber%></option>
                            </div>
                            </div>
                              <%}%>
 
                            </select>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-success" name="dateTime" value="<%=dateTime%>" <%System.out.println("Button status:" + alreadyAllocated);if (remainingCapacity == 0) {%> disabled <%} else if (alreadyAllocated == true) {%> disabled <%}%> >Add to TimeTable</button>
                            <br>
                            <br>
                            <% if (alreadyAllocated == true) { %>
                            <div style="display: flex; align-items: center; justify-content: center;">
                                <div class="alert alert-warning" style=" width:50%;" role="alert">
                                You've already booked an exam at this time
                                </div>
                            </div>
                            <% } else if (remainingCapacity == 0){ %>
                            <div style="display: flex; align-items: center; justify-content: center;">
                                <div class="alert alert-warning" style="width:50%;"role="alert">
                                This exam time slot is full.
                                </div>
                            </div>
                            <% } %>
                        </form>
<!--                        <form action="StudentUnallocateServlet.jsp" method="GET">
                            <input type="hidden" name="room" value="<%=room%>"/>
                            <input type="hidden" name="email" value="<%=email%>"/>
                            <input type="hidden" name="dateTime" value="<%=dateTime%>"/>
                            <button name="dateTime" value="<%=dateTime%>">Delete device</button>       
                        </form>
                    </row>-->
                            </div>
                            </div>
                <%}

            }
        %>
                                </div>
                            </div>
    </body>
</html>
