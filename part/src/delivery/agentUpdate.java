package  delivery;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "updateAgent", urlPatterns = {"/updateAgent"})
@MultipartConfig(maxFileSize = 169999999)   // upload file's size up to 16MB
public class agentUpdate extends HttpServlet 
{ 
private static final long serialVersionUID = 1L;
PrintWriter out;
InputStream inputStream = null; 
int allField = 0;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse      response)
throws ServletException, IOException {

InputStream inputStream = null; 
 		
HttpSession ssss=request.getSession(false);  
String username = (String)ssss.getAttribute("username");	
String companycode=(String)ssss.getAttribute("companyCode"); 
String companyname=(String)ssss.getAttribute("companyType"); 
String staffName=(String)ssss.getAttribute("staffName");


try 
{

	
	
	String a_code=request.getParameter("a_code");
	String a_owner=request.getParameter("a_owner" );
	String a_company=request.getParameter("a_company"   );
	String p_agent=request.getParameter("p_agent"  );
	String a_name=request.getParameter("a_name" );
	String a_username=request.getParameter("a_username"  );
	String a_password=request.getParameter("a_password"   );
	String a_cpassword=request.getParameter("a_cpassword"  );
	String a_phone=request.getParameter("a_phone"   );
	String a_email=request.getParameter("a_email"  );
	String a_econtact=request.getParameter("a_econtact"  );

	String a_address1=request.getParameter("a_a1"    );
	String a_address2=request.getParameter("a_a2"    );
	String a_address3=request.getParameter("a_a3"    );
	String a_address4=request.getParameter("a_a4"    );
	
	String a_bank=request.getParameter("a_bank"   );
	String a_card=request.getParameter("a_card"   );
	String a_busername=request.getParameter("a_busername"   );
	String a_baccount=request.getParameter("a_baccount"   );
	String emonth=request.getParameter("emonth");
	String eyear=request.getParameter("eyear");
	String  a_edate=emonth+"/"+eyear;
	String a_ephone=request.getParameter("a_ephone"  );
	String m_agent=request.getParameter("m_agent"    );


	String a_country=request.getParameter("country" );
	String a_state=request.getParameter("select1" );
	String a_township=request.getParameter("select2"  );
	String a_ward=request.getParameter("select3" );
	if(a_ward==null)a_ward="";
	String a_street=request.getParameter("select4"  );
	if(a_street==null)a_street="";
	String a_zip=request.getParameter("s_postcode"  );
	String a_auth=request.getParameter("a_auth"   );
	String a_acctype=request.getParameter("a_acctype"   );
	String a_deposit=request.getParameter("a_deposit"   );
	String a_commision=request.getParameter("a_commision"   );
	
	Part filePart = request.getPart("file");
	
	DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
	   
	//Local date time instance
	LocalDateTime localDateTime = LocalDateTime.now();										  
	 //Get formatted String
	String ldtString = FOMATTER.format(localDateTime);										  
	//System.out.println("Local Time:"+ldtString); 	

//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
//Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_pkyoedb","teamrame_pkyoe","arkar");
	Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
System.out.println("      *** Connection  is  successful ***");
PreparedStatement  pre=null;

if(p_agent==null)p_agent="0";

pre=conn.prepareStatement("Update agent set agent_code=?,agent_ownername=?,company_code=?,parent_agent_code=?,agent_name=?,agent_username=?,agent_password=?,agent_phone=?,agent_email=?,agent_emergency_contact=?,agent_addr1=?,agent_bankname=?,agent_bankcardtype=?,agent_bankusername=?,agent_bankacctno=?,agent_bankexprdate=?,agent_emergency_phone=?,agent_country=?,agent_division=?,agent_township=?,agent_ward=?,agent_street=?,agent_postal=?,agent_authorizationcode=?,agent_accounttype=?,deposit=?,agent_commissionfees=?,agent_addr2=?,agent_addr3=?,agent_addr4=?,main_agent=?,updatedby=?,modifydate=?   where agent_code="+a_code);                            

	pre.setString(1,a_code);
	pre.setString(2,a_owner);
	pre.setString(3,a_company);
	pre.setString(4,p_agent);
	pre.setString(5,a_name);
	pre.setString(6,a_username);
	pre.setString(7,a_password);
	pre.setString(8,a_phone);
	pre.setString(9,a_email);
	pre.setString(10,a_econtact);
	
	pre.setString(11,a_address1);
	pre.setString(12, a_bank);
	pre.setString(13, a_card);
	pre.setString(14,a_busername);
	pre.setString(15,a_baccount);
	pre.setString(16,a_edate);
	pre.setString(17,a_ephone);
	
	pre.setString(18,a_country);
	pre.setString(19,a_state);
	pre.setString(20,a_township);
	pre.setString(21,a_ward);
	pre.setString(22,a_street);
	pre.setString(23,a_zip);
	pre.setString(24,a_auth);
	pre.setString(25,a_acctype);
	pre.setString(26,a_deposit);
	pre.setString(27,a_commision);
	pre.setString(28,a_address2);
	pre.setString(29,a_address3);
	pre.setString(30,a_address4);
	pre.setString(31,m_agent);
	pre.setString(32,staffName);
	pre.setString(33,ldtString);
	
	pre.executeUpdate();
	System.out.println("Data is successfully inserted!");


if (filePart.getSize() != 0) 
{
	inputStream = filePart.getInputStream();

	pre=conn.prepareStatement("Update agent set shop_pic=? where agent_code="+a_code); 
	pre.setBlob(1,inputStream);

	pre.executeUpdate();
	System.out.println("Image Inserted");

}

conn.close();

response.sendRedirect("agentList.jsp"); 

}
catch(Exception e)
{
out.println(e);
}   
}
}