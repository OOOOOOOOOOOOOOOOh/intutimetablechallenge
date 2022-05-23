/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author samuel.lim2
 */
public class AllocatedStudents implements Serializable {
    private String dateTime;
    private String roomNumber;
    private String studentID;
    private String examID; 

    public AllocatedStudents(String dateTime, String roomNumber, String studentID, String examID){
        this.dateTime = dateTime;
        this.roomNumber = roomNumber;
        this.studentID = studentID;
        this.examID = examID;
    }
    
    public String getDateTime() {
        return dateTime;
    }
    
    public String getExamID(){
        return examID;
    }
    
    public String getRoom() {
        return roomNumber;
    }
}
