<%-- 
    Document   : signup
    Created on : 03-Aug-2025, 3:07:17 pm
    Author     : ELCOT
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Password.SecurePassword"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign Up-Student Application System </title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    </head>
    <style>
        body{
            background-image:url("image/bg4.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
 <body>
    <div class="container text-center">
        <div class="form-control bordered rounded mx-auto w-50 mt-5">
         <h4 class="text-center text-primary">Register Form</h4>
          <form action="signup.jsp" method="post">
            <div class="row mb-3">
                <label class="col-sm-4 form-label fw-bold">Id</label>
                <div class="col-sm-8">
                    <input type ="text" class="form-control" name="id" required="">
                </div>              
            </div>
            <div class="row mb-3">
                <label class="col-sm-4 form-label fw-bold">Name</label>
                <div class="col-sm-8">
                    <input type ="text" class="form-control" name="name" required>
                </div>               
            </div>
            <div class="row mb-3">
                <label class="col-sm-4 form-label fw-bold">Email</label>
                <div class="col-sm-8">
                    <input type ="email" class="form-control" name="email" required>
                </div>               
            </div>
            <div class="row mb-3">
                <label class="col-sm-4 form-label fw-bold">Password</label>
                <div class="col-sm-8">
                    <div class="position-relative">
                      <input type="password" class="form-control" name="pass" id="password">
                      <i class="bi bi-eye-slash position-absolute top-50 end-0 translate-middle-y me-3" id="eye"
                          style="cursor:pointer;" onclick="toggleEye()"></i>
                 </div>
                </div>          
            </div>
            <div class="row mb-3">
                <div class="offset-md-4 col-md-4 d-grid">
                    <button type="submit" name="signup" class="btn btn-primary fw-bold">Register</button>
                </div>
                <div class="col-md-4 d-grid">
                    <a href="login.jsp" class="btn btn-danger fw-bold">Back</a>
                </div>
            </div>
          </form>
          </div>
        </div>
        <%
           if(request.getParameter("signup")!=null){
             String Id=request.getParameter("id");
             String Name=request.getParameter("name");
             String Email=request.getParameter("email");
             String Pass=request.getParameter("pass");
             String sql="sp_admin_insert ?,?,?,?";
             String regexp="^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[~!@#$%^&*_=+-]).{8,}$";
             if(Pass.matches(regexp)){
                    String encryptpassword=SecurePassword.encrypt(Pass);
                    try(Connection conn=JDBC.con();PreparedStatement pst=conn.prepareStatement(sql)){
                   pst.setString(1,Id);
                   pst.setString(2,Name);
                   pst.setString(3,Email);
                   pst.setString(4,encryptpassword);
                   int a=pst.executeUpdate();
                   if(a>0){
            %>
            <script>
                alert("Admin Added.....");
                location.assign("http://localhost:8080/Jsp_Student_System/login.jsp");
            </script>
            <%}
                   else{
            %>
            <script>
                alert("Admin Added Process Failed...");
            </script>
            <%
                   } 
              }catch(Exception e){
                 out.println("Error :"+e);
              }
            }    
             else{
             %>
             <script>
                 alert("Invalid Password !.Password Must Be 8 Charactor Include One UpperCase,One LowerCase,One Number, One Special Charactor");
             </script>
             <%
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
