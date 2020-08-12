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
		
		String company_code=request.getParameter("company_code");
		String rcvd_description=request.getParameter("rcvd_description");
		
		
		//connection=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");  
		connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

		statement=connection.createStatement();
		
		//System.out.println("payment_code="+payment_description);
		//System.out.println("payment_companycode="+payment_companycode);
		
		
		
				PreparedStatement pre=connection.prepareStatement("Select * from rcvdmode where company_code=? and rcvd_description=?");
				 
				pre.setString(1, company_code); 
				pre.setString(2, rcvd_description);
				
				 
				 ResultSet rs=pre.executeQuery();
				// System.out.println("Ok");
				
				if(rs.next())
				  {
							
					out.println("ok");			
				}
		
		
		connection.close();
	} catch (Exception e) {
e.printStackTrace();
} 
%>