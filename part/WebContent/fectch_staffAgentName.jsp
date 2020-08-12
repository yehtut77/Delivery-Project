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
		String c_code=request.getParameter("c_code");	
		
		 //Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
		 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234"); 
		
		int flag=0; 

		PreparedStatement pre=conn.prepareStatement("Select agent_code,agent_name from agent where company_code=?");
		pre.setString(1, c_code); 		
		ResultSet rs=pre.executeQuery();
		String code="";
		String name="";
		String agentList="";
		String agentListStart="`<option value=";
		
		String agentListStartSelected="`<option selected value=";
		
		String agentListMiddle=">";
		String agentListEnd="</option>`";  
		
		
		  while(rs.next())
		        {
		        	flag=1;
		        	code=rs.getString("agent_code");
		        	name=rs.getString("agent_name");
		        	
		        	
		        		
		        		//agentList=agentList+agentListStartSelected+code+agentListMiddle+name+agentListEnd;
		        	
		        		agentList=agentList+agentListStart+code+agentListMiddle+name+agentListEnd;
		        	
		        	
		        	
		        } 
	        
		
		
		if (flag==0)
		{
			agentList=agentList+agentListStartSelected+"00"+agentListMiddle+"No Agent"+agentListEnd;
			
		}
	        	
	        out.println(agentList);
	       
	       
	       // System.out.println(agent_name.toString());
	        conn.close();   

	} catch (Exception e) {
e.printStackTrace();
} 
%>