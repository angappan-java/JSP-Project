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
import java.io.OutputStream;

public class csv extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
          response.setContentType("text/csv");
          response.setHeader("Content-Disposition","attachment; filename=student.csv");
          
          try(OutputStream out=response.getOutputStream()){
                 StringBuilder csv=new StringBuilder();
                 csv.append("ID,NAME,GENDER,DOB,COURSE,TIME\n");
                 
                 String sql="sp_student_getall";
                 try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                         ResultSet rs=ps.executeQuery();
                         while(rs.next()){
                               csv.append(rs.getString("id")).append(",")
                                   .append(rs.getString("name")).append(",")
                                   .append(rs.getString("gender")).append(",")
                                   .append(rs.getDate("dob").toString()).append(",")
                                   .append(rs.getString("course_name")).append(",")
                                   .append(rs.getTime("time").toString()).append("\n");
                         }
                 }catch(Exception e){
                     System.out.println(e);
                 }
                       out.write(csv.toString().getBytes());
                       out.close();
          }catch(Exception e){
              System.out.println(e);
          }
        
        
    }


}
