<%-- 
    Document   : admin_details
    Created on : 09-Aug-2025, 10:13:51 pm
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Details</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <style>
            body{
                background-color:#adb5bd;
                text-align: center;
                
            }
        </style>
    </head>
    <body>
        <%
            HttpSession  ses=request.getSession();
            String Name=(String)ses.getAttribute("N");
            ses.setMaxInactiveInterval(180);
            if(Name==null){
             response.sendRedirect("login.jsp");
             }
        %>
        <h1 class="text-center text-dark">ADMIN DETAILS</h1>
        <h2 class="text-center text-dark">Welcome Hai ...<%=Name%></h2>
        <div class="container">
                   <table class="table table-bordered" style="color:black;border:2px solid black;text-align: center;background-color:white;">
            <thead style="color:black;font-size:20px;background-color:gray">
                <td>ID</td>
                <td>NAME</td>
                <td>PASSWORD</td>
                <td>ACTIONS</td>
            </thead>
            <tbody>
                <%
                  String sql="sp_admin_getall";
                  try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                       ResultSet rs=ps.executeQuery();
                       while(rs.next()){
                           String id=rs.getString("id");
                           String name=rs.getString("name");
                           String pass=rs.getString("pass");
                       %>
                       <tr>
                            <td><%=id%></td>
                            <td><%=name%></td>
                            <td><%=pass%></td>
                            <td>
                                <form action="admindelete" method="post" style="display:inline-block;">
                                       <input type="hidden" name="aid" value="<%=id%>">
                                       <button type="submit"  class="btn btn-danger btn-sm">Delete</button>
                                   </form> 
                            </td>
                       </tr>
                       <%    
                        }
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
            <div class="row">
                <div class="col">
                    <a class="btn btn-primary w-50 mb-5 fw-bold" href="login.jsp">BACK</a>
                </div>
            </div>            
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
