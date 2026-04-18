<%-- 
    Document   : student
    Created on : 03-Aug-2025, 3:07:39 pm
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<%@page import="jakarta.servlet.http.*"%>
<%@page import="jakarta.servlet.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
         <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    </head>
    <body>
        <%
          HttpSession ses=request.getSession();
          String Name=(String)ses.getAttribute("N");
          
         ses.setMaxInactiveInterval(180);
         if(Name==null){
             response.sendRedirect("login.jsp");
            }
          if(request.getParameter("logout")!=null){
             ses.removeAttribute("name");
             response.sendRedirect("login.jsp");
            }
        %>
        <div class=" container">
            <h1 class="text-center">Student Reports</h1>
            <h2 class="text-center">Welcome Hai....<%=Name%></h2>
        </div>
         <script src="assets/js/bootstrap.min.js"></script>
     </body>
</html>
