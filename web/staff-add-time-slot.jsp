<%-- 
    Document   : staff-add-time-slot
    Created on : 15/06/2022, 6:44:54 PM
    Author     : samuel.lim2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Exam Time Slot</title>
    </head>
    <body>
        <h1>Add Exam Time Slot</h1>
        <form action="StaffAddTimeSlotServlet" method="post">
            <p>Add date: </p>
            <input type="text" id="newDateSplit" name="newDateSplit" required>
            <p>Note: format as YYYY-MM-DD (e.g 2022-05-10)</p>
            <p>-------------------------------------------</p>
            <p>Add time: </p>
            <input type="text" id="newTimeSplit" name="newTimeSplit" required>
            <p>Note: format as hh:mm (e.g 18:30)
            <p>-------------------------------------------</p>
            

            <p>Add Room ID: </p>
            <input type="text" id="newRoomID" name="newRoomID" required><br><br>

            <button id="submit" type="submit">Add Exam Time Slot</button>
       </form>
    </body>
</html>
