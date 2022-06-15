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
    <style>
         table, th, td {
            border: 1px solid black;border-collapse: collapse;
         }
    </style>
    </head>
    <body>
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
        %>
        <h1>Student Allocations in <%=room%></h1>
        <p>Rowsize: <%=rowSize%></p>
        <p>ColumnSize: <%=columnSize%></p>
        <p>Number of ExamTypes: <%=examQuantity%></p>
        <p>Most Number of Students Sitting One Exam: <%=maxExamStudents%></p>
        <% for (uts.isd.model.StudentExamRoomList student : studentExamRoomList) { %>
        <p><%=student.getEmail()%><%=student.getExamID()%></p>
        <%}%>
        
        
        <% if (examQuantity <= columnSize && maxExamStudents <= rowSize) {
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
                            columnList+=1;
                            rowList = 0;
                            studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();
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
                        studentTable[rowList][columnList] = dbManager.findName(studentExamRoomList.get(totalStudents).getEmail())+ "<br>" + studentExamRoomList.get(totalStudents).getExamID() + "<br>" + studentExamRoomList.get(totalStudents).getEmail();

                    }
                    rowList+=1;
                    totalStudents+=1;

                }
                columnList+=1;
            }
        }
        %>
        
        <h1>Exam Room Layout:</h1>
        <table>
        <% int rowPrint = 1;
           while (rowPrint <= rowSize){
               int columnPrint = 1;%>
               <tr>
               
               <%
               while (columnPrint <= columnSize){
               %>
               
               <td style="height:50px;width:200px;text-align: center;"><%=alphabet.get(columnPrint-1)%><% if (rowPrint <10){ %><%}%><%=rowPrint%> - <%=studentTable[rowPrint-1][columnPrint-1]%></td>
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
        </body>
</html>
