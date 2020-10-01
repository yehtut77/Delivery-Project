<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.io.File"%>
<%@page import=" java.io.FileOutputStream"%>
<%@page import=" java.io.FileInputStream"%>

<%@page import=" java.util.Base64"%>


<%@page import=" java.util.*"%>

<%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%


DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm a");
LocalDateTime localDateTime = LocalDateTime.now();
String ldtString2 = dat.format(localDateTime);

DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("yyyy/MM/dd");
//Local date time instance
LocalDateTime localDateTime2 = LocalDateTime.now();
 
//Get formatted String
String ldtString = FOMATTER.format(localDateTime2);

HttpSession ssss=request.getSession(false);  
String staff_name=(String)ssss.getAttribute("staffName");
String ccode=(String)ssss.getAttribute("companyCode");

String agent_code=(String)ssss.getAttribute("agentCode");
String staff_code=(String)ssss.getAttribute("staffCode");


	String data=request.getParameter("data64");
   Random rand = new Random(); 
        int rand_int1 = rand.nextInt(100000); 
	
 FileOutputStream fos = new FileOutputStream(new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/OFD/"+rand_int1+".pdf"));
File file =new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/OFD/"+rand_int1+".pdf");
file.mkdirs();
  String b64 =data;
  byte[] decoder = Base64.getDecoder().decode(b64);

  fos.write(decoder);
  fos.close();
  System.out.println("PDF File Saved");
 
  HttpSession s=request.getSession();
	s.setAttribute("filename",rand_int1+".pdf");
	s.setAttribute("tempo","yes");

%>