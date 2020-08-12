package  delivery;
import java.sql.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 169999999)   // upload file's size up to 16MB
public class receiveAdd extends HttpServlet 
{ 
private static final long serialVersionUID = 1L;
PrintWriter out;
InputStream inputStream = null; 
int allField = 0;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse      response)
throws ServletException, IOException {


		



//Part filePart = request.getPart("file");
String rcvd_code= request.getParameter("rcvd_code");        
String rcvd_des= request.getParameter("rcvd_description"); 
String rcvd_valid= request.getParameter("rcvd_validcode");





HttpSession ssss=request.getSession(false); 
String createdby=(String)ssss.getAttribute("staff_name");

DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();
 
//Get formatted String
String createdate= FOMATTER.format(localDateTime);




try {
	
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1", "root", "root");
	Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	String query = " insert into rcvdmode (rcvd_code, rcvd_description,valid_code,createdby,updatedby,createdate,modifydate)"
	        + " values (?,?,?,?,?,?,?)";
	 PreparedStatement preparedStmt = conn.prepareStatement(query);

	  preparedStmt.setString(1,rcvd_code);
      preparedStmt.setString(2,rcvd_des);
      preparedStmt.setString(3,rcvd_valid);
      
      preparedStmt.setString(4,createdby);
     
   
      preparedStmt.setString(5, " ");
      preparedStmt.setString(6,createdate);
      preparedStmt.setString(7, " ");
 
      preparedStmt.execute();
      
      conn.close();
      RequestDispatcher rs = request.getRequestDispatcher("rcvdList.jsp");
      rs.include(request,response);
      
} catch (SQLException e) {
	 //TODO Auto-generated catch block
	e.printStackTrace();
}
}
}