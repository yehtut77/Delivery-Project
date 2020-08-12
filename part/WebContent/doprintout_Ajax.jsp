<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.io.File"%>
<%@page import=" java.io.File.*"%>
<%@page import=" java.io.FileOutputStream"%>
<%@page import=" java.io.DataOutputStream"%>
<%@page import=" java.io.InputStream"%>
<%@page import=" java.io.FileInputStream"%>
<%@page import=" java.sql.Blob"%>
<%@page import=" java.util.Base64"%>
<%@page import="java.sql.PreparedStatement"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
    String acode="";String scode="";String ccode="";String ddate="";
    HttpSession ssss=request.getSession(false);
    String staffName=(String)ssss.getAttribute("staffName");
    String companyCode=(String)ssss.getAttribute("companyCode");
    String agentCode=(String)ssss.getAttribute("agentCode");
    String staffCode=(String)ssss.getAttribute("staffCode");
    
   

 Connection connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

String dn=request.getParameter("donum");
System.out.println("donum="+dn);
PreparedStatement pre_do_date = connection
.prepareStatement("Select do_date from do_hdr where do_num=? and company_code=? and agent_code=? ");
pre_do_date.setString(1, dn);
pre_do_date.setString(2, companyCode);
pre_do_date.setString(3, agentCode);
ResultSet rs_do_date = pre_do_date.executeQuery();
if (rs_do_date.next()) {

	
	ddate = rs_do_date.getString("do_date");
}

PreparedStatement pre_agent_inbox = connection.prepareStatement("Select attachment from agent_inbox where trans_date=? and agent_code=? and company_code=? ");
pre_agent_inbox.setString(1, ddate);
pre_agent_inbox.setString(2, agentCode);
pre_agent_inbox.setString(3, companyCode);
ResultSet rs_agent_inbox = pre_agent_inbox.executeQuery();
InputStream pdffile=null;
//File  file = File.createTempFile("image1", ".pdf");
File file=new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/DO.pdf");
FileOutputStream fos=new FileOutputStream(file);
byte b[];
Blob blob;
if (rs_agent_inbox.next()) {
	blob=rs_agent_inbox.getBlob("attachment");
	b=blob.getBytes(1,(int)blob.length());
	fos.write(b);
    
}
//	fos.close();
	connection.close();
//Runtime.getRuntime().exec("rundll32 SHELL32.DLL,ShellExec_RunDLL "+ file); 

 //out.print("A"+agentCode+"c"+companyCode+"tran"+ddate+"dn"+dn);
// out.flush();

    response.sendRedirect("pfdViewer.jsp"); 
%>
</body>
</html>
