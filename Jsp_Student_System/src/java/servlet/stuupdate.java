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
import jakarta.servlet.http.HttpSession;
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
        
        
        
        try{
            Connection c=JDBC.con();
            String sql;
            PreparedStatement ps;
            boolean hasImage=(Image!=null && Image.getSize()>0);
            if(hasImage){
                sql="update student set name=?,gender=?,dob=?,course_name=?,image=?,time=? where id=?";
                ps=c.prepareStatement(sql);
                ps.setString(1,Name);
                ps.setString(2,Gender);
                ps.setDate(3,Date.valueOf(Dob));
                ps.setString(4,Course);
                ps.setBinaryStream(5,Image.getInputStream(),(int)Image.getSize());
                ps.setTime(6,Time.valueOf(time));
                ps.setString(7,Id);
            }else{
                sql="update student set name=?,gender=?,dob=?,course_name=?,time=? where id=?";
                ps=c.prepareStatement(sql);
                ps.setString(1,Name);
                ps.setString(2,Gender);
                ps.setDate(3,Date.valueOf(Dob));
                ps.setString(4,Course);
                ps.setTime(5,Time.valueOf(time));
                ps.setString(6,Id);
            }   
             int a=ps.executeUpdate();
             if(a>0){
                    HttpSession session=request.getSession();
                    session.setAttribute("msg","Student Profile Update Succesfully...");
                    response.sendRedirect("student.jsp");
            }  
        }catch(Exception e){
               e.printStackTrace();
        }  
    }
}
