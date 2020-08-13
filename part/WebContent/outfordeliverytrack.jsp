<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
HttpSession ssss=request.getSession(false);  

String ccode=(String)ssss.getAttribute("companyCode");

String staff_code=(String)ssss.getAttribute("agentCode"); 
	String typenext=request.getParameter("barcodenum");
	String tlss=request.getParameter("tlss");
	String rec=request.getParameter("recc");

System.out.println(tlss+"KK");

String n="nothave";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

String typenexttrim=typenext.trim();
//connection=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");  
 connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

statement=connection.createStatement();


			PreparedStatement pre = connection
					.prepareStatement("Select * from registration where track_num=? and company_code=? and agent_code=?");
			pre.setString(1, typenexttrim);
			pre.setString(2, ccode);
			pre.setString(3, staff_code);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
			n="have";
			}
			
			System.out.println("GOODBADNIGH"+tlss);
			 connection.close();
			

%>
<script>
var tn = "<%=typenext%>"; 
var horn="<%=n%>";
var tlssfinal="<%=tlss%>";
var rec="<%=rec%>";
var queryString = "?para1=" + tn + "&para2=" + horn+ "&para3=" + tlssfinal+ "&para4=" + rec;
window.location.href = "outfordelivery.jsp" + queryString;
</script>
