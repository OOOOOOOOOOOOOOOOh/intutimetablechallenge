package uts.isd.controller;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.*;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBManager;

/*
 * @author Caitlin O'Malley
 */

public class Validator implements Serializable {  
    private final String deviceNamePattern = "^[_A-z0-9]*((-|\\s)*[_A-z0-9])*$";
    private final String devicePricePattern = "(^\\d{0,8}(\\.\\d{2})?$)"; 
    private String deviceStockPattern = "(^\\d+$)";
    private String phonePattern = "([0-9]{0,10})";  

    
    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";

    public Validator(){}

    public boolean validate(String pattern, String input){
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    } 

    public boolean validatePhone(String phone){
        return validate(phonePattern, phone);
    }
    
    public boolean validateDeviceName(String name){
        return validate(deviceNamePattern, name);
    }

    public boolean validateDevicePrice (String price){
        return validate(devicePricePattern, price);
    }

    public boolean validateDeviceStock(String stock){
        return validate(deviceStockPattern, stock);
    }

    public boolean deviceIsEmpty(String name, String desc, String price, String stock){
        return name.isEmpty() || desc.isEmpty() || price.isEmpty() || stock.isEmpty();
    }

    public boolean paymentDetailsIsEmpty(String paymentMethod, String name, String number, String expiry, String CVV){
        return paymentMethod.isEmpty() || name.isEmpty() || number.isEmpty() || expiry.isEmpty() || CVV.isEmpty();
    }

    public boolean validateEmail(String email){
        return validate(emailPattern, email);
    }
    
    public void clear(HttpSession session){
        session.setAttribute("deviceEmptyErr", "");  
        session.setAttribute("deviceNameErr", "");
        session.setAttribute("devicePriceErr", ""); 
        session.setAttribute("devieStockErr", ""); 
        session.setAttribute("deviceIdErr", ""); 
        session.setAttribute("deviceAddSuccess", ""); 
        session.setAttribute("deviceDeleteSuccess", ""); 
        session.setAttribute("deviceEditSuccess", "");
        session.setAttribute("emailErr", "");
        session.setAttribute("phoneErr", "");
    }
}
