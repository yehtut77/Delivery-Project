package  delivery;
import java.sql.*;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
public class insertAgent extends HttpServlet 
{ 
private static final long serialVersionUID = 1L;
PrintWriter out;
InputStream inputStream = null; 
int allField = 0;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse      response)
throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");

//System.out.println("insertAgent||||||");
try 
{
out = response.getWriter();

String a_code=request.getParameter("agent_code");
String a_owner=request.getParameter("agent_owner" );
String a_company=request.getParameter("agent_company");
String p_agent=request.getParameter("parent_agent"  );
String a_name=request.getParameter("agent_name" );
String a_username=request.getParameter("agent_username"  );
String a_password=request.getParameter("agent_password"   );
String a_cpassword=request.getParameter("agent_cpassword"  );
String a_address1=request.getParameter("agent_address1"    );
String a_address2=request.getParameter("agent_address2"    );
String a_address3=request.getParameter("agent_address3"    );
String a_address4=request.getParameter("agent_address4"    );
String a_country=request.getParameter("agent_country" );
String a_state=request.getParameter("select1" );
String a_township=request.getParameter("select2"  );
String a_ward=request.getParameter("select3" );
if(a_ward==null)a_ward=" ";
String a_street=request.getParameter("select4"  );
if(a_street==null)a_street=" ";
String a_zip=request.getParameter("s_postcode"  );
String a_phone=request.getParameter("agent_phone"   );
String a_email=request.getParameter("agent_email"  );
String a_econtact=request.getParameter("agent_econtact"  );
String a_ephone=request.getParameter("agent_ephone"  );
String a_auth=request.getParameter("agent_auth"   );
String a_acctype=request.getParameter("agent_acctype"   );
String a_deposit=request.getParameter("agent_deposit"   );
String a_commision=request.getParameter("agent_commision"   );
String a_bank=request.getParameter("agent_bank"   );
String a_card=request.getParameter("agent_card"   );
String a_busername=request.getParameter("agent_busername"   );
String a_baccount=request.getParameter("agent_baccount"   );
String a_emonth=request.getParameter("agent_emonth");
String a_eyear=request.getParameter("agent_eyear");
String a_edate=a_emonth+"/"+a_eyear;	

Part filePart = request.getPart("agent_file");

String  m_agent=request.getParameter("main_agent");
if(m_agent==null)m_agent="sub";
String  a_type=request.getParameter("agent_drop");




HttpSession ssss=request.getSession(false); 
String staff_name=(String)ssss.getAttribute("staff_name");

DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();
 
//Get formatted String
String ldtString = FOMATTER.format(localDateTime);





//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
//Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_pkyoedb","teamrame_pkyoe","arkar");
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

PreparedStatement pre1=conn.prepareStatement("Select* from company where company_name=?");
pre1.setString(1, a_company);
ResultSet rs=pre1.executeQuery();
while(rs.next()) {
	a_company=rs.getString("company_code");
}



if (filePart != null) 
{
				/*
				 * System.out.println(filePart.getName());
				 * System.out.println(filePart.getSize());
				 * System.out.println(filePart.getContentType());
				 */inputStream = filePart.getInputStream();
}

System.out.println("      *** Connection  is  successful ***");
PreparedStatement  pre=null;

pre=conn.prepareStatement("insert into agent(agent_code,company_code,agent_name,agent_username,agent_password,agent_ownername,agent_addr1,agent_addr2,agent_addr3,agent_addr4,agent_postal,agent_township,agent_ward,agent_street,agent_division,agent_country,agent_phone,agent_email,agent_emergency_contact,agent_emergency_phone,parent_agent_code,deposit,agent_commissionfees,agent_authorizationcode,agent_accounttype,agent_bankcardtype,agent_bankusername,agent_bankacctno,agent_bankexprdate,agent_bankname,shop_pic,createdby,updatedby,createdate,modifydate,main_agent,type)"+
        "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

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
pre.setString(26,a_card);
pre.setString(27,a_busername);
pre.setString(28,a_baccount);
pre.setString(29,a_edate);
pre.setString(30,a_bank);
pre.setBlob(31,inputStream);
pre.setString(32,staff_name);
pre.setString(33," ");
pre.setString(34,ldtString);
pre.setString(35," ");
pre.setString(36,m_agent);
pre.setString(37,a_type);
pre.executeUpdate();
System.out.println("Data is successfully inserted!");

conn.close();

response.sendRedirect("agentList.jsp"); 





}
catch(Exception e)
{
out.println(e);
}   
}
}