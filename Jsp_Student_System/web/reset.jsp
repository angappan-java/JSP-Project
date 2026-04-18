<%-- 
    Document   : reset
    Created on : 04-Aug-2025, 1:00:37 pm
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
      <link rel="stylesheet" href="assets/css/bootstrap.min.css">
      <style>
        body{
            background-color:yellowgreen;
        }
        label,input{
            font-size:30px;
            font-family:sens-serif;
        }
    </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-info text-center">Reset Password</h1>
            <form action="reset.jsp" method="post">
              
                <div class="mb-3">
                    <label>ID</label>
                    <input type="text" class="form-control" name="name" required>
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" class="form-control" name="pass" required>
                </div>
                 <div class="mb-3">
                    <label>Confirm Password</label>
                    <input type="password" class="form-control" name="cpass" required>
                </div>
                <div class="row">
                    <div class="col">
                        <input type="submit" class="btn btn-primary" name="reset" value="Reset">
                    </div>
                    <div class="col">
                        <a href="login.jsp" class="btn btn-info">Login</a>
                    </div>
                </div>
            </form>
            <%
                 if(request.getParameter("reset")!=null){
                    String Id=request.getParameter("id");
                    String Name=request.getParameter("name");
                    String Pass=request.getParameter("pass");
                    String Cpass=request.getParameter("cpass");
                    if(Pass.equals(Cpass)){
                            String sql="sp_admin_update ?,?,?";
                               try(Connection con=DB.JDBC.con();PreparedStatement ps=con.prepareStatement(sql);){
                                    ps.setString(1,Id);
                                    ps.setString(2,Name);
                                    ps.setString(3,Cpass);
                                   int a= ps.executeUpdate();
                                   if(a>0){
                                        %>
                                        <script>
                                            alert("Password Change SuccessFully.....");
                                        </script>                     
                                   <%
                                       }else
                                       {
                    %>               
                    <script>
                        alert("No Change Password....");
                    </script>
                                    <%
                                  }
                       }catch(Exception e){
                                out.println("Error :"+e);
                             }
                     }else{
                            %>
                            <script>alert("Password field and Confirm Password Fields are not Mached...");</script>
                            <%
                         }
                }
            %>
        </div>
           <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
