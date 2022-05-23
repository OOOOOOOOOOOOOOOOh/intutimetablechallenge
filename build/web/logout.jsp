<%-- 
    Document   : Logout
    Created on : 04/05/2022, 6:47:27 PM
    Author     : samuel.lim2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles-revised.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>IoTbay - Logout</title>
    </head>
    <body  style="background-color: #5661ba;">


            </ul>
        </div>
        <div class = "title">
            <h3 style="color:white;text-align:center;">IoTBay</h3>
        </div>
        <h1 style="color:white;text-align:center;">Logout</h1>
        <% session.invalidate();%>
        <p style="color:white;text-align:center;">You have been logged out.</p>
        <p style="color:white;text-align:center;">Return to the main page <a href=" index.jsp">here</a></p>
    </body>
</html>
