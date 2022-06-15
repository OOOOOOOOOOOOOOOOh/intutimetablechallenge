/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.isd.model;
import java.io.Serializable;
/**
 *
 * @author Samuel Lim
 */
public class StudentExamRoomList implements Serializable{
    private String email;
    private String examID;

    public StudentExamRoomList(String email, String examID){
        this.email = email;
        this.examID = examID;
    }

    public String getEmail() {
        return email;
    }

    public String getExamID() {
        return examID;
    }
}