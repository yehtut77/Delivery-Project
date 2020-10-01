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

String dn2=request.getParameter("donum");
String dn=dn2.trim();

PreparedStatement pre_agent_inbox = connection.prepareStatement("Select attachment from agent_inbox where agent_code=? and company_code=? ");
pre_agent_inbox.setString(1,agentCode);
pre_agent_inbox.setString(2,companyCode);
ResultSet rs_agent_inbox = pre_agent_inbox.executeQuery();
String filename="",real="",subfile="";
while (rs_agent_inbox.next()) {
filename=rs_agent_inbox.getString("attachment");
if(filename==null){}else{
     subfile=filename.substring(10,21);
    if(subfile.equals(dn)){real=filename;}else{}}
}
  
	pre_agent_inbox.close();

	rs_agent_inbox.close();
	connection.close();
//Runtime.getRuntime().exec("rundll32 SHELL32.DLL,ShellExec_RunDLL "+ file); 

 //out.print("A"+agentCode+"c"+companyCode+"tran"+ddate+"dn"+dn);
// out.flush();

HttpSession s=request.getSession();
				s.setAttribute("filename",real);
    response.sendRedirect("PDFV"); 
%>
</body>
</html>
