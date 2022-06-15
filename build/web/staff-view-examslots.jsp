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
    </head>
    <body>
        <h1>View Exam Time Slots:</h1>
        <form action="staff-add-time-slot.jsp" method="POST">
            <button>Add Exam TimeSlot</button>
        </form>

        <% 
            DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.openConnection();
            DBManager dbManager = new DBManager(conn);
            ArrayList<ExamSession> examSessions = dbManager.getExamSlots();
            String login = (String) session.getAttribute("login");
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
                    <p>-----------------</p>
                    <p>Room: <%=room%></p>
                    <p>Date: <%=dateTime%></p>
                    <p>Remaining Capacity: <%=remainingCapacity%></p>
                    <row>
                            <form action="StaffExamRoomSessionServlet" method="POST">
                                <input type="hidden" id="room" name="room" value="<%=room%>"/>
                                <input type="hidden" id="dateTime" name="dateTime" value="<%=dateTime%>"/>
                                <button name="dateTime" value="<%=dateTime%>">View Exam Room</button>
                            </form>
                    <p>--------------</p>
                <%}
            }
        %>
    </body>
</html>