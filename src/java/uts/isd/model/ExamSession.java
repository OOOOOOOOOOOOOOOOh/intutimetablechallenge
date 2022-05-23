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
public class ExamSession implements Serializable {
    private String dateTime;
    private String roomNumber;

    public ExamSession(String dateTime, String roomNumber){
        this.dateTime = dateTime;
        this.roomNumber = roomNumber;
    }
    
    public String getDateTime() {
        return dateTime;
    }
    
    public String getRoom() {
        return roomNumber;
    }
}
