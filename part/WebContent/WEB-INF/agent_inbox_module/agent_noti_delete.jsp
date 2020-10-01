<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

HttpSession ssss=request.getSession(false);  

	String companyCode=(String)ssss.getAttribute("companyCode");
	String agentCode=(String)ssss.getAttribute("agentCode");
	

 
try
{
	

Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
// Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
Statement st=conn.createStatement();
PreparedStatement preparedStmt = conn.prepareStatement("delete from agent_noti where agent_code=? and company_code=?");
preparedStmt.setString(1,agentCode);
preparedStmt.setString(2,companyCode);
preparedStmt.execute();
preparedStmt.close();
conn.close();
response.sendRedirect("AGI");  

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>