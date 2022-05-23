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
public class ExamType implements Serializable {    
    private String examID;
    private String subject;
    private String duration;
    private String espNumber;

    public ExamType(String examID, String subject, String duration, String espNumber){
        this.examID = examID;
        this.subject = subject;
        this.duration = duration;
        this.espNumber = espNumber;
    }
    
    public String getExamID() {
        return examID;
    }
    
    public String getSubject() {
        return subject;
    }
    
    public String getDuration() {
        return duration;
    }
    
    public String getEspNumber() {
        return espNumber;
    }    
    
}
