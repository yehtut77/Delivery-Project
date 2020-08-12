<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>

<%
	
List<String> agent_code= new ArrayList<String>(); 
List<String> company_code= new ArrayList<String>(); 
List<String> agent_name= new ArrayList<String>(); 
	

try{
		String postcode=request.getParameter("postcode");	
	 
		String s1=postcode.substring(0,4);
		
		
		 //Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
		 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		 
		Statement stmt = conn.createStatement();		
		ResultSet result = stmt.executeQuery("Select * from agent");
		int flag=0; 

		 
	        
	        while(result.next())
	        {
	        	String postal_code=result.getString("agent_postal");
	        	String pcode=postal_code.substring(0,4);
	        	if(pcode.equalsIgnoreCase(s1))
	        	{
	        		flag=1;
		        	agent_code.add(result.getString("agent_code"));
		        	company_code.add(result.getString("company_code"));
		        	agent_name.add(result.getString("agent_name"));
	        	}
	        	
	        } 
	        
	        if(flag==0)out.println("0");
	        else{
	        	
	        	for(int i=0;i<agent_code.size();i++)
	        	{
	        		out.print(company_code.get(i)+agent_code.get(i)+agent_name.get(i)+":");
	        	}
	        }
	        
	       // System.out.println(agent_name.toString());
	        conn.close();   

	} catch (Exception e) {
e.printStackTrace();
} 
%>