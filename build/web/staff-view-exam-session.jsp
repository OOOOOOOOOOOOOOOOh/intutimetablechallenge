<%-- 
    Document   : staff-view-exam-session
    Created on : 14/06/2022, 1:59:00 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intuition - Exam Allocations</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="styles-revised.css">
    <style>
         table, th, td {
            border: 1px solid black;border-collapse: collapse;
         }
    </style>
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
        <%ArrayList<String> alphabet = new ArrayList<String>();
        alphabet.add("A");alphabet.add("B");alphabet.add("C");alphabet.add("D");alphabet.add("E");alphabet.add("F");alphabet.add("H");alphabet.add("I");alphabet.add("J");alphabet.add("K");alphabet.add("L");alphabet.add("M");alphabet.add("N");alphabet.add("O");alphabet.add("P");alphabet.add("Q");alphabet.add("R");alphabet.add("S");alphabet.add("T");alphabet.add("U");alphabet.add("V");alphabet.add("W");alphabet.add("X");alphabet.add("Y");alphabet.add("Z");
        String room = (String) session.getAttribute("viewRoom");
        ArrayList<uts.isd.model.StudentExamRoomList> studentExamRoomList = (ArrayList<uts.isd.model.StudentExamRoomList>) session.getAttribute("studentExamRoomList");
        int examQuantity = (Integer) session.getAttribute("examQuantity");
        int maxExamStudents = (Integer) session.getAttribute("maxExamStudents");
        DBConnector dbConnector = new DBConnector();
        Connection conn = dbConnector.openConnection();
        DBManager dbManager = new DBManager(conn);
        int columnSize = dbManager.getRoomColumns(room);
        String dateTime = (String) session.getAttribute("dateTime");
        ArrayList<String> examListType = dbManager.getExamTypeList(dateTime, room);
        int rowSize = dbManager.getRoomRows(room);
        String[][] studentTable = new String[rowSize][columnSize];
        %>
        <br>
        <h1>Student Allocations in Room <%=room%></h1>
        
        <p>Room <%=room%> has <%=rowSize%> rows and <%=columnSize%> columns.</p>
        <p>Number of ExamTypes: <%=examQuantity%></p>
        <p>Exams in room: <%for (String exam : examListType){ %><%=exam%>    <%}%></p>
        <p>Most Number of Students Sitting One Exam: <%=maxExamStudents%></p>
        <h1>Exam Roll</h1>
        <table style="margin:auto;background-color: white;color: black">
        <tr>
          <th style="height:50px;width:200px;text-align: center;">Student</th>
          <th style="height:50px;width:200px;text-align: center;">Exam</th>
          <th style="height:50px;width:200px;text-align: center;">Email</th>
<!--Email included in case students have the same name-->
        </tr>
        <% for (uts.isd.model.StudentExamRoomList student : studentExamRoomList) { %>
        <tr>
          <td style="height:50px;width:200px;text-align: center;"><%=dbManager.findName(student.getEmail())%></td>
          <td style="height:50px;width:200px;text-align: center;"><%=student.getExamID()%></td>
          <td style="height:50px;width:200px;text-align: center;"><%=student.getEmail()%></td>
        </tr>
        <%}%>
        </table>
        
        
        <% //ExamQuantities
            ArrayList<Integer> examCountArray = new ArrayList<Integer>();
            int examCountType = 1;
            int studentArrayer = 0;
            while (studentArrayer < studentExamRoomList.size()){
                if (studentArrayer !=0 && studentExamRoomList.get(studentArrayer).getExamID().equals(studentExamRoomList.get(studentArrayer-1).getExamID())){
                    examCountType+=1;
                }
                else if (studentArrayer != 0){
                    examCountArray.add(examCountType);
                    examCountType=1;
                }
                studentArrayer+=1;
            }
            examCountArray.add(examCountType);
            
            int examQuantities = 0;
            for (Integer examTypeCount:examCountArray){
                if (examTypeCount > rowSize){
                    examQuantities+=((examTypeCount/rowSize)+1);
                }
                else if (examTypeCount <= rowSize){
                    examQuantities+=1;
                }
            }
            System.out.println("Hybrid will take up " + examQuantities + " columns");

            if (examQuantity <= columnSize && maxExamStudents <= rowSize) {
            System.out.println("Aggressive (new exam = new column)");
            int columnList = 0;
            int totalStudents = 0;
            while (columnList < columnSize) {
                int rowList = 0;
                while (rowList < rowSize){
                    if (totalStudents < studentExamRoomList.size()){
                        if (totalStudents != 0 && studentExamRoomList.get(totalStudents).getExamID().equals(studentExamRoomList.get(totalStudents-1).getExamID())){
                            studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
                        }
                        else if (totalStudents == 0){
                            studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
                        }
                        
                        else {
                            if (rowList!= 0) {
                                columnList+=1;
                                rowList = 0;
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
                            }
                            else{
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
                            }
                        }
                    }
                    rowList+=1;
                    totalStudents+=1;
                }
                columnList+=1;
            }
        } else if (examQuantities <= columnSize && maxExamStudents > rowSize){
            System.out.println("Hybrid");
            int columnList = 0;
            int totalStudents = 0;
            while (columnList < columnSize) {
                int rowList = 0;
                while (rowList < rowSize){
                    if (totalStudents < studentExamRoomList.size()){
                        if (totalStudents != 0 && studentExamRoomList.get(totalStudents).getExamID().equals(studentExamRoomList.get(totalStudents-1).getExamID())){
                            studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
                        }
                        else if (totalStudents == 0){
                            studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
                        }
                        
                        else {
                            if (rowList!= 0) {
                                columnList+=1;
                                rowList = 0;
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
                            }
                            else{
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
                            }
                        }
                    }
                    rowList+=1;
                    totalStudents+=1;
                }
                columnList+=1;
            }
            

            
        } else {
        System.out.println("Passive (exams allocated directly behind each other)");
            int columnList = 0;
            int totalStudents = 0;
            while (columnList < columnSize) {
                int rowList = 0;
                while (rowList < rowSize){
                    if (totalStudents < studentExamRoomList.size()){
                        studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
                    }
                    rowList+=1;
                    totalStudents+=1;

                }
                columnList+=1;
            }
        }
        %>
        <br>
        <h1>Exam Room Layout:</h1>
        <table style="margin:auto;background-color: white;color: black">
        <% System.out.println("Printing Table");
            int rowPrint = 1;
           while (rowPrint <= rowSize){
               int columnPrint = 1;%>
               <tr>
               
               <%
               while (columnPrint <= columnSize){
               %>
               
               <td style="height:100px;width:300px;text-align: center;"><%=alphabet.get(columnPrint-1)%><%=rowPrint%> <br> <%=studentTable[rowPrint-1][columnPrint-1]%></td>
                   <%columnPrint+=1;
               }
               rowPrint+=1;
           }
        %>
        <% if (maxExamStudents <= rowSize){
            for (uts.isd.model.StudentExamRoomList student : studentExamRoomList) { %>
            <p><%=student.getEmail()%> <%=student.getExamID()%></p>
                <%
            }
        }
    %>
        </table>
        <br>
        </body>
</html>
