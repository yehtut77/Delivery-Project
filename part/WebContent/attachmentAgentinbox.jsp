<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %><%@page import=" java.io.File"%>
<%@page import=" java.io.FileOutputStream"%>
<%@page import=" java.io.FileInputStream"%>
<%@page import=" java.io.*"%>
<%
String addedstring=null;
HttpSession ssss=request.getSession(false);  

	String staff_name=(String)ssss.getAttribute("staffName");
String ccode=(String)ssss.getAttribute("companyCode");

	String agent_code=(String)ssss.getAttribute("agentCode");
	String staff_code=(String)ssss.getAttribute("staffCode");
	

	String idd=request.getParameter("total");

	

		Connection connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

			     PreparedStatement pre = connection.prepareStatement("Select * from agent_inbox where idagent_inbox_id=?");
				pre.setString(1, idd);
	
				ResultSet rs = pre.executeQuery();
			
				InputStream  e=null;
				while (rs.next()) {
					
					e=rs.getBinaryStream("attachment");
				}
				FileOutputStream output = new FileOutputStream(new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/DO.pdf"));
				  int r = 0;
				    while ((r = e.read()) != -1) {
		                output.write(r);}
	connection.close();
    response.sendRedirect("pfdViewer.jsp"); 



%>