/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;
import java.util.logging.*;
import java.time.*;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Sam (1/2) + Sam :)
 */

@WebServlet(name = "UserRegisterServlet", urlPatterns = {"/UserRegisterServlet"})
public class UserRegisterServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            HttpSession session = request.getSession();
            String name = (String) request.getParameter("name");
            String email = (String) request.getParameter("email");
            String password = (String) request.getParameter("password");
            String gender = (String) request.getParameter("gender");
            String favcol = (String) request.getParameter("favcol");
            String phone = (String) request.getParameter("phone");
            String tos = (String) request.getParameter("tos");
            
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            session.setAttribute("staffLogin", null);
            uts.isd.model.User user = new uts.isd.model.User(name, email, password);
            session.setAttribute("user", user);
            session.setAttribute("tos", tos);
   
            //3) retrieve the manager instance from session - ConnServlet   

                try {
                DBConnector dbConnector = new DBConnector();
                Connection conn = dbConnector.openConnection();
                DBManager manager = new DBManager(conn);
                Validator validator = new Validator();
                validator.clear(session);
                
            if(manager.findEmail(email) != null){
                session.setAttribute("fail", "true");
                String redirectURL = "register.jsp";
                response.sendRedirect(redirectURL);
                System.out.print("catch3");
            }
            
            else if(validator.validateEmail(email) != true){
                session.setAttribute("emailErr", "Please fill in the 'Email' field with the correct formatting");
                String redirectURL = "register.jsp";
                response.sendRedirect(redirectURL);
                System.out.print("catch3");
            }
            
            else {
                manager.addUser(email, name, password);
                
                LocalDateTime date = LocalDateTime.now();
                DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                String formattedDateTime = date.format(dateTimeFormatter);
                manager.addLog("registration", formattedDateTime, email);
                session.setAttribute("login", "true");
                String redirectURL = "index.jsp";
                response.sendRedirect(redirectURL);
                System.out.print("catch3");
            
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
                    Logger.getLogger(UserRegisterServlet.class.getName()).log(Level.SEVERE, null, e);
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