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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
         <link rel="stylesheet" href="assets/css/bootstrap.min.css">
         <style>
             body{
                 background-color:aliceblue;
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
                    <div class="col-12">
                        <button type="submit" name="submit" class="btn btn-primary w-100">SUBMIT</button>
                    </div>
            </form>
                    <br><br><br>
                    <div class="row">
                     
                        <div class="col">
                            <a href="course.jsp" class="btn btn-info">COURSE</a>
                        </div>
                        <div class="col">
                            <form>
                                <input type="submit" name="logout" value="LOGOUT"
                                       onclick="show('<%=alert%>')" class="btn btn-primary">
                            </form>
                        </div>
                            <div class="col">
                                <button class="btn btn-success" onclick="print()">PRINT</button>
                            </div>
                    </div>
        </div>
         <br><br><br> 
         <div class="container">
             <h2 class="text-center" style="color:dimgray">Student List</h2>
             <table class="table table-bordered" id="print"
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
                                       <button type="submit"  class="btn btn-warning btn-sm">Edit</button>
                                   </form>
                                       <!--Delete Button -->
                                    <form action="studelete" method="post" style="display:inline-block;">
                                       <input type="hidden" name="id" value="<%=I%>">
                                       <button type="submit"  class="btn btn-danger btn-sm">Delete</button>
                                   </form>     
                               </td>
                       
                       
                   </tr>
                   <%         
                       }
                     }catch(Exception e){
                      out.println(e);
                     }
                 %>
             </table>
         </div>
              <jsp:include page="footer.jsp"/>
             
         <script src="assets/js/bootstrap.min.js"></script>
        
     </body>
</html>
