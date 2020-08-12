package delivery;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 169999999)   // upload file's size up to 16MB
public class compEdit extends HttpServlet 
{ 
private static final long serialVersionUID = 1L;
PrintWriter out;
InputStream inputStream = null; 
int allField = 0;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse      response)
throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");

String id=request.getParameter("idd");
String company_code=request.getParameter("company_code");
String division=request.getParameter("select1");
String town=request.getParameter("select2");
String company_name =request.getParameter("company_name");
String company_addr1=request.getParameter("company_addr1");
String company_addr2=request.getParameter("company_addr2");
String company_addr3=request.getParameter("company_addr3");
String company_addr4 =request.getParameter("company_addr4");
String company_phone=request.getParameter("company_phone");
String company_email=request.getParameter("company_email");
Part filePart = request.getPart("logo_file");
String nick=request.getParameter("nick");
String country=request.getParameter("country");
String select1=request.getParameter("select1");
String select2=request.getParameter("select2");
String company_postcode=request.getParameter("s_postcode");

System.out.println("select2="+select2);

String delivery_charges=request.getParameter("delivery_charges");
String transportation_charges=request.getParameter("transportation_charges");
String contract_date=request.getParameter("contract_date");
String contract_expiredate=request.getParameter("contract_expiredate");
String contact_name=request.getParameter("contact_name");
String contact_phone=request.getParameter("contact_phone");
String createdby=request.getParameter("createdby");
String createdate=request.getParameter("createdate");
String company_type=request.getParameter("company_type");

HttpSession session=request.getSession(false);
String staff_name=(String)session.getAttribute("staffName");
String username = (String) session.getAttribute("username");




DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
   
//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();										  
 //Get formatted String
String ldtString = FOMATTER.format(localDateTime);										  
System.out.println("Local Time:"+ldtString); 


PreparedStatement  preparedStmt=null;
Connection conn;
try {
	//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
	//conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery", "teamrame_yhk2", "J@v@1234");
	 conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

	//String query = "update company set company_code= ?, company_name=?, company_addr1=?, company_addr2=?, company_addr3=?,company_addr4=?,company_postal=?,company_division=?,company_country=?,company_phone=?, company_email=?, nick_name=?,  createdby=?, updatedby=?, createdate=?, modifydate=?,company_township=?,contract_createdate=?,contract_expiredate=?,contact_name=?,contact_phone=? where company_code= ?"
	preparedStmt=conn.prepareStatement("Update company  set  company_name=?,company_addr1=?,company_addr2=?,company_addr3=?,company_addr4=?,company_postal=?,company_division=?,company_country=?,company_phone=?,company_email=?,nick_name=?,createdby=?,updatedby=?,createdate=?, modifydate=?,company_township=?,contract_createdate=?,contract_expiredate=?,contact_name=?,contact_phone=?,company_type=?,delivery_charges=?,transportation_charges=? where company_code="+company_code); 
	
	//PreparedStatement preparedStmt = conn.prepareStatement(query);
      
      preparedStmt.setString(1, company_name);
      preparedStmt.setString(2, company_addr1);
      preparedStmt.setString(3, company_addr2);
      preparedStmt.setString(4, company_addr3);
      preparedStmt.setString(5, company_addr4);
      preparedStmt.setString(6, company_postcode);
      
      preparedStmt.setString(7, division);
      preparedStmt.setString(8, country);
      preparedStmt.setString(9,company_phone);
      preparedStmt.setString(10, company_email);
      preparedStmt.setString(11,nick);
      preparedStmt.setString(12, createdby);
      preparedStmt.setString(13, staff_name);
      preparedStmt.setString(14, createdate);
      preparedStmt.setString(15, ldtString);
      preparedStmt.setString(16,town);  

      preparedStmt.setString(17,contract_date);
      preparedStmt.setString(18,contract_expiredate);
      preparedStmt.setString(19,contact_name);
      preparedStmt.setString(20,contact_phone);
      preparedStmt.setString(21, company_type);
      preparedStmt.setString(22, delivery_charges);
      preparedStmt.setString(23, transportation_charges);
      
      preparedStmt.executeUpdate();
      
      
      System.out.print(filePart.getSize());
      if (filePart.getSize() != 0) 
      {
      	inputStream = filePart.getInputStream();

      	preparedStmt=conn.prepareStatement("Update company set logo=? where company_code="+company_code); 
      	preparedStmt.setBlob(1,inputStream);

      	preparedStmt.executeUpdate();
      	System.out.println("Image Inserted");

      }
      
      conn.close();
      
      response.sendRedirect("companyList.jsp");      
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


	
}

protected void doGet(HttpServletRequest request, HttpServletResponse      response)
throws ServletException, IOException {}

}