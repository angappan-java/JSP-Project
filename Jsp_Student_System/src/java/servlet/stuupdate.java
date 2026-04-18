/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import DB.JDBC;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.InputStream;

@MultipartConfig
public class stuupdate extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String Id=request.getParameter("id");
        String Name=request.getParameter("name");
        String Gender=request.getParameter("gender");
        String Dob=request.getParameter("dob");
        String Course=request.getParameter("course");
        String time=request.getParameter("time");
        Part Image=request.getPart("image");
        
        String sql="sp_student_update ?,?,?,?,?,?,?";
        try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
             ps.setString(1,Id);
             ps.setString(2,Name);
             ps.setString(3,Gender);
             ps.setDate(4,Date.valueOf(Dob));
             ps.setString(5,Course);
             InputStream Input=null;
             if(Image!=null || Image.getSize()>0){
                  Input=Image.getInputStream();
                  
            }
             ps.setBinaryStream(6,Input,(int)Image.getSize());
             ps.setTime(7,Time.valueOf(time));
             int a=ps.executeUpdate();
             if(a>0){
                    response.sendRedirect("student.jsp");
              }
             
            
        }catch(Exception e){
               e.printStackTrace();
        }
        
        
    }


}
