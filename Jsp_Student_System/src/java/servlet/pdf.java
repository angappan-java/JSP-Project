/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;
import java.sql.*;
import DB.JDBC;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class pdf extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       response.setContentType("application/pdf");
       response.setHeader("Content-Disposition","attachment; filename=student.pdf");
       
       Document d=new Document();
       try{
           PdfWriter.getInstance(d,response.getOutputStream());
           d.open();
           d.add(new Paragraph("                    ----------------STUDENT DETAILS-------------            "));
           d.add(Chunk.NEWLINE);
           
           PdfPTable table=new PdfPTable(7);
           table.addCell("ID");
           table.addCell("NAME");
           table.addCell("GENDER");
           table.addCell("DOB");
           table.addCell("Course");
           table.addCell("IMAGE");
           table.addCell("TIME");
           
           String sql="sp_student_getall";
           try(Connection c=JDBC.con();PreparedStatement ps=c.prepareStatement(sql);){
                  ResultSet rs=ps.executeQuery();
                  while(rs.next()){
                    table.addCell(rs.getString("id"));
                    table.addCell(rs.getString("name"));
                    table.addCell(rs.getString("gender"));
                    table.addCell(rs.getDate("dob").toString());
                    table.addCell(rs.getString("course_name"));
                    byte[] imagebytes=rs.getBytes("image");
                    Image imagename=Image.getInstance(imagebytes);
                    table.addCell(imagename);
                    table.addCell(rs.getTime("time").toString());                    
                    }
           }catch(Exception e){
               e.printStackTrace();
           }
           d.add(table);
           d.add(Chunk.NEWLINE);
           d.add(new Paragraph("                  --------------------THANKS------------------          "));
           
           d.close();
       }catch(Exception e){
                e.printStackTrace();
      }  
    }
}
