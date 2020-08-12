<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>

<%
try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}


		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
try{
		String urname=request.getParameter("urname");	
		String module=request.getParameter("module");
		
		//connection=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");  
		connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

		statement=connection.createStatement();
		
		if(module.equals("staff"))
		{
			
			String company_code=request.getParameter("company_code");	
			String agent_code=request.getParameter("agent_code");
			System.out.println("company_code="+company_code+"||agent_code="+agent_code);
			PreparedStatement pre=connection.prepareStatement("Select staff_username from staff where staff_username=? and company_code=? and agent_code=?");
			
			pre.setString(1, urname); 
			pre.setString(2, company_code); 
			pre.setString(3, agent_code); 
			ResultSet rs_staff=pre.executeQuery();
			
			if(rs_staff.next())
				out.println("ok");
			
		}
		
	
		connection.close();
	} catch (Exception e) {
e.printStackTrace();
} 
%>