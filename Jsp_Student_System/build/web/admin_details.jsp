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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login-Student Application System </title>
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
            background-image:url("image/bg1.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
         }
         </style>
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
        <h3 class="text-center text-dark fw-bold mt-5">ADMIN INFORMATION</h3>
        <h4 class="text-center text-white fw-bold">Welcome Hai ...<%=Name%></h4>
        <div class="container">
                   <table class="table table-bordered" style="color:black;border:2px solid black;text-align: center;background-color:white;">
            <thead style="color:black;font-size:20px;background-color:gray">
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>EMAIl</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <%
                  String sql="sp_admin_getall";
                  try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                       ResultSet rs=ps.executeQuery();
                       while(rs.next()){
                           String id=rs.getString("id");
                           String name=rs.getString("name");
                           String email=rs.getString("email");
                       %>
                       <tr>
                            <td><%=id%></td>
                            <td><%=name%></td>
                            <td><%=email%></td>
                            <td>
                                <form action="admindelete" method="post" style="display:inline-block;">
                                       <input type="hidden" name="aid" value="<%=id%>">
                                       <button type="submit"  class="btn btn-danger fw-bold"><i class="bi bi-trash"></i>Delete</button>
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
                <div class="offset-md-3 col-md-6 d-grid">
                    <a class="btn btn-primary fw-bold mb-5 fw-bold" href="student.jsp">BACK</a>
                </div>
            </div>            
        </div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>


    </body>
</html>
