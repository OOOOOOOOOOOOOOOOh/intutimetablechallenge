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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="styles-revised.css">
        <title>Intuition - Exam Allocations</title>
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
        int rowSize = dbManager.getRoomRows(room);
        String[][] studentTable = new String[rowSize][columnSize];
        uts.isd.model.User user = (uts.isd.model.User) session.getAttribute("user");
        %>
        <h1>Student Allocations in Room <%=room%></h1>
        
        
        <%             ArrayList<Integer> examCountArray = new ArrayList<Integer>();
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
                System.out.println("examCount: " + examTypeCount);
                if (examTypeCount > rowSize){
                    examQuantities+=((examTypeCount/rowSize)+1);
                    System.out.println("ExamQuantities: "+ examQuantities);
                }
                else if (examTypeCount <= rowSize){
                    examQuantities+=1;
                    System.out.println("ExamQuantities: "+ examQuantities);
                }
            }
            System.out.println("Hybrid will take up " + examQuantities + " columns");
            
            
            
            if (examQuantity <= columnSize && maxExamStudents <= rowSize) {
            int columnList = 0;
            int totalStudents = 0;
            while (columnList < columnSize) {
                int rowList = 0;
                while (rowList < rowSize){
                    if (totalStudents < studentExamRoomList.size()){
                        if (totalStudents != 0 && studentExamRoomList.get(totalStudents).getExamID().equals(studentExamRoomList.get(totalStudents-1).getExamID())){
                            if (user.getEmail().equals(studentExamRoomList.get(totalStudents).getEmail())){
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + "(You)";
                            }
                            else{
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID();
                            }
                        }
                        else if (totalStudents == 0){
                            if (user.getEmail().equals(studentExamRoomList.get(totalStudents).getEmail())){
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + "(You)";
                            }
                            else{
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID();
                            }
                        }
                        
                        else {
                            if (rowList!= 0) {
                                columnList+=1;
                                rowList = 0;
                                if (user.getEmail().equals(studentExamRoomList.get(totalStudents).getEmail())){
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + "(You)";
                                }
                                else{
                                    studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID();
                                }
                            }
                            else{
                                if (user.getEmail().equals(studentExamRoomList.get(totalStudents).getEmail())){
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + "(You)";
                                }
                                else{
                                    studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID();
                                }
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
                            if (user.getEmail().equals(studentExamRoomList.get(totalStudents).getEmail())){
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + "(You)";
                            }
                            else{
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID();
                            }
                        }
                        else if (totalStudents == 0){
                            if (user.getEmail().equals(studentExamRoomList.get(totalStudents).getEmail())){
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + "(You)";
                            }
                            else{
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID();
                            }
                        }
                        
                        else {
                            if (rowList!= 0) {
                                columnList+=1;
                                rowList = 0;
                                if (user.getEmail().equals(studentExamRoomList.get(totalStudents).getEmail())){
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + "(You)";
                                }
                                else{
                                    studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID();
                                }
                            }
                            else{
                                if (user.getEmail().equals(studentExamRoomList.get(totalStudents).getEmail())){
                                studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + "(You)";
                                }
                                else{
                                    studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID();
                                }
                            }
                        }
                    }
                    rowList+=1;
                    totalStudents+=1;
                }
                columnList+=1;
            }
        } else {
            int columnList = 0;
            int totalStudents = 0;
            while (columnList < columnSize) {
                int rowList = 0;
                while (rowList < rowSize){
                    if (totalStudents < studentExamRoomList.size()){
                        if (user.getEmail().equals(studentExamRoomList.get(totalStudents).getEmail())){
                            studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + "(You)";
                        }
                        else{
                            studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID();
                        }
                    }
                    rowList+=1;
                    totalStudents+=1;
                }
                columnList+=1;
            }
        }
        %>
        
        <h2>Exam Room Layout:</h2>
        <table style="margin:auto;background-color: white;color: black">
        <% int rowPrint = 1;
           while (rowPrint <= rowSize){
               int columnPrint = 1;%>
               <tr>
               
               <%
               while (columnPrint <= columnSize){
               %>
               
               <td style="height:100px;width:250px;text-align: center;"><%=alphabet.get(columnPrint-1)%><% if (rowPrint <10){ %><%}%><%=rowPrint%> - <%=studentTable[rowPrint-1][columnPrint-1]%></td>
                   <%columnPrint+=1;
               }
               rowPrint+=1;
           }
        %>
        <% if (maxExamStudents <= rowSize){
            for (uts.isd.model.StudentExamRoomList student : studentExamRoomList) { %>
            <p>Your Exam: <%=student.getExamID()%></p>
            <br>
            <h4>This is the front of the room.</h4>
                <%
            }
        }
    %>
        </table>
        </body>
</html>