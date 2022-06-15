/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;
import java.util.logging.*;

/**
 *
 * @author Sam (1/2) + caitlin :)
 */

@WebServlet(name = "StaffLoginServlet", urlPatterns = {"/StaffLoginServlet"})
public class StaffLoginServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //start session
            HttpSession session = request.getSession();
            String email = (String) request.getParameter("email");
            String password = (String) request.getParameter("password");
            System.out.println("Email is:" + email);
            System.out.println("Password is:" + password);


            session.setAttribute("tos", "on");
   
            //3) retrieve the manager instance from session - ConnServlet   

                try {
                DBConnector dbConnector = new DBConnector();
                Connection conn = dbConnector.openConnection();
                DBManager manager = new DBManager(conn);
                //find staff in dB, which is returned as type Staff
                uts.isd.model.Staff user = (uts.isd.model.Staff) manager.findStaff(email, password);
                //set session attribute as staff
                session.setAttribute("user", user);
                
                //if user has been found
                if (user != null){
                    String name = user.getName();
                    System.out.println("User is not null");
                    System.out.println("Name is: " + name);
                    System.out.println("email is: " + email);
                    System.out.println("password is: " + password);
                    session.setAttribute("login", "true");
                    session.setAttribute("name", name);
                    session.setAttribute("email", email);
                    session.setAttribute("password", password);
                    session.setAttribute("staffLogin", "true");
                    String redirectURL = "staff-index.jsp";
                    LocalDateTime date = LocalDateTime.now();
                    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                    String formattedDateTime = date.format(dateTimeFormatter);
                    manager.addStaffLog("staff login", formattedDateTime, email);
                    response.sendRedirect(redirectURL);
                    System.out.print("user logged in");

                }
                //if user not found in db
                else {
                    String redirectURL = "staff-login.jsp";
                    response.sendRedirect(redirectURL);
                    System.out.print("user not found");
                    session.setAttribute("userNotFound", "true");
                }
                

                if(manager.findUser(email, password) == null){
                    System.out.println("user exists!");
                }
                else{
                    System.out.println("user dead");
                }
                } 
                catch (ClassNotFoundException | SQLException e)
                {
                    e.printStackTrace(System.out);
                }



        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}