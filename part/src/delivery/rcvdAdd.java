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
public class rcvdAdd extends HttpServlet 
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
	 	
		
		String company_code=request.getParameter("company_code");		
		String rcvd_description=request.getParameter("rcvd_description");
		String valid_code=request.getParameter("rcvd_validcode");
		
		DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
		//Local date time instance
		LocalDateTime localDateTime = LocalDateTime.now();
		 
		//Get formatted String
		String ldtString = FOMATTER.format(localDateTime);
		Connection conn=null;

		try 
		{
		out = response.getWriter();
		
		//conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
			conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	  
				  System.out.println("************Successfully connected***********");
				  
		
					/* Generate Agent Code */

				  PreparedStatement pre_rcvd=conn.prepareStatement("Select rcvd_code from nextkey where  company_code=? and module=?");
				  pre_rcvd.setString(1, company_code); 
				  pre_rcvd.setString(2, "RC");	 
				  ResultSet rs_rcvdCode=pre_rcvd.executeQuery();

				  String code; 
				  int changecode = 0;  
				  String rcvd_code1;
				  int rc_code=0;
				  String rcvdCode = "0";

				  if(rs_rcvdCode.next())
				  {
				  				
				  	code = rs_rcvdCode.getString("rcvd_code"); 
				  	changecode =Integer.parseInt(code); 	
				  	System.out.println("changecode="+changecode);
				 
				  	if(changecode<=9) {
					 
					  rcvd_code1 =String.format("%02d", changecode); 
					  rc_code=Integer.parseInt(rcvd_code1);
					  rc_code=rc_code+1;					  
					  rcvdCode=rcvdCode+rc_code;
				  }
				  else
					  {
					  System.out.println("changecode="+changecode);
					  	changecode=changecode+1;
					  	rcvdCode=String.valueOf(changecode);
					  }
				  	
				  	
				  	  PreparedStatement preparedStmt = null;	  
				  	  preparedStmt=conn.prepareStatement("Update nextkey set rcvd_code=?  where company_code=? and module=?");     
				  	  
				  	  preparedStmt.setString(1, String.valueOf(rcvdCode)); 
				  	  preparedStmt.setString(2,company_code); 
				  	  preparedStmt.setString(3,"RC"); 
				  	  preparedStmt.execute();
				  	  System.out.println("agent_code="+rcvdCode);
				  				 
				  }
				  else {
				  	
				  	PreparedStatement pre_agcode=null;	 
				  	pre_agcode=conn.prepareStatement("insert into nextkey(company_code,rcvd_code,module)"
				  	  +  "values(?,?,?)");
				  	  
				  	pre_agcode.setString(1,company_code); 
				  	pre_agcode.setString(2,"01"); 
				  	pre_agcode.setString(3,"RC");
				  	pre_agcode.executeUpdate();
				  	rcvdCode="01";				  
				  	valid_code="t";
				  }

			  
				  String query =
				  " insert into rcvdmode (rcvd_description, valid_code, company_code,rcvd_code,createdate,createdby)"
				  + " values (?,?, ?, ?, ?,?)"; PreparedStatement preparedStmt =
				  conn.prepareStatement(query);
				  
				  preparedStmt.setString(1, rcvd_description); 
				  preparedStmt.setString(2,valid_code); 
				  preparedStmt.setString(3, company_code);
				  preparedStmt.setString(4, rcvdCode); 
				  preparedStmt.setString(5, ldtString);
				  preparedStmt.setString(6, staff_name);
				  
				  preparedStmt.execute();
				 
			      
			      conn.close();
		RequestDispatcher rs = request.getRequestDispatcher("RLLL");
	    rs.include(request,response);
		
		}
		catch(Exception e)
		{
		out.println(e);
		}   
}
}