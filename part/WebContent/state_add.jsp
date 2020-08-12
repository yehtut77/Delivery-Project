<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
String type=request.getParameter("type");

DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

	//Local date time instance
	LocalDateTime localDateTime = LocalDateTime.now();
	 System.out.println("hello");
	//Get formatted String
	String ldtString = FOMATTER.format(localDateTime);
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1", "root", "root");
if(type.equalsIgnoreCase("state_check")){
	
	String check=request.getParameter("check");
	PreparedStatement pre=conn.prepareStatement("Select * from state where state_name=?");
	 pre.setString(1, check); 
	 
	 ResultSet rs=pre.executeQuery();
	 if(rs.next()){
		out.println("ok");
	 }
	
}
else if(type.equalsIgnoreCase("insert_state")){
    String state_name=request.getParameter("state_name");
    String user=request.getParameter("user");
    int state_code=0;
    String final_code=null;
    Statement stmt=conn.createStatement();
    ResultSet r=stmt.executeQuery("Select* from state");
    while(r.next()){
        state_code=Integer.parseInt(r.getString("state_code"));
    }
    state_code+=1;
    final_code=String.format("%02d", state_code);
    PreparedStatement p=conn.prepareStatement("Insert into state(state_code,state_name,createby,createdate)values(?,?,?,?)");
    p.setString(1,final_code);
    p.setString(2,state_name);
    p.setString(3,user);
    p.setString(4,ldtString);
    p.execute();
    response.sendRedirect("state_division.jsp");
    
}
else if(type.equalsIgnoreCase("township_check")){
	
	String state_code=request.getParameter("state_name");
	String township_name=request.getParameter("township_name");
	PreparedStatement pp=conn.prepareStatement("Select * from township where state_code=? AND township_name=?");
	pp.setString(1, state_code);
	pp.setString(2, township_name);
	ResultSet r=pp.executeQuery();
	if(r.next()){
		out.println("ok");
	}
}
else if(type.equalsIgnoreCase("insert_township")){
	String user=request.getParameter("user");
	String state_code=request.getParameter("state_name");
	String township_name=request.getParameter("township_name");
	 Statement stmt=conn.createStatement();
	 String final_code=null;
	 int township_code=0;
	    ResultSet r=stmt.executeQuery("Select* from township where state_code="+state_code);
	    while(r.next()){
	        township_code=Integer.parseInt(r.getString("township_code"));
	    }
	    township_code+=1;
	    final_code=String.format("%02d", township_code);
	    PreparedStatement p=conn.prepareStatement("Insert into township(township_code,state_code,township_name,createby,createdate)values(?,?,?,?,?)");
	    p.setString(1,final_code);
	    p.setString(2,state_code);
	    p.setString(3,township_name);
	    p.setString(4,user);
	    p.setString(5,ldtString);
	    p.execute();
	    response.sendRedirect("state_division.jsp");
	    
}

conn.close();
%>