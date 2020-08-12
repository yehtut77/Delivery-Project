<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %><%String f_state=request.getParameter("f_state");
		String t_state=request.getParameter("t_state");
		String f_township=request.getParameter("f_township");
		String t_township=request.getParameter("t_township");
		float weight=Float.parseFloat(request.getParameter("weight").toString());
		float size=Float.parseFloat(request.getParameter("size").toString());
		String result=null;
		System.out.println(t_state);
		
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	
	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("Select* from transportation_charges");
	while(rs.next()){
		if(f_state.equalsIgnoreCase(rs.getString("from_state_desc") )&& t_state.equalsIgnoreCase(rs.getString("to_state_desc")) && f_township.equalsIgnoreCase(rs.getString("from_township_desc")) && t_township.equalsIgnoreCase(rs.getString("to_township_desc")) && weight>=Float.parseFloat(rs.getString("from_weight")) && weight<=Float.parseFloat(rs.getString("to_weight"))  && size<=Float.parseFloat(rs.getString("max_size")))
		
	result=rs.getString("transportation_charges");
	}con.close();%>
	<%=result%>

		