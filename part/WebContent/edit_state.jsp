<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
  <%@ page import="java.time.*" %>
    <%@ page import="java.time.format.DateTimeFormatter" %>
<%

String state_code=request.getParameter("state_code");
String township_code=request.getParameter("township_code");
String ward_code=request.getParameter("ward_code");
String street_code=request.getParameter("street_code");
String user=request.getParameter("user");
String state_name=request.getParameter("state_name");
String township_name=request.getParameter("township_name");
String ward_name=request.getParameter("ward_name");
String street_name=request.getParameter("street_name");


String check[]=request.getParameterValues("check");



DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();

//Get formatted String
String ldtString = FOMATTER.format(localDateTime);
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");



for(int i=0;i<check.length;i++){
	if(check[i].equalsIgnoreCase("state")){
		PreparedStatement p=conn.prepareStatement("Update state set state_name=?,updateby=?,modifydate=? where state_code=?");
		p.setString(1, state_name);
		p.setString(2, user);
		p.setString(3, ldtString);
		p.setString(4, state_code);
		p.execute();
	}
	
	else if(check[i].equalsIgnoreCase("township")){
		PreparedStatement p1=conn.prepareStatement("Update township set township_name=?,updateby=?,modifydate=? where state_code=? AND township_code=?");
		p1.setString(1, township_name);
		p1.setString(2, user);
		p1.setString(3, ldtString);
		p1.setString(4, state_code);
		p1.setString(5, township_code);
		p1.execute();
	}
	else if(check[i].equalsIgnoreCase("ward")){
		PreparedStatement p2=conn.prepareStatement("Update ward set ward_name=?,updateby=?,modifydate=? where state_code=? AND township_code=? AND ward_code=? ");
		p2.setString(1, ward_name);
		p2.setString(2, user);
		p2.setString(3, ldtString);
		p2.setString(4, state_code);
		p2.setString(5, township_code);
		p2.setString(6, ward_code);
		p2.execute();
	}
	else if(check[i].equalsIgnoreCase("street")){
		PreparedStatement p3=conn.prepareStatement("Update street set street_name=?,updateby=?,modifydate=? where state_code=? AND township_code=? AND ward_code=? AND street_code=?");
		p3.setString(1, street_name);
		p3.setString(2, user);
		p3.setString(3, ldtString);
		p3.setString(4, state_code);
		p3.setString(5, township_code);
		p3.setString(6, ward_code);
		p3.setString(7, street_code);
		p3.execute();
	}
	
}

	










conn.close();
  response.sendRedirect("locationList.jsp");

%>
	


















