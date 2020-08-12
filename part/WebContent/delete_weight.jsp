<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery","teamrame_yhk2","J@v@1234");
String type=request.getParameter("type");
if(type.equalsIgnoreCase("um")){

String um=request.getParameter("um");

PreparedStatement pre=conn.prepareStatement("Delete from uom where um_code=?");
pre.setString(1, um);
pre.execute();
response.sendRedirect("add_weight.jsp");}
if(type.equalsIgnoreCase("weight")){
	String u=request.getParameter("um");
	PreparedStatement pre=conn.prepareStatement("Delete from charges where charges_code=?");
	pre.setString(1, u);
	pre.execute();
	response.sendRedirect("add_weight.jsp");
}
if(type.equalsIgnoreCase("currency")){
	String u=request.getParameter("id1");
	PreparedStatement pre=conn.prepareStatement("Delete from currency where id=?");
	pre.setString(1, u);
	pre.execute();
	response.sendRedirect("currency.jsp");
}
if(type.equalsIgnoreCase("curr")){
	String u=request.getParameter("curr");
	PreparedStatement pre=conn.prepareStatement("Delete from curr_desc where curr_code=?");
	pre.setString(1, u);
	pre.execute();
	response.sendRedirect("currency.jsp");
}

conn.close();


%>