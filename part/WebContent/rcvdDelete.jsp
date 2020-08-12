<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String rcvd_code=request.getParameter("rcvd_code");


try
{
Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
//Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_pkyoedb","teamrame_pkyoe","arkar");
 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM rcvdmode WHERE rcvd_code="+rcvd_code);
out.println("Data Deleted Successfully!");
response.sendRedirect("rcvdList.jsp"); 
conn.close();
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>