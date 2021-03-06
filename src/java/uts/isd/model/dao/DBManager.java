package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.Staff;
import uts.isd.model.Log;
import uts.isd.model.StaffLog;
import uts.isd.model.ExamSession;
import uts.isd.model.AllocatedStudents;
import uts.isd.model.ExamType;
import uts.isd.model.StudentExamRoomList;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {
    private Statement st;
   
    public DBManager(Connection conn) throws SQLException {       
       st = conn.createStatement();   
    }

        //EXAM TIMETABLE
    public ArrayList<AllocatedStudents> getExamStudents(String dateTime, String roomID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.ALLOCATEDSTUDENTS WHERE DATETIME= '" + dateTime + "' and ROOMID='" + roomID +"', GROUP BY SUBJECT";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<AllocatedStudents> temp = new ArrayList();

        while(rs.next()){
            String email = rs.getString(3);
            String examID = rs.getString(4);
            temp.add(new AllocatedStudents(dateTime,roomID,email,examID));
        }
        return temp;
    }
    public int getMaxExamStudents(String dateTime, String roomID) throws SQLException{
        String fetch = "SELECT EXAMID, COUNT(EXAMID) FROM ISDUSER.ALLOCATEDSTUDENTS WHERE DATETIME= '" + dateTime + "' and ROOMNUMBER='" + roomID +"' GROUP BY EXAMID ORDER BY COUNT(EXAMID) DESC LIMIT 1";
        ResultSet rs = st.executeQuery(fetch);

        while(rs.next()){
//            String examID = rs.getString(1);
            int maxQuantity = rs.getInt(2);
            return maxQuantity;
        }
        return 0;
    }
    public int getExamQuantity(String dateTime, String roomID) throws SQLException{
        String fetch = "SELECT COUNT(DISTINCT EXAMID) FROM ISDUSER.ALLOCATEDSTUDENTS WHERE DATETIME= '" + dateTime + "' and ROOMNUMBER='" + roomID +"' GROUP BY EXAMID";
        ResultSet rs = st.executeQuery(fetch);
        
        int examQuantity = 0;
        while(rs.next()){
            int examAdder = rs.getInt(1);
            examQuantity+=examAdder;
        } 
        return examQuantity;
    }
    
    public ArrayList<String> getExamTypeList(String dateTime, String roomID) throws SQLException{
        String fetch = "SELECT DISTINCT EXAMID FROM ISDUSER.ALLOCATEDSTUDENTS WHERE DATETIME= '" + dateTime + "' and ROOMNUMBER='" + roomID +"' GROUP BY EXAMID";
        ResultSet rs = st.executeQuery(fetch);
        
        ArrayList<String> temp = new ArrayList();
        while(rs.next()){
            String exam = rs.getString(1);
            temp.add(new String(exam));
        } 
        return temp;
    }
    
    public ArrayList<StudentExamRoomList> fetchStudentExamRoomList(String dateTime, String roomID) throws SQLException{
        String fetch = "SELECT STUDENTEMAIL, EXAMID FROM ISDUSER.ALLOCATEDSTUDENTS WHERE DATETIME= '" + dateTime + "' and ROOMNUMBER='" + roomID +"' ORDER BY EXAMID";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<StudentExamRoomList> temp = new ArrayList();

        while(rs.next()){
            String email = rs.getString(1);
            String examID = rs.getString(2);
            temp.add(new StudentExamRoomList(email, examID));
        }
        return temp;
    }
    
    public ArrayList<ExamSession> getExamSlots() throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.EXAMSESSION ORDER BY DATETIME";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<ExamSession> temp = new ArrayList();

        while(rs.next()){
            String dateTime = rs.getString(1);
            String roomNumber = rs.getString(2);
            temp.add(new ExamSession(dateTime, roomNumber));
        }
        return temp;
    }
    
    public ArrayList<ExamType> getExamTypes() throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.EXAMTYPE";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<ExamType> temp = new ArrayList();

        while(rs.next()){
            String examID = rs.getString(1);
            String subject = rs.getString(2);
            String duration = rs.getString(3);
            String espnumber = rs.getString(4);
            temp.add(new ExamType(examID, subject, duration, espnumber));
        }
        return temp;
    }
    
    public void allocateStudent(String dateTime, String roomNumber, String email, String examID) throws SQLException{
    st.executeUpdate("INSERT INTO ISDUSER.ALLOCATEDSTUDENTS (DATETIME, ROOMNUMBER, STUDENTEMAIL, EXAMID) VALUES ('" + dateTime + "', '" + roomNumber + "', '" + email + "', '" + examID + "')");
    }
    
    public void addExamSlot(String dateTime, String roomNumber) throws SQLException{
    st.executeUpdate("INSERT INTO ISDUSER.EXAMSESSION (DATETIME, ROOMNUMBER) VALUES ('" + dateTime + "', '" + roomNumber + "')");
    }
    
    public int getMaxCapacity(String roomID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.ROOM WHERE ROOMNUMBER = '" + roomID + "'";  
        ResultSet rs = st.executeQuery(fetch);
       
        while (rs.next()){
            int columnSize = rs.getInt(2);
            int rowSize = rs.getInt(3);
            System.out.println("columnSize: " + columnSize);
            System.out.println("rowSize: " + rowSize);
            int maxSize = columnSize * rowSize;
            return maxSize;
            
        }              
       return 0;   
    }
    
    public int getRoomRows(String roomID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.ROOM WHERE ROOMNUMBER = '" + roomID + "'";  
        ResultSet rs = st.executeQuery(fetch);
       
        while (rs.next()){
            int rowSize = rs.getInt(3);
            return rowSize;
            
        }              
       return 0;   
    }
    
    public ArrayList<String> getRoomIDs() throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.ROOM";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<String> temp = new ArrayList();

        while(rs.next()){
            String room = rs.getString(1);
            temp.add(new String(room));
        }
        return temp;          
    }

       public int getRoomColumns(String roomID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.ROOM WHERE ROOMNUMBER = '" + roomID + "'";  
        ResultSet rs = st.executeQuery(fetch);
       
        while (rs.next()){
            int columnSize = rs.getInt(2);
            return columnSize;
            
        }              
       return 0;   
    }
    
    
    public int getNumberOfStudents(String dateTime, String roomID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.ALLOCATEDSTUDENTS WHERE DATETIME= '" + dateTime + "' and ROOMNUMBER='" + roomID + "'";  
        ResultSet rs = st.executeQuery(fetch);
        int size = 0;
        while (rs.next()){
            size++;
        }              
       return size;   
    }
    
    public ExamType getExam(String examID) throws SQLException{
       String fetch = "SELECT * FROM ISDUSER.EXAMTYPE WHERE EXAMID = '" + examID + "'";  
       ResultSet rs = st.executeQuery(fetch);

       while (rs.next()){
            String subject = rs.getString(2);
            String duration = rs.getString(3);
            String espNumber = rs.getString(4);
            return new ExamType(examID, subject, duration, espNumber);
            
        }              
       return null;     
    }
    
    public ArrayList<AllocatedStudents> getExamAllocations(String email) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.ALLOCATEDSTUDENTS WHERE STUDENTEMAIL= '" + email + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<AllocatedStudents> temp = new ArrayList();

        while(rs.next()){
            String dateTime = rs.getString(1);
            String roomNumber = rs.getString(2);
            String studentEmail = rs.getString(3);
            String examID = rs.getString(4);
            temp.add(new AllocatedStudents(dateTime, roomNumber, studentEmail, examID));
        }
        return temp;
    }
    
    public void unallocateStudent(String dateTime, String email) throws SQLException{
        st.executeUpdate("DELETE FROM ISDUSER.ALLOCATEDSTUDENTS WHERE DATETIME='" + dateTime + "' AND STUDENTEMAIL='" + email + "'");
    }
    
    //Find user by email and password in the database   
    public User findUser(String email, String password) throws SQLException {  
       String fetch = "SELECT * FROM ISDUSER.USERS WHERE EMAIL = '" + email + "' AND PASSWORD = '" + password +"'";  
       ResultSet rs = st.executeQuery(fetch);

       while (rs.next()){
            String userEmail = rs.getString(1);
            String userPass = rs.getString(3);
            String userName = rs.getString(2);
            return new User(userName, userEmail, userPass);
            
        }              
       return null;   
    }
        
    public String findEmail(String email) throws SQLException {  
       String fetch = "SELECT * FROM ISDUSER.USERS WHERE email = '" + email + "'";  
       ResultSet rs = st.executeQuery(fetch);

       while (rs.next()){
            String userEmail = rs.getString(1);
            return userEmail;
            }           
       return null;   
    }

    public String findName(String email) throws SQLException {  
       String fetch = "SELECT * FROM ISDUSER.USERS WHERE email = '" + email + "'";  
       ResultSet rs = st.executeQuery(fetch);

       while (rs.next()){
            String userName = rs.getString(2);
            return userName;
            }           
       return null;   
    }
    
    //Add a user-data into the database   
    public void addUser(String email, String name, String password) throws SQLException {                   //code for add-operation       
    st.executeUpdate("INSERT INTO ISDUSER.USERS (EMAIL, NAME, PASSWORD) VALUES ('" + email + "', '" + name + "', '" + password + "')");
    }

    //update a user details in the database   
    public void updateUser( String email, String name, String password, String emailold) throws SQLException {       
      st.executeUpdate("UPDATE ISDUSER.USERS SET EMAIL='" +  email + "', NAME='" + name + "', PASSWORD='" + password  +  "'");
    }       

    //delete a user from the database   
    public void deleteUser(String email) throws SQLException{       
       st.executeUpdate("DELETE FROM ISDUSER.USERS WHERE EMAIL='" + email + "'");
    }

    //Read all USERS and store the results into rs. Then iterate through each set and read every attribute by index
    //Create and add each user from the table to the ArrayList
    public ArrayList<User> fetchUSERS() throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.USERS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> temp = new ArrayList();

        while(rs.next()){
            String name = rs.getString(2);
            String email = rs.getString(1);
            String password = rs.getString(3);
            temp.add(new User(name,email,password));
        }
        return temp;
    }

    //Read every row from USERS and verify by email and pword if a user exists or not
    public boolean checkUser(String email, String password) throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.USERS WHERE EMAIL='" + email + "' AND PASSWORD='" + password +"'";
        ResultSet rs = st.executeQuery(fetch);

        while(rs.next()){
            String userEmail = rs.getString(2);
            String userPass = rs.getString(3);
            if(userEmail.equals(email) && userPass.equals(password)){
                return true;
            }
        }
        return false;
    }
    //LOGS
    public ArrayList<Log> fetchLog(String email) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.LOG WHERE EMAIL='" + email + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Log> temp = new ArrayList();

        while(rs.next()){
            String type = rs.getString(1);
            String date = rs.getString(2);
            String foundemail = rs.getString(3);
            temp.add(new Log(type,date,foundemail));
        }
        return temp;
    }
    
    public void addLog(String type, String date, String email) throws SQLException {                   //code for add-operation       
    st.executeUpdate("INSERT INTO ISDUSER.LOG (TYPE, DATE, EMAIL) VALUES ('" + type + "', '" + date + "', '" + email + "')");
    }
    
    //STAFF LOGS
    public ArrayList<StaffLog> fetchStaffLog(String email) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.STAFFLOG WHERE EMAIL='" + email + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<StaffLog> temp = new ArrayList();

        while(rs.next()){
            String type = rs.getString(1);
            String date = rs.getString(2);
            String foundemail = rs.getString(3);
            temp.add(new StaffLog(type,date,foundemail));
        }
        return temp;
    }
    
    public void addStaffLog(String type, String date, String email) throws SQLException {                   //code for add-operation       
    st.executeUpdate("INSERT INTO ISDUSER.STAFFLOG (TYPE, DATE, EMAIL) VALUES ('" + type + "', '" + date + "', '" + email + "')");
    }
    
    //STAFF
    public Staff findStaff(String email, String password) throws SQLException {  
       String fetch = "SELECT * FROM ISDUSER.STAFF WHERE EMAIL = '" + email + "' AND PASSWORD = '" + password +"'";  
       ResultSet rs = st.executeQuery(fetch);

       while (rs.next()){
            String userEmail = rs.getString(1);
            String userPass = rs.getString(3);
            String userName = rs.getString(2);
            return new Staff(userName, userEmail, userPass);
            
        }              
       return null;   
    }
    
    public String findStaffEmail(String email) throws SQLException {  
       String fetch = "SELECT * FROM ISDUSER.STAFF WHERE EMAIL = '" + email + "'";  
       ResultSet rs = st.executeQuery(fetch);

       while (rs.next()){
            String userEmail = rs.getString(1);
            return userEmail;
            }           
       return null;   
    }

    //Add a user-data into the database   
    public void addStaff(String email, String name, String password) throws SQLException {                   //code for add-operation       
    st.executeUpdate("INSERT INTO ISDUSER.STAFF (EMAIL, NAME, PASSWORD) VALUES ('" + email + "', '" + name + "', '" + password + "')");
    }

    //update a user details in the database   
    public void updateStaff( String email, String name, String password, String emailold) throws SQLException {       
      st.executeUpdate("UPDATE ISDUSER.STAFF SET EMAIL='" +  email + "', NAME='" + name + "', PASSWORD='" + password  +  "' WHERE EMAIL='" + emailold + "'");
    }       

    //delete a user from the database   
    public void deleteStaff(String email) throws SQLException{       
       st.executeUpdate("DELETE FROM ISDUSER.STAFF WHERE EMAIL='" + email + "'");
    }

    //Read all USERS and store the results into rs. Then iterate through each set and read every attribute by index
    //Create and add each user from the table to the ArrayList
    public ArrayList<Staff> fetchStaff() throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.STAFF";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Staff> temp = new ArrayList();

        while(rs.next()){
            String name = rs.getString(2);
            String email = rs.getString(1);
            String password = rs.getString(3);
            String gender = rs.getString(4);
            String favcol = rs.getString(5);
            String phone = rs.getString(6);
            temp.add(new Staff(name,email,password));
        }
        return temp;
    }

    //Read every row from USERS and verify by email and pword if a user exists or not
    public boolean checkStaff(String email, String password) throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.STAFF WHERE EMAIL='" + email + "' and password='" + password +"'";
        ResultSet rs = st.executeQuery(fetch);

        while(rs.next()){
            String userEmail = rs.getString(2);
            String userPass = rs.getString(3);
            if(userEmail.equals(email) && userPass.equals(password)){
                return true;
            }
        }
        return false;
    }

}


    