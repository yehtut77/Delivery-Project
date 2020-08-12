package delivery;
import java.sql.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

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
public class compAdd extends HttpServlet 
{ 
private static final long serialVersionUID = 1L;
PrintWriter out;
InputStream inputStream = null; 
int allField = 0;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse      response)
throws ServletException, IOException {
//response.setContentType("text/html;charset=UTF-8");
InputStream inputStream = null; 

		

HttpSession ssss=request.getSession(false); 
String staff_name=(String)ssss.getAttribute("staffName");
String companyCode="";

//Part filePart = request.getPart("file");
        
String company_name= request.getParameter("company_name"); 
String phone= request.getParameter("phone");
String email= request.getParameter("email");
String address1=request.getParameter("address1");
String address2= request.getParameter("address2");
String address3= request.getParameter("address3");
String address4= request.getParameter("address4");
String nick_name= request.getParameter("nick_name");
Part logo_file= request.getPart("logo_file");
String s_pcode=request.getParameter("s_pcode");
String state=request.getParameter("select1");
String township=request.getParameter("select2");
String ward=request.getParameter("select3");
String street=request.getParameter("select4");
String country=request.getParameter("country");
String company_type=request.getParameter("company_type");

String transportation_charges=request.getParameter("transportation_charges");
String delivery_charges=request.getParameter("delivery_charges");
String contract_expiredate=request.getParameter("contract_expiredate");
String contract_date=request.getParameter("contract_date");
String contract_name=request.getParameter("contract_name");
String contract_phone=request.getParameter("contract_phone");


DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();
 
//Get formatted String
String ldtString = FOMATTER.format(localDateTime);
 
System.out.println("Local Time:"+ldtString); 


if (logo_file.getSize() != 0) 
{
	inputStream = logo_file.getInputStream();

	//pre=conn.prepareStatement("Update agent set shop_pic=? where agent_code="+a_code); 
	//pre.setBlob(1,inputStream);

	//pre.executeUpdate();
	System.out.println("Image Inserted");

}
try {
	
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
	//Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery", "teamrame_yhk2", "J@v@1234");

	Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");


	/* Generate Company Code */

PreparedStatement pre=conn.prepareStatement("Select company_code from nextkey where  module=?");
pre.setString(1, "CP"); 
 
ResultSet rs_compCode=pre.executeQuery();

	String comcode="";
	int numm=0;
	int compar=0;
	if(rs_compCode.next()){
		comcode=rs_compCode.getString("company_code");
		numm=Integer.parseInt(comcode);
		numm++;
		String newnum2="";

		if(numm<10000)
		{
			 newnum2=String.valueOf(compar);
		}
		if(numm<1000)
		{
			 newnum2="0"+numm;
		}
		if(numm<100)
		{
			 newnum2="00"+numm;
		}
		if(numm<10)
		{
			 newnum2="000"+numm;
		}

		PreparedStatement preparedStmt = null;	  
		preparedStmt=conn.prepareStatement("Update nextkey set company_code=? where  module=?");     
		
		preparedStmt.setString(1, newnum2); 		
		preparedStmt.setString(2,"CP"); 
		preparedStmt.execute();
		companyCode=newnum2;
		
	}


else {

PreparedStatement pre_agcode=null;	 
pre_agcode=conn.prepareStatement("insert into nextkey(company_code,module)"
+  "values(?,?)");

pre_agcode.setString(1,"0001"); 
pre_agcode.setString(2,"CP");
pre_agcode.executeUpdate();
company_type="main";
companyCode="0001";
}

	
	String query = " insert into company (company_code, company_name, company_addr1,company_addr2,company_addr3,company_addr4,company_postal,company_division,company_country,company_phone,company_email,nick_name,logo,createdby,createdate,company_township,company_type,contract_createdate,contract_expiredate,contact_name,contact_phone,transportation_charges,delivery_charges,updatedby,modifydate)"
	        + " values (?,?, ?, ?, ?,?, ?,?, ?, ?, ?, ?,?, ?, ?, ?,?,?,?,?,?,?,?,?,?)";
	 PreparedStatement preparedStmt = conn.prepareStatement(query);

	  preparedStmt.setString(1, companyCode);
      preparedStmt.setString(2, company_name);
      preparedStmt.setString(3, address1);
      preparedStmt.setString(4, address2);
      preparedStmt.setString(5, address3);
      preparedStmt.setString(6, address4);
      preparedStmt.setString(7, s_pcode);
      preparedStmt.setString(8, state);
      preparedStmt.setString(9, country);
      preparedStmt.setString(10, phone);
      preparedStmt.setString(11,email );
      preparedStmt.setString(12, nick_name);
      preparedStmt.setBlob(13,inputStream);
      preparedStmt.setString(14,staff_name);     
      preparedStmt.setString(15,ldtString);  
      preparedStmt.setString(16, township);
      preparedStmt.setString(17, company_type);
     
      preparedStmt.setString(18, contract_date);
      preparedStmt.setString(19, contract_expiredate);
      preparedStmt.setString(20, contract_name);
      preparedStmt.setString(21, contract_phone);
      preparedStmt.setString(22, transportation_charges);
      preparedStmt.setString(23, delivery_charges);
      preparedStmt.setString(24, " ");
      preparedStmt.setString(25, " ");
 
      preparedStmt.execute();
      
      conn.close();
      //RequestDispatcher rs = request.getRequestDispatcher("companyList.jsp");
      //rs.include(request,response);
      response.sendRedirect("companyList.jsp");
      
} catch (SQLException e) {
	 //TODO Auto-generated catch block
	e.printStackTrace();
}
}
}