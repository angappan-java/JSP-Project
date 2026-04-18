<%-- 
    Document   : forgetpassword
    Created on : 04-Aug-2025, 1:01:06 pm
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
         <link rel="stylesheet" href="assets/css/bootstrap.min.css">
         <style>
        body{
            background-color:wheat;
        }
        label,input{
            font-size:30px;
            font-family:sens-serif;
        }
    </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-dark text-center">Forget Password</h1>
            <form action="forgetpassword.jsp" method="get">
                <div class="mb-3">
                    <label>ID</label>
                    <input type="text" class="form-control" name="id" required="">
                </div>
                <%
                            if(request.getParameter("get")!=null){
                                  String Id=request.getParameter("id");
                                  String Sql="sp_admin_getbyone ?";
                                  try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(Sql);){
                                      ps.setString(1,Id);
                                      ResultSet rs=ps.executeQuery();
                                      if(rs.next()){
                                              String Name=rs.getString("name");
                                              String Pass=rs.getString("pass");
                          %>
                 <div class="mb-3">
                    <label>Name</label>
                    <input type="text" class="form-control" value=<%=Name%> readonly="">
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="text" class="form-control" value=<%=Pass%> readonly="">
                </div>
                    <script>alert("The Name is :"+<%=Name%>+ "The Password is :"+<%=Pass%>);</script>                        
                <%                    
                                         }
                                      
                               }catch(Exception e){
                                    out.println("Error Is :"+e);
                               }
                        }
                %>
               
                <div class="row">
                    <div class="col">
                        <input type="submit" class="btn btn-primary" name="get" value="Get Password">
                    </div>
                     <div class="col">
                         <a href="login.jsp" class="btn btn-info">Login</a>
                    </div>
                </div>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
