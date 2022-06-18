<%-- 
    Document   : staff-add-time-slot
    Created on : 15/06/2022, 6:44:54 PM
    Author     : samuel.lim2
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.isd.model.dao.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Exam Time Slot</title>
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
                    <i style="color: black" class="fa fa-user"></i>
                </a>
                <a href="logout.jsp" class="nav-link">Logout</a>
              <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
          </nav>
         <!-- Navbar -->
        <h1>Add Exam Time Slot</h1>
        <form action="StaffAddTimeSlotServlet" method="post">
            <p>Date: </p>
            <div style="display: flex; align-items: center; justify-content: center;">
            <input class="form-control w-auto" type="date" id="newDateSplit" name="newDateSplit" required>
            </div>
            <br>
            
            <p>Time: </p>
            <div style="display: flex; align-items: center; justify-content: center;">
            <input class="form-control w-auto" type="time" id="newTimeSplit" name="newTimeSplit" required>
            </div>
            <br>
            
            <p>Room: </p>
            <% DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.openConnection();
            DBManager dbManager = new DBManager(conn);
            ArrayList<String> roomIDs = dbManager.getRoomIDs();
            %>
            <div style="display: flex; align-items: center; justify-content: center;">
            <select class="form-select w-auto" id="newRoomID" name="newRoomID"required><br>
            <% for (String roomID : roomIDs) { 
            %>
              <option value="<%=roomID%>">Room <%=roomID%></option>
            <%}%>
            </select>
            </div>
            <br>
            <button type="submit" id="submit" class="btn btn-success w-auto" style="background-color: #198754;">Add Exam Time Slot</button>
            <br>
       </form>
    </body>
</html>
