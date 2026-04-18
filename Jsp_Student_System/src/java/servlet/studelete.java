/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;
import java.sql.*;
import DB.JDBC;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;

public class studelete extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String Id=request.getParameter("id");
         String sql="sp_student_delete ?";
         
         try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                ps.setString(1,Id);
                int a=ps.executeUpdate();
                if(a>0){
                  out.println("<script>alert('This Student Is Removed....');</script>");
                  response.sendRedirect("student.jsp");
                }
         }catch(Exception e){
                e.printStackTrace();
                
         }
        
        
    }

 
}
