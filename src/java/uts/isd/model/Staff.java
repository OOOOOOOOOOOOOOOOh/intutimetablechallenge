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
public class Staff {
    private String name;
    private String email;
    private String password;
    private String gender;
    private String favcol; 
    private String phone;
    
    public Staff(String name, String email, String password, String favcol, String gender, String phone){
        this.name = name;
        this.email = email; 
        this.password = password;
        this.gender = gender; 
        this.favcol = favcol;
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getFavcol() {
        return favcol;
    }

    public void setFavcol(String favcol) {
        this.favcol = favcol;
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.favcol = phone;
    }
}