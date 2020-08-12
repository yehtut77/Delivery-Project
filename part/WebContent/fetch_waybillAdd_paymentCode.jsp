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
		String payment_code=request.getParameter("payment_code");
		String payment_companycode=request.getParameter("payment_companycode");
		String payment_description=request.getParameter("payment_description");
		
		System.out.println(payment_companycode);
		//connection=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");  
			connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		statement=connection.createStatement();
		
		System.out.println("payment_code="+payment_code);
		System.out.println("payment_companycode="+payment_companycode);
		
		
		
				PreparedStatement pre=connection.prepareStatement("Select * from paymentmode where company_code=? and payment_code=?");
				 
				pre.setString(1, payment_companycode); 
				pre.setString(2, payment_code);
				
				 
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