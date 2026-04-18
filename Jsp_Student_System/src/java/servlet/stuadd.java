/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;
import  DB.JDBC;
import java.io.*;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import static java.lang.System.out;

@MultipartConfig
public class stuadd extends HttpServlet {
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Id=request.getParameter("id");
        
        String Name=request.getParameter("name");
        
        String Gender=request.getParameter("gender");
        
        String Dob=request.getParameter("dob");
       
        String Course=request.getParameter("course");
        
        Part file=request.getPart("image");
        InputStream input=file.getInputStream();
        
        String time=request.getParameter("time");
         Time t=Time.valueOf(time);
          
        String sql="sp_student_insert ?,?,?,?,?,?,?";
        if(file==null || file.getSize()==0){
            out.println("<script>alert('Please Upload The Image')</script>");
            return;
        }
        try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql)){
            ps.setString(1,Id);
            ps.setString(2,Name);
            ps.setString(3,Gender);
            ps.setString(4,Dob);
            ps.setString(5,Course);
            ps.setBinaryStream(6,input,(int)file.getSize());
            ps.setTime(7,t);
            int a=ps.executeUpdate();
            if(a>0){
                 out.println("<script>alert('Student Added....')</script>");
                 response.sendRedirect("student.jsp");
            }
         }catch(Exception e){
             e.printStackTrace();
             response.getWriter().println(e.getMessage());
          }
    }

  
}
