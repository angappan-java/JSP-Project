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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Update</title>
          <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <style>
            body{
                background-color:#ced4da;
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
                    <input type="file" class="form-control" name="image" required="">
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
                    <div class="col-12">
                        <button type="submit" name="submit" class="btn btn-primary w-100">UPDATE</button>
                    </div>
           
        </div>
      <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
