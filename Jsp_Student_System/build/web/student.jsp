<%-- 
    Document   : student
    Created on : 03-Aug-2025, 3:07:39 pm
    Author     : ELCOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<%@page import="jakarta.servlet.http.*"%>
<%@page import="jakarta.servlet.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Time"%>
<%@page import="servlet.stuadd"%>
<%@page import="java.util.Base64"%>
<jsp:include page="header.jsp"/>
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
            background-image:url("image/bg3.png");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
         }
        </style>
    </head>
    <body>
        <script>
                      function print(){
                          alert("Print is on....");
                          var toprint=document.getElementById("print");
                          var newwin=window.open(" ");
                          newwin.document.write('<html><head><title>STUDENT DETAILS</title></head><body>');
                          newwin.document.write(toprint.outerHTML);
                          newwin.document.write('</body></html>');
                          newwin.print();
                          newwin.close();
                      }
                       <%
                       String alert="LOGGED OUT";
                        %> 
                       function show(msg){
                           alert(msg);
                       }    
                      
               </script>
        <%
          Date d=new Date();
          Time CurrentTime=new Time(d.getTime());
          HttpSession ses=request.getSession();
          String Name=(String)ses.getAttribute("N");
          
         ses.setMaxInactiveInterval(180);
         if(Name==null){
             response.sendRedirect("login.jsp");
            }
          if(request.getParameter("logout")!=null){
             ses.removeAttribute("name");
             response.sendRedirect("login.jsp");
            }
        %>
        <div class=" container">
            
            <h1 class="text-center">Student Reports</h1>
            <h2 class="text-center">Welcome Hai....<%=Name%></h2>
            <%
               String message=(String)session.getAttribute("msg");
               if(message!=null){
            %>
            <script>alert("<%=message%>")</script>
            <%
                 session.removeAttribute(message);
               }
            %>
        <div class="form-control bordered rounded mx-auto w-75">
            <form action="stuadd" method="post" enctype="multipart/form-data" class="row g-3">
                <div class="col-md-6">
                    <label>ID</label>
                    <input type="text" class="form-control" name="id" required="">              
                </div>
                <div class="col-md-6">
                    <label>NAME</label>
                    <input type="text" class="form-control" name="name" required="">
                </div>
                <div class="col-md-6">
                    <label>DOB</label>
                    <input type="date" class="form-control" name="dob" required="">
                </div>
                <div class="col-md-6">
                    <label>IMAGE</label>
                    <input type="file" class="form-control" name="image" required="">
                </div>
                <div class="col-md-6">
                    <label>Time</label>
                    <input type="text" class="form-control" name="time" value="<%=CurrentTime%>" readonly="">
                </div>
                <div class="col-md-6">
                    <label>Gender</label>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" name="gender" value="Male" required="">
                        <label>MALE</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" name="gender" value="Female" required="">
                        <label>FEMALE</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>COURSE</label>
                    <select class="form-select" name="course" required="">
                        <option>Select The Course</option>
                        <%
                            String sql="sp_course_getall";
                            try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                             ResultSet rs=ps.executeQuery();
                             while(rs.next()){
                               String Course=rs.getString("course_name");
                                 %>
                                 <option><%=Course%></option>
                                 <%
                              }
                            }catch(Exception e){
                                     out.println("Error Is :"+e);
                              }
                        %>
                    </select>
                </div>
                    <div class="offset-md-3 col-md-6 d-grid">
                        <button type="submit" name="submit" class="btn btn-primary fw-bold">SUBMIT</button>
                    </div>
            </form><br><br>
           <div class="row mb-3">
                <div class="col-xl-4 d-flex justify-content-center">
                    <a href="course.jsp" class="btn btn-info fw-bold">COURSE</a>
                </div>              
                <div class="col-xl-4 d-flex justify-content-center">
                    <button class="btn btn-success fw-bold" onclick="print()">PRINT</button>
                </div>
                <div class="col-xl-4 d-flex justify-content-center">
                    <form>
                        <input type="submit" name="logout" value="LOGOUT"
                           onclick="show('<%=alert%>')" class="btn btn-primary fw-bold">
                    </form>
                </div>
          </div>
         </div>
                    
                    
        </div>
         <br><br><br> 
         <div class="container">
             <h2 class="text-center" style="color:dimgray">Student List</h2>
             <table class="table table-bordered table-hover" id="print"
                    style="color:black;border:2px solid black;text-align: center ">
                 <tr>
                     <th>ID</th>
                     <th>NAME</th>
                     <th>GENDER</th>
                     <th>DOB</th>
                     <th>COURSE</th>
                     <th>IMAGE</th>
                     <th>TIME</th>
                     <th>ACTIONS</th>
                 </tr>
                 <%
                   String sql1="sp_student_getall";
                   try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql1);){
                        ResultSet rt=ps.executeQuery();
                        while(rt.next()){
                            String I=rt.getString("id");
                            String N=rt.getString("name");
                            String G=rt.getString("gender");
                            String D=rt.getDate("dob").toString();
                            String C=rt.getString("course_name");
                            String T=rt.getTime("time").toString();
                   %>
                   <tr>
                       <td><%=I%></td>
                       <td><%=N%></td>
                       <td><%=G%></td>
                       <td><%=D%></td>
                       <td><%=C%></td>
                       <td>
                            <image src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(rt.getBytes("image"))%>" width="50" height="50">
                       </td>
                       <td><%=T%></td>
                       
                           <td>
                                   <!-- Edit Button -->
                                   <form action="stuedit" method="post" style="display:inline-block;">
                                       <input type="hidden" name="id" value="<%=I%>">
                                       <button type="submit"  class="btn btn-warning fw-bold"><i class="bi bi-pencil-square"></i>Edit</button>
                                   </form>
                                       <!--Delete Button -->
                                    <form action="studelete" method="post" style="display:inline-block;">
                                       <input type="hidden" name="id" value="<%=I%>">
                                       <button type="submit"  class="btn btn-danger fw-bold"><i class="bi bi-trash"></i>Delete</button>
                                   </form>     
                               </td>
                       
                       
                   </tr>
                   <%         
                       }
                     }catch(Exception e){
                           out.println("<script>alert('Error :"+e.getMessage()+"')</script>");
                     }
                 %>
             </table>
         </div>
              <jsp:include page="footer.jsp"/>
             
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
     </body>
</html>
