<%-- 
    Document   : forgetpassword
    Created on : 04-Aug-2025, 1:01:06 pm
    Author     : ELCOT
--%>

<%@page import="Password.SecurePassword"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DB.JDBC"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
         <link rel="stylesheet" href="assets/css/bootstrap.min.css">
         <link rel="stylesheet" href="assets/css/bootstrap.min.css">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
         <style>
         body{
            background-image:url("image/bg5.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
    </head>
    <body>
    <%
                 if(request.getParameter("update")!=null){
                    String AId=request.getParameter("id");
                    if(AId==null){
                        AId=request.getParameter("aid");
                    }
                    String Pass=request.getParameter("password");
                    String Cpass=request.getParameter("confirmpassword");
                    String regexp="^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[~!@#$%^&*_=+-]).{8,}$";
                    String sql="update admin set pass=? where id=?";
                    try(Connection conn=DB.JDBC.con();PreparedStatement pst=conn.prepareStatement(sql);){
                     if(Pass.matches(regexp)){
                         if(Pass.equals(Cpass)){
                               String encryptPassword=SecurePassword.encrypt(Pass);
                                    pst.setString(1,encryptPassword);
                                    pst.setString(2,AId);
                                   int a= pst.executeUpdate();
                                   if(a>0){
                                       out.println("<script>alert('Password Change SuccessFully.....')</script>");                     
                                   }else{
                                       out.println("<script>alert('No Change Password....')</script>");
                                   }
                        }else{
                              out.println("<script>alert('Password field and Confirm Password Fields are not Mached...');</script>");
                        }
                     }else{
                              out.println("<script>alert('Invalid Password !.Password Must Be 8 Charactor Include With One UpperCase, One LowerCase, One Number, One Special Charactor');</script>");
                     }
             }catch(Exception e){
                       out.println("<script>alert('Error :"+e.getMessage()+"')</script>");
             }
         }
    %>
        <div class="container">
            <div class="form-control bordered rounded mx-auto w-50" style="margin-top:100px;">
            <h4 class="text-dark text-center fw-bold">Forget Password</h4>
            <form action="forgetpassword.jsp" method="get">
                <div class="row mb-3">
                    <label class="col-sm-4 form-label fw-bold">ID</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="aid" required 
                               value="<%=request.getParameter("aid")!=null?request.getParameter("aid"):""%>">
                    </div>                   
                </div>
                <div class="row mb-3">
                    <div class="offset-md-4 col-md-4 d-grid">
                        <button type="submit" class="btn btn-primary fw-bold" name="get">SEARCH</button>
                    </div>
                     <div class="col-md-4 d-grid">
                         <a href="login.jsp" class="btn btn-danger fw-bold">Back</a>
                    </div>
                </div>
            </form>
                <%
                            if(request.getParameter("get")!=null || request.getParameter("update")!=null){
                                  String Id=request.getParameter("aid");
                                  if(Id==null)Id=request.getParameter("id");
                                  String Sql="sp_admin_getbyone ?";
                                  try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(Sql);){
                                      ps.setString(1,Id);
                                      ResultSet rs=ps.executeQuery();
                                      if(rs.next()){
                                              String AdminId=rs.getString("id");
                                              String Email=rs.getString("email");
                 %>
        <form action="forgetpassword.jsp" method="POST">
            <h4 class="text-center text-success fw-bold">Change Password</h4>
                <div class="row mb-3">
                    <label class="col-sm-4 fw-bold form-label">Id</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="id" value=<%=AdminId%> readonly>
                        <input type="hidden" name="aid" value="<%=AdminId%>">
                    </div>                   
                </div>
                <div class="row mb-3">
                    <label class="col-sm-4 fw-bold form-label">Email</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="email" value=<%=Email%> readonly>
                    </div>                   
                </div>
                <div class="row mb-3">
                    <label class="col-sm-4 form-label fw-bold">Password</label>
                    <div class="col-sm-8">
                       <div class="position-relative">
                            <input type="password" class="form-control" name="password" id="password">
                            <i class="bi bi-eye-slash position-absolute top-50 end-0 translate-middle-y me-3" id="eye"
                            style="cursor:pointer;" onclick="toggleEye()"></i>
                       </div>
                    </div>          
                </div>
                <div class="row mb-3">
                    <label class="col-sm-4 form-label fw-bold">Confirm Password</label>
                    <div class="col-sm-8">
                       <div class="position-relative">
                            <input type="password" class="form-control" name="confirmpassword" id="confirmpassword">
                            <i class="bi bi-eye-slash position-absolute top-50 end-0 translate-middle-y me-3" id="eyepass"
                            style="cursor:pointer;" onclick="togglePassword()"></i>
                       </div>
                    </div>          
                </div>
                <div class="row mb-3">
                    <div class="offset-md-4 col-md-4 d-grid">
                        <button type="submit" name="update" class="btn btn-primary fw-bold">Update</button>
                    </div>  
                    <div class="col-md-4 d-grid">
                        <a type="button" href="login.jsp" class="btn btn-danger fw-bold">Back</a>
                    </div>
                </div>
          
         </form>      
                           
                <%                    
                   }else{
                %>
                
                <script>alert("This Id Is Not Found..");</script>
                
                <%
                   }
                  }catch(Exception e){
                       out.println("<script>alert('Error :"+e.getMessage()+"')</script>");
                  }
                }
                %>         
           </div>
        </div>
     <script>
      function toggleEye(){
	const pwd=document.getElementById("password");
	const eye=document.getElementById("eye");
	if(pwd.type==="password"){
		pwd.type="text";
		eye.classList.replace("bi-eye-slash","bi-eye");
	}else{
		pwd.type="password";
		eye.classList.replace("bi-eye","bi-eye-slash");
	}
}
function togglePassword(){
	const pwd=document.getElementById("confirmpassword");
	const eye=document.getElementById("eyepass");
	if(pwd.type==="password"){
		pwd.type="text";
		eye.classList.replace("bi-eye-slash","bi-eye");
	}else{
		pwd.type="password";
		eye.classList.replace("bi-eye","bi-eye-slash");
	}
}
        </script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>

    </body>
</html>
