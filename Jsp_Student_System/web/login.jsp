<%-- 
    Document   : login
    Created on : 03-Aug-2025, 3:07:30 pm
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
        <title>Login Page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
         <style>
        body{
            background-color:#f5c2c7;
        }
        label,input{
            font-size:30px;
            font-family:sens-serif;
        }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center text-primary">Login</h1>
            <form action="login.jsp" method="post">
                <div class="mb-3">
                    <label>Name</label>
                    <input type="text" class="form-control" name="name" required="">
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="text" class="form-control" name="pass" required="">
                </div>
                <div class="row">
                    <div class="col">
                        <input type="submit" class="btn btn-primary" name="login" value="Login"><br><br>
                    </div>
                    <div class="col">
                        <a href="signup.jsp" class="btn btn-dark">Sign Up</a>
                    </div>
                    <div class="col">
                        <a href="reset.jsp" class="btn btn-danger">Reset Password</a>
                    </div>
                    <div class="col">
                        <a href="forgetpassword.jsp"  class="btn btn-dark">Forget Password</a>
                    </div>
                </div>
            </form>
        </div>
        <%
            if(request.getParameter("login")!=null){
                  String Name=request.getParameter("name");
                  String Pass=request.getParameter("pass");
                  String sql="sp_admin_login ?,?";
                  try(Connection c=DB.JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                  ps.setString(1,Name);
                  ps.setString(2,Pass);
                  ResultSet rs=ps.executeQuery();
                  if(rs.next()){
                  %>
                  <script>
                      alert("Login SuccessFully....");
                      loaction.assign("http://localhost:8081/Jsp_Student_System/student.jsp");
                  </script>
                  <%
                      HttpSession ses=request.getSession();
                      ses.setAttribute("N",Name);
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
       <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>

