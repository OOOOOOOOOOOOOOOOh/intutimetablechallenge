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
        <title>Logout</title>
    </head>
    <body  style="background-color: #5661ba;">


            </ul>
        </div>
        <br>
        <br>
        <br>
        <div class = "title">
            <h3 style="color:white;text-align:center;">Intuition Timetable System</h3>
        </div>
        <br>
        <h1 style="color:white;text-align:center;">Logout</h1>
        <br>
        <% session.invalidate();%>
        <p style="color:white;text-align:center;">You have been logged out.</p>
        <div class="d-flex justify-content-center">
        <form action="index.jsp" method="post">
        <button type="submit" class="btn btn-secondary">Return to the main page</button>
        </div>
        </form>
            <div style="display: flex; justify-content: center;">
            <img width="20%" id="index-img" src="images/IntuLogo.svg">
            </div>
    </body>
</html>
