<%-- 
    Document   : index
    Created on : 03-Aug-2025, 3:06:53 pm
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Student Application System </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <style>
            body::-webkit-scrollbar{
                display:none;
                overflow-x: hidden;
                overflow-y: hidden;
            }
            .content ul li{
                list-style:none;
                text-indent:20px;
                font-size:20px;
                color:white;
            }
            .nav-link{
                border-radius:5px;
                color:white;
            }
            .nav-link:hover{
               color:blue;
            }
        </style>
    </head>
    <body>
       
        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color:black;">
            <a class="navbar-brand text-primary fw-bold" href="#"><img src="image/sms.avif" style="width:50px;height:50px;border-radius:50%">&nbsp;STUDENT MANAGEMENT SYSTEM</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link  fw-bold" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold" href="#about">About</a>
                    </li>
                </ul>
            </div>
            <div>
                <a class="btn btn-primary  px-4 fw-bold" href="login.jsp">Login</a>
            </div>
         </nav> 
 <div id="carouselExampleFade" class="carousel slide carousel-fade">
   <div class="carousel-inner" style="width:100%;height:400px;background-size: cover;overflow:hidden;">
    <div class="carousel-item active">
      <img src="image/image.webp" class="d-block w-100" style="object-fit: cover;" alt="studentimage">
    </div>
    <div class="carousel-item">
      <img src="image/image1.jpg" class="d-block w-100" style="object-fit:cover;" alt="studentimage">
    </div>
    <div class="carousel-item">
      <img src="image/image2.jpg" class="d-block w-100" style="object-fit:cover;" alt="studentimage">
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
<section id="about" style="background-color: black;height:100vh;">
    <div class="container p-5">
      <h2 class="text-success text-center fw-bold">Student Management System: Overview, Key Features, and More</h2>
      <div class="content">
            <ul>
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
      </div>
      <div class="row mt-5">
          <div class="col col-lg-6 g-5 d-flex justify-content-center">
              <img src="image/student.avif" style="width:400px;height:250px;border-radius: 10px;">
          </div>
          <div class="col col-lg-6 g-5 d-flex justify-content-center">
              <img src="image/image4.jpg" style="width:400px;height:250px;border-radius: 10px;">
          </div>
      </div>
     </div>    
</section>
        
<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>


    </body>
</html>

