<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%
String type=request.getParameter("type");
if(type.equalsIgnoreCase("user_check")){
	String username=request.getParameter("username");
String ccode=request.getParameter("ccode");
	
	Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
PreparedStatement p=conn.prepareStatement("Select username from credit_cust where username=? AND company_code=?");
p.setString(1, username);
p.setString(2, ccode);
ResultSet r=p.executeQuery();
if(r.next()){
	out.println("ok");
}
}

%>