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
        <title>Intuition - Exam Allocations</title>
    </head>
    <body>
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
        <h1><%=name%>'s Exam Allocation</h1>
        <%  for (AllocatedStudents examSession : examSessions) {
            String dateTime = examSession.getDateTime();
            String roomNumber = examSession.getRoom();
            String examID = examSession.getExamID(); 
            ExamType exam = dbManager.getExam(examID);
            String subject = exam.getSubject();
            String duration = exam.getDuration();
            String ESPNumber = exam.getEspNumber();
        %>
            
            <p>-----------------</p>
            <p>Room: <%=roomNumber%></p>
            <p>Date: <%=dateTime%></p>
            <p>Exam ID: <%=examID%></p>
            <p>Subject: <%=subject%></p>
            <p>Duration: <%=duration%></p>
            <p>ESP Number: <%=ESPNumber%></p>
            <form action="ExamRoomSessionServlet" method="POST">
                <input type="hidden" id="examDateTime" name="examDateTime" value="<%=dateTime%>"><br><br>
                <input type="hidden" id="examRoomNumber" name="examRoomNumber" value="<%=roomNumber%>"><br><br>
                <button>View Exam Room Layout</button>
           </form> 
            <p>-----------------</p>
            <form action="StudentUnallocateServlet" method="POST">
                <input type="hidden" id="dateTime" name="dateTime" value="<%=dateTime%>"/>
                <input type="hidden" id="email" name="email" value="<%=email%>"/>
                <button>Remove Allocation</button> 
            </form>
        <%}%>
    </body>
</html>
