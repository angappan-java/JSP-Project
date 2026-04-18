<%-- 
    Document   : course
    Created on : 06-Aug-2025, 12:57:11 pm
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
        <title>JSP Page</title>
         <link rel="stylesheet" href="assets/css/bootstrap.min.css">
         <style>
             body{
                 background-color:#198754;             
             }
             label,input{
                 font-size: 30px;
                 font-family: sens-serif;
              }
         </style>
    </head>
    <body>
        <%
          HttpSession ses=request.getSession();
          String N=(String)ses.getAttribute("N");
          
         ses.setMaxInactiveInterval(180);
         if(N==null){
             response.sendRedirect("login.jsp");
            }
         
        %>
        <div class="container">
            <h1 class="text-center" style="color:yellow">COURSE</h1>
            
            <h2 class="text-center">Welcome Hai....<%=N%></h2>
            <form action="course.jsp" method="post">
                <div class="mb-3">
                      <label class="text-dark">ID</label>
                <input type="text" class="form-control" value="${param.id}" required="" name="id">
                </div>
                <div class="mb-3">
                    <label class="text-dark">COURSE NAME</label>
                    <input type="text" class="form-control" value="${param.name}" required="" name="name">
                </div>
                <div class="row">
                    <div class="col">
                        <button type="submit" class="btn btn-primary" name="add">ADD</button>
                    </div>  
                     <div class="col">
                        <button type="submit" class="btn btn-primary" name="edit">EDIT</button>
                    </div> 
                     <div class="col">
                        <button type="submit" class="btn btn-primary" name="delete">DELETE</button>
                    </div>
                     <div class="col">
                         <a href="student.jsp" class="btn btn-danger">Back</a>
                    </div>     
                </div>
            </form>
            <% 
               if(request.getParameter("add")!=null){
                    String Id=request.getParameter("id");
                    String Name=request.getParameter("name");
                    String sql="sp_course_insert ?,?";
                    try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                           ps.setString(1,Id);
                           ps.setString(2,Name);
                           int a=ps.executeUpdate();
                           if(a>0){
            %><script>alert("The Course Added....");</script><%
                
                }else{
                   %><script>alert("The Course Not Added....");</script>    <%             
                       }
                      }catch(Exception e){
                               out.println("Error Is :"+e);
                           }
                }
              
            %>
            
            <%
                if(request.getParameter("edit")!=null){
                   String Id=request.getParameter("id");
                   String Name=request.getParameter("name");
                   String sql="sp_course_update ?,?";
                   try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                          ps.setString(1,Id);
                          ps.setString(2,Name);
                          int a=ps.executeUpdate();
                          if(a>0){
            %><script>alert("This Course Is Updated....");</script>
                               <%
                            }else{
                     %><script>alert("This Course is Not Updated....");</script><%
                      }
                    }catch(Exception e){
                             out.println("Error is :"+e);
                       }
                }  
            %>
            <% 
                if(request.getParameter("delete")!=null){
                      String Id=request.getParameter("id");
                      String sql="sp_course_delete ?";
                      try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                          ps.setString(1,Id);
                          int a=ps.executeUpdate();
                          if(a>0){
                          %><script>alert("This Course Is Deleted...");</script><%
                           }else{
                               %><script>alert("This Course Is Not deleted...");</script><%
                           }
                   }catch(Exception e){
                                  out.println("Error Is :"+e);
                          }
                 }
            %>
        </div> 
           <div class="container-fluid text-center" >
                <h1 class="text-center" style="color:yellow">COURSE DETAILS</h1>
               <table class="table table-hover " style="background-color:white; border:2px solid blue;text-align: center;" >
                   <thead style="color:black;font-size:20px;">
                       <tr>
                           <td>ID</td>
                           <<td>COURSE NAME</td>
                           <td>ACTIONS</td>
                       </tr>
                   </thead>
                   <tbody>
                       <%
                          String sql="sp_course_getall";
                          try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                              ResultSet rs=ps.executeQuery();
                              while(rs.next()){
                                      String Id=rs.getString("id");
                                      String Course_Name=rs.getString("course_name");
                           %>
                           <tr>
                               <td><%=Id%></td>
                               <td><%=Course_Name%></td>
                               <td>
                                   <!-- Edit Button -->
                                   <form action="course.jsp" method="post" style="display:inline-block;">
                                       <input type="hidden" name="id" value="<%=Id%>">
                                       <input type="hidden" name="name" value="<%=Course_Name%>">
                                       <button type="submit"  class="btn btn-warning btn-sm">Edit</button>
                                   </form>
                                       <!--Delete Button -->
                                    <form action="course.jsp" method="post" style="display:inline-block;">
                                       <input type="hidden" name="id" value="<%=Id%>">
                                       <input type="hidden" name="name" value="<%=Course_Name%>">
                                       <button type="submit"  class="btn btn-danger btn-sm">Delete</button>
                                   </form>     
                               </td>
                           </tr>
                         
                       <%      
                           }
                           }catch(Exception e){
                                 out.println("Error is :"+e);
                           }
                       %>
                   </tbody>
               </table>                  
                </div>
        
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
