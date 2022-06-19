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

/**
 *
 * @author Sam (1/2) + Sam :)
 */

@WebServlet(name = "UserUpdateServlet", urlPatterns = {"/UserUpdateServlet"})
public class UserUpdateServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String emailOld = (String) session.getAttribute("emailOld");
            System.out.println(emailOld);
            System.out.print(email);

            DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.openConnection();
            DBManager manager = new DBManager(conn);
            Validator validator = new Validator();
            validator.clear(session);
            System.out.println(manager.findEmail(email));
            if(!(email.equals(emailOld)) && (manager.findEmail(email) != null)){
                session.setAttribute("userexists", "true");
                System.out.println("User found!");
            }

            else {
                manager.updateUser(email, name, password, emailOld);
                uts.isd.model.User user = new uts.isd.model.User(name, email, password);
                session.setAttribute("user", user);
                System.out.println("User updated!");
            }
            
            String redirectURL = "index.jsp";
            response.sendRedirect(redirectURL);

            } 
            catch (ClassNotFoundException | SQLException e)
            {
                e.printStackTrace(System.out);
                Logger.getLogger(UserRegisterServlet.class.getName()).log(Level.SEVERE, null, e);
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