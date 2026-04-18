<%-- 
    Document   : index
    Created on : 03-Aug-2025, 3:06:53 pm
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Application System </title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <style>
            
        </style>
    </head>
    <body>
       
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <h1 class="navbar-brand ps-4">STUDENT MANAGEMENT SYSTEM</h1>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link btn btn-info me-3 text-dark fw-bold" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
         </nav> 
        <div id="carouselExampleFade" class="carousel slide carousel-fade">
            <div class="carousel-inner" style="width:100%;height:500px;background-size: cover;">
    <div class="carousel-item active">
      <img src="image/student.jpeg" class="d-block w-100" alt="studentimage">
    </div>
    <div class="carousel-item">
      <img src="image/student1.jpeg" class="d-block w-100" alt="studentimage">
    </div>
    <div class="carousel-item">
      <img src="image/student2.jpeg" class="d-block w-100" alt="studentimage">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
        <div class="container-fluids bg-info">
            <h2 class="text-dark  text-center fs-60 fw-bold">Student Management System: Overview, Key Features, and More</h2>
            <p class="text-center fs-40">
            <ul class="ms-4">
                <li>Managing student records used to involve a lot of paperwork, stacks of files, and manual registers. 
                    If you’re still using this process, there are now more efficient alternatives available. 
                    Schools today are transforming how they handle administrative tasks by embracing technology, 
                    and you don’t want to be left behind.
                </li>
                <li>
                    A Student Management System (SMS) is the game-changer you need. 
                    It’s not just about moving away from paper—it’s about automating and 
                    simplifying everything from student add,update,delete and all records.   
                </li>
                <li>
                    Instead of spending unnecessary time and effort, a streamlined, efficient system can manage it all.
                    Let’s explore what a Student Management System is,
                    its key features, and why it has become an essential tool for schools.
                </li>
            </ul>
        </p>
        <jsp:include page="footer.jsp"/>
        </div>
        
<script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>

