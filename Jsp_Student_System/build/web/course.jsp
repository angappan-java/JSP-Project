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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>StudentEdit-Student Application System </title>
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
            background-image:url("image/bg3.png");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
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
            <h3 class="text-center text-dark fw-bold">COURSE</h3>
            
            <h4 class="text-center">Welcome Hai....<%=N%></h4>
            <div class="form-control bordered rounded mx-auto w-50 p-5">
            <form action="course.jsp" method="post">
                <div class="row mb-3">
                      <label class="col-sm-4 text-dark form-label fw-bold">ID</label>
                      <div class="col-sm-8">
                          <input type="text" class="form-control" value="${param.id}" required="" name="id">
                      </div>
                      
                </div>
                <div class="row mb-3">
                    <label class="col-sm-4 text-dark form-label fw-bold">COURSE NAME</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" value="${param.name}" required="" name="name">
                    </div>             
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-6 d-grid">
                        <button type="submit" class="btn btn-primary fw-bold" name="add">ADD</button>
                    </div>  
                     <div class="col-md-3 col-sm-6 d-grid">
                        <button type="submit" class="btn btn-primary fw-bold" name="edit">EDIT</button>
                    </div> 
                     <div class="col-md-3 col-sm-6 d-grid">
                        <button type="submit" class="btn btn-primary fw-bold" name="delete">DELETE</button>
                    </div>
                     <div class="col-md-3 col-sm-6 d-grid">
                         <a href="student.jsp" class="btn btn-danger fw-bold">Back</a>
                    </div>     
                </div>
            </form>
          </div>
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
           <div class="container text-center mt-5">
                <h4 class="text-center text-success fw-bold ">COURSE DETAILS</h4>
               <table class="table table-bordered table-hover " style="background-color:white; border:2px solid blue;text-align: center;" >
                   <thead style="color:black;font-size:20px;">
                       <tr>
                           <th>ID</th>
                           <th>COURSE NAME</th>
                           <th>ACTIONS</th>
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
                                       <button type="submit"  class="btn btn-warning fw-bold"><i class="bi bi-pencil-square"></i>Edit</button>
                                   </form>
                                       <!--Delete Button -->
                                    <form action="course.jsp" method="post" style="display:inline-block;">
                                       <input type="hidden" name="id" value="<%=Id%>">
                                       <input type="hidden" name="name" value="<%=Course_Name%>">
                                       <button type="submit"  class="btn btn-danger fw-bold"><i class="bi bi-trash"></i>Delete</button>
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
        
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
    </body>
</html>
