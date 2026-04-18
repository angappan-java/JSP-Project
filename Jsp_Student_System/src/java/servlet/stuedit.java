/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;
import java.sql.*;
import java.io.*;
import DB.JDBC;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;

/**
 *
 * @author ELCOT
 */
@MultipartConfig
public class stuedit extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String Id=request.getParameter("id");
         String sql="sp_student_getbyone ?";
         try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
               ps.setString(1,Id);
               ResultSet rs=ps.executeQuery();
               if(rs.next()){
                     request.setAttribute("id",rs.getString("id"));
                     request.setAttribute("name",rs.getString("name"));
                     request.setAttribute("gender",rs.getString("gender"));
                     request.setAttribute("dob",rs.getDate("dob"));
                     request.setAttribute("coursename",rs.getString("course_name"));
                     request.setAttribute("image",rs.getBytes("image"));
                     request.setAttribute("time",rs.getTime("time"));
                     
                }
//               else{
////                       out.println("This Id Is Not Found.....");
////                 }
               RequestDispatcher rd=request.getRequestDispatcher("studentedit.jsp");
               rd.forward(request, response);
         
         }catch(Exception e){
                     e.printStackTrace();
         }
        
        
    }

}
