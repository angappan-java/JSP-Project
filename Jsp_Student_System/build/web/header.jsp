<%-- 
    Document   : header
    Created on : 09-Aug-2025, 9:29:19 pm
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP_STUDENT_SYSTEM</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand ps-4" href="student.jsp">Student Management System</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link btn btn-success fw-bold me-3 text-white" href="admin_details.jsp">ADMIN</a>
                    </li>
                    <li class="nav-item">
                        <form action="pdf" method="get">
                            <button type="submit" class="btn btn-primary fw-bold me-3">PDF</button>                   
                        </form>
                    </li>
                    <li class="nav-item">
                        <form action="csv" method="get">
                            <button type="submit" class="btn btn-warning fw-bold me-3">CSV</button>
                        </form>
                    </li>
                    <li>
                        
                    </li>
                </ul>
            </div>
        </nav>
       