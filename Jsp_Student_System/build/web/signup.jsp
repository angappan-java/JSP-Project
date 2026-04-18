<%-- 
    Document   : signup
    Created on : 03-Aug-2025, 3:07:17 pm
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN SIGNUP PAGE</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    </head>
    <style>
        body{
            background-color:#f5c2c7;
        }
        label,input{
            font-size:30px;
            font-family:sens-serif;
        }
    </style>
    <body>
        <div class="container text-center">
            <h1 class="text-center text-primary">Sign Up</h1>
            <form action="signup.jsp" method="post">
                  <div class="mb-3">
                <label>Id</label>
                <input type ="text" class="form-control" name="id" required="">
            </div>
            <div class="mb-3">
                <label>Name</label>
                <input type ="text" class="form-control" name="name" required>
            </div>
            <div class="mb-3">
                <label>Password</label>
                <input type ="text" class="form-control" name="pass" required>
            </div>
            <div class="row">
                <div class="col">
                    <input type="submit" class="btn btn-primary" name="signup" value="SignUp"><br><br>
                </div>
                <div class="col">
                    <a href="login.jsp" class="btn btn-info">Login</a>
                </div>
                <div class="col">
                    <a href="forgetpassword.jsp" class="btn btn-danger">Forget Password</a>
                </div>
                <div class="col">
                <a href="reset.jsp" class="btn btn-danger">Reset Password</a>
            </div>
            </div>
          </form>
        </div>
        <%
           if(request.getParameter("signup")!=null){
             String Id=request.getParameter("id");
             String Name=request.getParameter("name");
             String Pass=request.getParameter("pass");
             String sql="sp_admin_insert ?,?,?";
             try(Connection conn=JDBC.con();PreparedStatement pst=conn.prepareStatement(sql)){
                   pst.setString(1,Id);
                   pst.setString(2,Name);
                   pst.setString(3,Pass);
                   int a=pst.executeUpdate();
                   if(a>0){
            %>
            <script>
                alert("Admin Added.....");
                location.assign("http://localhost:8081/Jsp_Student_System/login.jsp");
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
        %>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
