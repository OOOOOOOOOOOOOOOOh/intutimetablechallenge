/*
 * User is a JavaBean that stores name, email, password and DOB
 * 
 */
package uts.isd.model;
import java.io.Serializable;
/**
 *
 * @author Samuel Lim
 */
public class Log implements Serializable{
    private String type;
    private String date;
    private String email;

    public Log(String type, String date, String email){
        this.type = type;
        this.email = email; 
        this.date = date;
    }

    public String getType() {
        return type;
    }


    public String getEmail() {
        return email;
    }


    public String getDate() {
        return date;
    }
}