<%-- 
    Document   : account-details
    Created on : 09/05/2022, 12:28:32 AM
    Author     : yasmingupta
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.Payment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Device"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.isd.model.dao.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Details</title>
        <link rel="stylesheet" href="styles-revised.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    </head>
    
     <%
    DBConnector dbConnector = new DBConnector();
    Connection conn = dbConnector.openConnection();
    DBManager manager = new DBManager(conn);
    session.setAttribute("manager", manager);
    User user = (User)session.getAttribute("user");
    String email = (String) user.getEmail();
    ArrayList<Payment> paymentList = manager.getPayment(email);
    String stafflogin = (String) session.getAttribute("staffLogin");
    %>
    
    <body style="background-color: #5661ba;">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <!-- Container wrapper -->
            <div class="container-fluid">
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Navbar brand -->
                <a class="navbar-brand mt-2 mt-lg-0" href="#"></a>
                <!-- Left links -->
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                  <% if (stafflogin == null){ %>
                    <a class="nav-link" href="index.jsp">Home Page</a>
                      <%} else {%>
                      <a class="nav-link" href="staff-index.jsp">Home Page</a>
                   <%};%>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="device-catalogue.jsp"></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                  </li>
                </ul>
                <!-- Left links -->
              </div>
              <!-- Right elements -->
              <div class="d-flex align-items-center">
                <!-- Shopping Cart -->
                <a class="text-reset me-3" href="#">
                  
                </a>
                <!-- Profile -->
                <% if (stafflogin != null){ %>
                    <a class="text-reset me-3" href="staff-account.jsp">
                <%} else {%>
                    <a class="text-reset me-3" href="account.jsp">
                <%};%>
                    <i class="fa fa-user"></i>
                </a>
                <a href="logout.jsp" class="nav-link">Logout</a>
              <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
          </nav>
         <!-- Navbar -->
         
         
               <div class="container-fluid">
                               <div class="row d-flex justify-content-center mt-5 mb-5">
                               <div class="col-md-6">
                               <div id="card-input" class="card p-4">
                               <div class="text-left">
                                   <h5>Payment Details</h5>
<div class="mt-3">                                   
<a href ="payment-details.jsp"><button type="submit" id="purple-button" class="button btn btn-primary w-100 d-flex justify-content-center align-items-center">
        <span>Add Payment Details</span><i class="fa fa-long-arrow-right ms-2"></i>
    </button></a>
</div><br>


<%for(Payment payment:paymentList) {%>


    <th><form action="payment-details-update.jsp" method="GET">
      <button class="device-admin-btn-edit"  name="paymentID" value="<%=payment.getPaymentID()%>">Update Payment Details for PaymentID   </button>
      <p><%=payment.getPaymentID()%></p>
        </form></th>
        
        <th><form action="payment-details-delete.jsp" method="GET">
      <button class="device-admin-btn-edit"  name="paymentID" value="<%=payment.getPaymentID()%>">Delete Payment Details for PaymentID    </button>
      <p><%=payment.getPaymentID()%></p>
        </form></th>
        
        <style>
            p {
                font-size: 11pt;
                color: #5661ba;
                padding-top: 4.5px;
            }
            
            a {
                text-decoration: none;
            }
            
            button {
                margin-right: 3px;
            }
        </style>

<table>
  <tr>
    <th><%payment.getPaymentMethod(); %></th>
    <th><%payment.getCardName(); %></th>
    <th><%payment.getCardNumber(); %></th>
    <th><%payment.getCardExpiry(); %></th>
    <th><%payment.getCardCVV(); %></th>
    
    </div>
                               </div>
                               </div>
                               </div>
               </div>

    <th></th>
  </tr>
</table>

<%};
%>

    </body>
</html>