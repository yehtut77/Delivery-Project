<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String staff_code=request.getParameter("staff_code");

System.out.println(staff_code);
try
{
	//Class.forName("com.mysql.jdbc.Driver");
	//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
	Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

	 Statement st=conn.createStatement();	
	int i=st.executeUpdate("DELETE FROM staff WHERE staff_code="+staff_code);
	
	String query = "select count(*) from staff_exp_info WHERE staff_code="+staff_code;   
    Statement stmt=conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    rs.next();
	    int count = rs.getInt(1);
	    System.out.println("Row count="+count);
	    for(int ii=0;ii<count;ii++)
	    {
	    	Statement stmt1=conn.createStatement();	
			String sql = "DELETE FROM staff_exp_info WHERE staff_code="+staff_code;		
	      	stmt1.executeUpdate(sql);
	      	System.out.println("Delted");
	    } 
	    
	conn.close();
	
	response.sendRedirect("LLL"); 

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>