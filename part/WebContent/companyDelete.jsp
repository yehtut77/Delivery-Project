<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*,java.util.*"%>

<%
try { 
	String n=request.getParameter("company_code");

    Class.forName("com.mysql.cj.jdbc.Driver");
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1", "root", "root");
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	Statement st=conn.createStatement();

	PreparedStatement st1 = conn.prepareStatement("DELETE FROM company WHERE company_code = " + n + ";");
    st1.executeUpdate();
    response.sendRedirect("companyList.jsp"); 
    out.println("Data Deleted Successfully!");
conn.close();
} catch(Exception e) {
    System.out.println(e);
}


%>
