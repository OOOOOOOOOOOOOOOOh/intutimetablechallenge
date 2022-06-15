/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
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

@WebServlet(name = "StaffExamRoomSessionServlet", urlPatterns = {"/StaffExamRoomSessionServlet"})
public class StaffExamRoomSessionServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String room = (String) request.getParameter("room");
            String dateTime = (String) request.getParameter("dateTime");
            
            System.out.println("Room is:" + room);
            System.out.println("dateTime:" + dateTime);
            
            DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.openConnection();
            DBManager manager = new DBManager(conn);
            
            ArrayList<uts.isd.model.StudentExamRoomList> studentExamRoomList = manager.fetchStudentExamRoomList(dateTime, room);
            System.out.println("Found Student List");
            int maxExamStudents = manager.getMaxExamStudents(dateTime, room);
            int examQuantity = manager.getExamQuantity(dateTime, room);
            session.setAttribute("studentExamRoomList", studentExamRoomList);
            session.setAttribute("viewRoom", room);
            session.setAttribute("maxExamStudents", maxExamStudents);
            session.setAttribute("examQuantity", examQuantity);
            System.out.println("Redirecting to examroom view");
            String redirectURL = "staff-view-exam-session.jsp";
            response.sendRedirect(redirectURL);
            } 
        catch (ClassNotFoundException | SQLException e)
        {
            e.printStackTrace(System.out);
            Logger.getLogger(UserLogServlet.class.getName()).log(Level.SEVERE, null, e);
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