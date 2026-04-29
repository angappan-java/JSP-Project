<%-- 
    Document   : studentedit
    Created on : 09-Aug-2025, 9:56:04 am
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<%@page import="jakarta.servlet.http.*"%>
<%@page import="jakarta.servlet.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>StudentEdit-Student Application System </title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <style>
             body::-webkit-scrollbar{
                display:none;
                overflow-x: hidden;
                overflow-y: hidden;
            }
            body{
            background-image:url("image/bg3.png");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
         }
        </style>
    </head>
    <body>
        <%
        HttpSession ses=request.getSession();
          String Name=(String)ses.getAttribute("N");
          
         ses.setMaxInactiveInterval(180);
         if(Name==null){
             response.sendRedirect("login.jsp");
            }
         
        %>
        <div class=" container">
            <h1 class="text-center">Student Reports</h1>
            <h2 class="text-center">Welcome Hai....<%=Name%></h2>
            <div class="form-control bordered rounded mx-auto w-75 p-5">
                <form action="stuupdate" method="post" enctype="multipart/form-data" class="row g-3">
                <div class="col-md-6">
                    <label>ID</label>
                    <input type="text" class="form-control" name="id" value="<%=request.getAttribute("id")%>" readonly>              
                </div>
                <div class="col-md-6">
                    <label>NAME</label>
                    <input type="text" class="form-control" name="name" value="<%=request.getAttribute("name")%>" required="">
                </div>
                <div class="col-md-6">
                    <label>DOB</label>
                    <input type="date" class="form-control" name="dob" value="<%=request.getAttribute("dob")%>" required="">
                </div>
                <div class="col-md-6">
                    <label>IMAGE</label>
                    <input type="file" class="form-control" name="image">
                    <image src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString((byte[])request.getAttribute("image"))%>" alt="image" style="width:100px; height:100px">
                </div>
                <div class="col-md-6">
                    <label>Time</label>
                    <input type="text" class="form-control" name="time" value="<%=request.getAttribute("time")%>" >
                </div>
                <div class="col-md-6">
                    <label>Gender</label>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" name="gender" value="Male" 
                        <%="Male".equals(request.getAttribute("gender"))?"checked":""%>>
                        <label>MALE</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" name="gender" value="Female"
                          <%="Female".equals(request.getAttribute("gender"))?"checked":""%>>
                        <label>FEMALE</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>COURSE</label>
                    <select class="form-select" name="course" required="">
                        <option>Select The Course</option>
                        <%
                            String selectedcourse=(String)request.getAttribute("coursename");
                            String sq="select course_name from course";
                            try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sq);){
                            ResultSet rs=ps.executeQuery();
                            while(rs.next()){
                                    String N=rs.getString("course_name");
                                    String select=N.equals(selectedcourse)?"selected":"";
                                 
                                 %>
                                 <option value="<%=N%>" <%=select%>><%=N%></option>
                                 <%
                                     }
                                   
                            }catch(Exception e){
                                     out.println("Error Is :"+e);
                              }
                        %>
                    </select>
                </div>
                    <div class="offset-md-3 col-md-6 d-grid">
                        <button type="submit" name="submit" class="btn btn-primary fw-bold">UPDATE</button>
                    </div>
            </form>
         </div>
        </div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>

    </body>
</html>
