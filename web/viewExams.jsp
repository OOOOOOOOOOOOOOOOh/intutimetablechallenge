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
    </head>
    <body>
        <h1>View Exam Time Slots:</h1>
        <% 
            DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.openConnection();
            DBManager dbManager = new DBManager(conn);
            ArrayList<ExamSession> examSessions = dbManager.getExamSlots();
            ArrayList<ExamType> examTypes = dbManager.getExamTypes();            
            uts.isd.model.User user = (uts.isd.model.User) session.getAttribute("user");
            String email = user.getEmail();
            String login = (String) session.getAttribute("login");
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
                    <p>-----------------</p>
                    <p>Room: <%=room%></p>
                    <p>Date: <%=dateTime%></p>
                    <p>Remaining Capacity: <%=remainingCapacity%></p>
                    <row>
                        <form action="StudentAllocateServlet" method="POST">
                            <input type="hidden" id="room" name="room" value="<%=room%>"/>
                            <input type="hidden" id="email" name="email" value="<%=email%>"/>
                            <input type="hidden" id="dateTime" name="dateTime" value="<%=dateTime%>"/>
                            <select id="examID" name="examID">
                            <% for (ExamType examType : examTypes) { 
                                String examID = examType.getExamID();
                                String subject = examType.getSubject();
                                String duration = examType.getDuration();
                                String espNumber = examType.getEspNumber();
                            %>
                              <option value="<%=examID%>">Exam: <%=examID%> | Subject: <%=subject%> | Duration: <%=duration%> minutes | espNumber: <%=espNumber%></option>
                            <%}%>
                            </select>
                            
                            <button name="dateTime" value="<%=dateTime%>" <%System.out.println("Button status:" + alreadyAllocated);if (remainingCapacity == 0) {%> disabled <%} else if (alreadyAllocated == true) {%> disabled <%}%> >Add to TimeTable</button>
                            <% if (alreadyAllocated == true) { %>
                            <p>You've already booked an exam at this time </p>
                            <% } else if (remainingCapacity == 0){ %>
                            <p>This exam time slot is full.</p>
                            <% } %>
                        </form>
                    <p>--------------</p>
<!--                        <form action="StudentUnallocateServlet.jsp" method="GET">
                            <input type="hidden" name="room" value="<%=room%>"/>
                            <input type="hidden" name="email" value="<%=email%>"/>
                            <input type="hidden" name="dateTime" value="<%=dateTime%>"/>
                            <button name="dateTime" value="<%=dateTime%>">Delete device</button>       
                        </form>
                    </row>-->
                <%}
            }
        %>
    </body>
</html>
