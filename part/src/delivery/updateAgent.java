package  delivery;
import java.sql.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "updateAgent", urlPatterns = {"/updateAgent"})
@MultipartConfig(maxFileSize = 169999999)   // upload file's size up to 16MB
public class updateAgent extends HttpServlet 
{ 
private static final long serialVersionUID = 1L;
PrintWriter out;
InputStream inputStream = null; 
int allField = 0;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse      response)
throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");
InputStream inputStream = null; 
System.out.println("a");
try 
{

	String updateby=request.getParameter("updateby");
	String modifydate=request.getParameter("modifydate" );
	
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


String  m_agent=request.getParameter("main_agent");
if(m_agent==null)m_agent="sub";

String  a_type=request.getParameter("agent_drop");
Part filePart = request.getPart("file");
System.out.print(updateby);
System.out.print(modifydate);

//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
//Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_pkyoedb","teamrame_pkyoe","arkar");
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

System.out.println("      *** Connection  is  successful ***");
PreparedStatement  pre=null;

pre=conn.prepareStatement("Update agent set agent_code=?,company_code=?,agent_name=?,agent_username=?,agent_password=?,agent_ownername=?,agent_addr1=?,agent_addr2=?,agent_addr3=?,agent_addr4=?,agent_postal=?,agent_township=?,agent_ward=?,agent_street=?,agent_division=?,agent_country=?,agent_phone=?,agent_email=?,agent_emergency_contact=?,agent_emergency_phone=?,parent_agent_code=?,deposit=?,agent_commissionfees=?,agent_authorizationcode=?,agent_accounttype=?,agent_bankcardtype=?,agent_bankusername=?,agent_bankacctno=?,agent_bankexprdate=?,agent_bankname=?,updatedby=?,modifydate=?,main_agent=?,type=?  where agent_code="+a_code);                            

pre.setString(1,a_code);
pre.setString(2,a_company);
pre.setString(3,a_name);
pre.setString(4,a_username);
pre.setString(5,a_password);
pre.setString(6,a_owner);
pre.setString(7,a_address1);
pre.setString(8,a_address2);
pre.setString(9,a_address3);
pre.setString(10,a_address4);
pre.setString(11,a_zip);
pre.setString(12,a_township);
pre.setString(13,a_ward);
pre.setString(14,a_street);
pre.setString(15,a_state);
pre.setString(16,a_country);
pre.setString(17,a_phone);
pre.setString(18,a_email);
pre.setString(19,a_econtact);
pre.setString(20,a_ephone);
pre.setString(21,p_agent);

pre.setString(22,a_deposit);
pre.setString(23,a_commision);
pre.setString(24,a_auth);
pre.setString(25,a_acctype);
pre.setString(26, a_card);
pre.setString(27,a_busername);
pre.setString(28,a_baccount);
pre.setString(29,a_edate);
pre.setString(30, a_bank);
pre.setString(31,updateby);
pre.setString(32,modifydate);
pre.setString(33,m_agent);
pre.setString(34,a_type);

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