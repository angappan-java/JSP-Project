/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

/**
 *
 * @author ELCOT
 */
import java.sql.*;
public class JDBC {
    private static final String URL="jdbc:sqlserver://localhost:1433;databaseName=Jsp_Student;TrustServerCertificate=true";
    private static final String USER="stmanage";
    private static final String PASS="stm";
 public static Connection con() throws ClassNotFoundException, SQLException{
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
          return DriverManager.getConnection(URL,USER,PASS);
    }
}
