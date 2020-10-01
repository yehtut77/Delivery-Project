<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
       
        
<%

HttpSession ssss=request.getSession(false);  
	 
	String staffName=(String)ssss.getAttribute("staffName");
String companyCode=(String)ssss.getAttribute("companyCode");

	String agentCode=(String)ssss.getAttribute("agentCode");
	String staffCode=(String)ssss.getAttribute("staffCode");
	
		String cond=request.getParameter("cond");

	String tno=request.getParameter("trackno");
if(cond.equals("ok")){
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

	PreparedStatement pre = connection
			.prepareStatement("Select rcvr_name,rcvr_phone,total_amt,rcvr_township  from registration where company_code=? and agent_code=? and track_num=? and stat=?");
	pre.setString(1, companyCode);
	pre.setString(2, agentCode);
	pre.setString(3, tno);
	pre.setString(4, "W");
	ResultSet rs = pre.executeQuery();
	String name="",ph="",towns="",ta="",flag="N";
	if (rs.next()) {
		
		name = rs.getString("rcvr_name");
		ph = rs.getString("rcvr_phone");
		towns = rs.getString("rcvr_township");
		ta = rs.getString("total_amt");
		flag="Y";
	
		
}
rs.close();	
pre.close();
if(flag.equals("Y")){


double dta=Double.parseDouble(ta);
 int fta=(int)dta;
 connection.close();
out.print(name+"$"+ph+"$"+towns+"$"+fta+"$");}else{out.print("N");}
}
%>