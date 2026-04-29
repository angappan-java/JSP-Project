<%-- 
    Document   : login
    Created on : 03-Aug-2025, 3:07:30 pm
    Author     : ELCOT
--%>

<%@page import="Password.SecurePassword"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<%@page import="jakarta.servlet.http.*"%>
<%@page import="jakarta.servlet.*"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login-Student Application System </title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <style>
        body{
            background-image:url("image/login.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        
        </style>
    </head>
    <body>
        <div class="container">
          <div class="form-control bordered rounded mx-auto w-50 mt-5">
            <h4 class="text-center text-primary fw-bold">Login</h4>
            <form action="login.jsp" method="post">
                <div class="row mb-3">
                    <label class="col-sm-4 fw-bold form-label">Email</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="email" required="">
                    </div>                   
                </div>
                <div class="row mb-3">
                    <label class="col-sm-4 fw-bold form-label">Password</label>
                    <div class="col-sm-8">
                        <div class="position-relative">
                          <input type="password" class="form-control" name="pass" id="password">
                          <i class="bi bi-eye-slash position-absolute top-50 end-0 translate-middle-y me-3" id="eye"
                          style="cursor:pointer;" onclick="toggleEye()"></i>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="offset-md-4 col-md-4 d-grid">
                        <button type="submit" name="login" class="btn btn-primary fw-bold">Login</button>
                    </div>
                    <div class="col-md-4 d-grid">
                        <a href="index.jsp" class="btn btn-success fw-bold">Back</a>
                    </div>
                </div>
                <div class="row">
                    <p class="text-center fw-bold mt-5">Don't Have An Account ?<a href="signup.jsp" class="text-primary" style="text-decoration: underline;">Sign Up</a></p>
                </div>
                <div class="row">
                        <p class="offset-md-4 "><a href="forgetpassword.jsp"  class="text-danger fw-bold">Forget Password ?</a></p> 
                    </div>
<!--                <div class="col">
                        <a href="reset.jsp" class="btn btn-info">Reset Password</a>
                    </div>-->
            </form>
           </div>
        </div>
        <%
            if(request.getParameter("login")!=null){
                  String Email=request.getParameter("email");
                  String Pass=request.getParameter("pass");
                  String sql="sp_admin_login ?,?";
                  try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                  ps.setString(1,Email);
                  ps.setString(2,SecurePassword.encrypt(Pass));
                  ResultSet rs=ps.executeQuery();
                  if(rs.next()){
                  %>
                  <script>
                      alert("Login SuccessFully....");
                      location.assign("http://localhost:8080/Jsp_Student_System/student.jsp");
                  </script>
                  <%
                      HttpSession ses=request.getSession();
                      ses.setAttribute("N",rs.getString("name"));
                   }else{
                  %><script>
                   alert("Login Failed....");
                  </script>
                  <%
                   }
                  }catch(Exception e){
                 out.println("Error :"+e);
            }
                  
            }
         %>
         <script>
      function toggleEye(){
	const pwd=document.getElementById("password");
	const eye=document.getElementById("eye");
	if(pwd.type==="password"){
		pwd.type="text";
		eye.classList.replace("bi-eye-slash","bi-eye");
	}else{
		pwd.type="password";
		eye.classList.replace("bi-eye","bi-eye-slash");
	}
}
        </script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>

    </body>
</html>

