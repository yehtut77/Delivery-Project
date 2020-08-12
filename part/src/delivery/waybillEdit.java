package  delivery;
import java.sql.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "insertAgent", urlPatterns = {"/insertAgent"})
@MultipartConfig(maxFileSize = 169999999)   // upload file's size up to 16MB
public class waybillEdit extends HttpServlet 
{ 
private static final long serialVersionUID = 1L;
PrintWriter out;
InputStream inputStream = null; 
int allField = 0;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse      response)
throws ServletException, IOException {
		
		
		response.setContentType("text/html;charset=UTF-8");
		
		
		HttpSession ssss=request.getSession(false); 
		String staff_name=(String)ssss.getAttribute("staffName");		
	 	String passcode=request.getParameter("passcode");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String payment_companycode=request.getParameter("payment_companycode");
		String payment_code=request.getParameter("payment_code");
		String payment_description=request.getParameter("payment_description");
		String payment_validcode=request.getParameter("payment_validcode");
		
		DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
		//Local date time instance
		LocalDateTime localDateTime = LocalDateTime.now();
		 
		//Get formatted String
		String ldtString = FOMATTER.format(localDateTime);
		Connection conn=null;

		try 
		{
		out = response.getWriter();
		
		//conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery","root", "root");
		 conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
  
				  
				  PreparedStatement preparedStmt = null;
				  
				  preparedStmt=conn.prepareStatement("Update paymentmode set payment_code=?,payment_description=?,valid_code=?,modifydate=?,updatedby=?  where company_code=? and payment_code=?");     
				  
				  preparedStmt.setString(1, payment_code); 
				  preparedStmt.setString(2,payment_description); 
				  preparedStmt.setString(3, payment_validcode);				  
				  preparedStmt.setString(4, ldtString);
				  preparedStmt.setString(5, staff_name);
				  
				  preparedStmt.setString(6, payment_companycode);
				  preparedStmt.setString(7, payment_code);
				  
				  
				 preparedStmt.execute();
				 
			      
			      conn.close();
			      response.sendRedirect("waybillList.jsp");
		
		}
		catch(Exception e)
		{
		out.println(e);
		}   
}
}